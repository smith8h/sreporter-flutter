library sreporter;

import 'package:flutter/foundation.dart';
import 'package:sreporter/disc_reporter.dart';
import 'tele_reporter.dart';

class SReporter {
  static TeleReporter teleReporter({
    required String botToken,
    required String targetChat,
    int targetChatTopic = 0,
    required String reportHeader,
    String reportSubHeader = '',
    required String reportMessage,
    String reportFooter = '',
    required VoidCallback onSuccess,
    required Function(String) onFailure,
  }) {
    return TeleReporter(
      botToken: botToken,
      targetChat: targetChat,
      targetTopic: targetChatTopic,
      reportHeader: reportHeader,
      reportSubHeader: reportSubHeader,
      reportMessage: reportMessage,
      reportFooter: reportFooter,
      onFailure: onFailure,
      onSuccess: onSuccess,
    );
  }

  static DiscReporter discReporter({
    required String webhook,
    required String contentMessage,
    required VoidCallback onSucess,
    required Function(String failMsg) onFailure,
    String reportUserName = 'SReporter',
    String reportUserIcon =
        "https://te.legra.ph/file/7735c9a6b574efcb10ae4.jpg",
    bool tts = false,
    // List<DiscEmbed> embeds = const [],
  }) {
    return DiscReporter(
      webhook: webhook,
      content: contentMessage,
      onSuccess: onSucess,
      onFaiure: onFailure,
      reportUserName: reportUserName,
      reportUserIcon: reportUserIcon,
      tts: tts,
      // embeds: embeds,
    );
  }
}
