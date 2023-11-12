// ignore_for_file: constant_identifier_names, prefer_final_fields, unused_field

import 'dart:convert';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:sreporter/utils/utils.dart';

class TeleReporter {
  static const int USER_INFO = 0;
  static const int CUSTOM = 1;

  final String _botToken,
      _targetChat,
      _reportMessage,
      _reportHeader,
      _reportSubHeader,
      _reportFooter;
  int _targetTopic;

  final String _noTokenMsg = 'NO BOT TOKEN PROVIDED!',
      _noUsernameMsg = 'NO TARGET CHAT USERNAME/ID PROVIDED!',
      _malformedUrl = 'MALFORMED URL! CHECK URL AGAIN.',
      _noBodyMsg = 'NO REPORT MESSAGE PROVIDED BY THE USER!',
      _noInternet = 'NO INTERNET CONNECTION!';

  VoidCallback _onSuccess;
  Function(String failMsg) _onFailure;

  bool _disableWebPagePreview;

  TeleReporter({
    required String botToken,
    required String targetChat,
    int targetTopic = 0,
    required String reportHeader,
    String reportSubHeader = '',
    required String reportMessage,
    String reportFooter = '',
    bool disableWebPagePreview = true,
    required VoidCallback onSuccess,
    required Function(String failMsg) onFailure,
  })  : _botToken = botToken,
        _targetChat = targetChat,
        _targetTopic = targetTopic,
        _reportHeader = reportHeader,
        _reportSubHeader = reportSubHeader,
        _reportMessage = reportMessage,
        _reportFooter = reportFooter,
        _disableWebPagePreview = disableWebPagePreview,
        _onSuccess = onSuccess,
        _onFailure = onFailure;

  void report() async {
    bool internet = await isInternetConnected();
    if (!internet) {
      _onFailure(_noInternet);
    } else if (_targetChat.isEmpty) {
      _onFailure(_noUsernameMsg);
    } else if (_botToken.isEmpty) {
      _onFailure(_noTokenMsg);
    } else {
      try {
        Response response = await get(Uri.parse(_getFinalURL()));
        if (response.statusCode == 200) {
          _onSuccess();
        } else {
          var res = jsonDecode(response.body);
          _onFailure(
              'TELEGRAM REPORT FAILED TO SEND! ErrorCode: ${res['error_code']}, ErrorMessage: "${res['description']}".');
        }
      } catch (e) {
        _onFailure(_malformedUrl);
      }
    }
  }

  String _getFinalURL() {
    String finalUrl = "https://api.telegram.org/bot$_botToken"
        "/sendMessage?chat_id=$_targetChat"
        "&text=${Uri.encodeFull(_getFinalReport())}";

    if (_targetTopic > 0) finalUrl += "&message_thread_id=$_targetTopic";

    finalUrl += "&parse_mode=HTML&disable_web_page_preview=true";

    return finalUrl;
  }

  String _getFinalReport() {
    String buffer = '${Bold(_reportHeader)}\n';
    if (_reportSubHeader.isNotEmpty) buffer += '$_reportSubHeader\n';
    buffer += '\n${Bold('Message:')}\n';
    if (_reportMessage.isEmpty) {
      buffer += '$_noBodyMsg\n\n';
    } else {
      buffer += '$_reportMessage\n\n';
    }
    if (_reportFooter.isNotEmpty) buffer += "${Bold('More Info:')}\n";
    buffer += _reportFooter;

    return buffer;
  }
}
