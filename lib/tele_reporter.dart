// ignore_for_file: constant_identifier_names, prefer_final_fields, unused_field

import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:sreporter/utils/markdowns.dart';

class TeleReporter {
  static const int USER_INFO = 0;
  static const int CUSTOM = 1;

  final String botToken, targetChat;
  int targetTopic;

  String reportMessage, reportHeader, reportSubHeader, reportFooter;

  final String _noTokenMsg = 'NO BOT TOKEN PROVIDED!',
      _noUsernameMsg = 'NO TARGET CHAT USERNAME/ID PROVIDED!',
      _failMsg = 'REPORT SEND FAILED! CHECK YOUR INTERNET CONNECTION.',
      _malformedUrl = 'MALFORMED URL! CHECK URL AGAIN.',
      _noBodyMsg = 'NO REPORT MESSAGE PROVIDED BY THE USER!',
      _noInternet = 'NO INTERNET CONNECTION!';

  final PackageInfo pkgInfo;

  VoidCallback onSuccess;
  Function(String failMsg) onFailure;

  bool diableWebPagePreview;

  TeleReporter({
    required this.botToken,
    required this.targetChat,
    this.targetTopic = 0,
    required this.reportHeader,
    this.reportSubHeader = '',
    required this.reportMessage,
    this.reportFooter = '',
    this.diableWebPagePreview = true,
    required this.pkgInfo,
    required this.onSuccess,
    required this.onFailure,
  });

  void report() async {
    bool internet = await isInternetConnected();
    if (botToken.isEmpty) {
      onFailure(_noTokenMsg);
    } else if (targetChat.isEmpty) {
      onFailure(_noUsernameMsg);
    } else if (!internet) {
      onFailure(_noInternet);
    } else {
      try {
        Response response = await get(Uri.parse(getFinalURL()));
        if (response.statusCode == 200) {
          onSuccess();
        } else {
          onFailure(_failMsg);
        }
      } catch (e) {
        onFailure(_malformedUrl);
      }
    }
  }

  Future<bool> isInternetConnected() async {
    try {
      Response response = await get(Uri(scheme: 'https', host: 'github.com'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }

  String getFinalURL() {
    String finalUrl = "https://api.telegram.org/bot$botToken"
        "/sendMessage?chat_id=$targetChat"
        "&text=${Uri.encodeFull(getFinalReport())}";

    if (targetTopic > 0) finalUrl += "&message_thread_id=$targetTopic";

    finalUrl += "&parse_mode=MarkDown&disable_web_page_preview=true";

    return finalUrl;
  }

  String getFinalReport() {
    String buffer = '${Bold(reportHeader)}\n';
    if (reportSubHeader.isNotEmpty) buffer += '$reportSubHeader\n';
    buffer += '\n${Bold('Message:')}\n';
    if (reportMessage.isEmpty) {
      buffer += '$_noBodyMsg\n\n';
    } else {
      buffer += '$reportMessage\n\n';
    }
    if (reportFooter.isNotEmpty) buffer += "${Bold('More Info:')}\n";
    buffer += reportFooter;

    return buffer;
  }
}
