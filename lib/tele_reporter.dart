// ignore_for_file: constant_identifier_names, prefer_final_fields, unused_field

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  TeleReporter({
    required this.botToken,
    required this.targetChat,
    this.targetTopic = 0,
    required this.reportHeader,
    this.reportSubHeader = '',
    required this.reportMessage,
    this.reportFooter = '',
    required this.pkgInfo,
    required this.onSuccess,
    required this.onFailure,
  });

  void sendReport() {
        if (botToken.isEmpty) { onFailure(_noTokenMsg); return;}
		 if (targetChat.isEmpty) {onFailure(_noUsernameMsg); return;}
		 if (!SConnect.isDeviceConnected(context)) onFailure(noInternet);
		else try {
            String url = getFinalURL();
            URL u = new URL(url);
            SConnect.with((Activity) context)
                    .callback(new SConnectCallBack() {
                        @Override public void onSuccess(SResponse response, String tag, Map<String, Object> responseHeaders) {
                            onSuccess();
                        }

                        @Override public void onFailure(SResponse response, String tag) {
                            onFailure(failMsg);
                        }
                    })
                    .url(url).tag("sendTeleReport").get();
        } catch (MalformedURLException e) { onFailure(malformedUrl); }
    }
}
