library sreporter;

import 'dart:ui';
import 'package:package_info_plus/package_info_plus.dart';
import 'tele_reporter.dart';

class SReporter {
  static Future<TeleReporter> teleReporter({
    required String botToken,
    required String targetChat,
    int targetChatTopic = 0,
    required String reportHeader,
    String reportSubHeader = '',
    required String reportMessage,
    String reportFooter = '',
    required VoidCallback onSuccess,
    required Function(String) onFailure,
  }) async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    return TeleReporter(
      botToken: botToken,
      targetChat: targetChat,
      targetTopic: targetChatTopic,
      reportHeader: reportHeader,
      reportSubHeader: reportSubHeader,
      reportMessage: reportMessage,
      reportFooter: reportFooter,
      pkgInfo: packageInfo,
      onFailure: onFailure,
      onSuccess: onSuccess,
    );
  }
}
