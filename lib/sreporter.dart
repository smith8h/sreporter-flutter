library sreporter;

import 'tele_reporter.dart';

class SReporter {
  static TeleService teleService({
    required String botToken,
    required String targetChat,
    int targetChatTopic = 0,
    required String reportHeader,
    String reportSubHeader = '',
    required String reportMessage,
    String reportFooter = '',
  }) {
    return TeleService(
      botToken: botToken,
      targetChat: targetChat,
      targetTopic: targetChatTopic,
      reportHeader: reportHeader,
      reportSubHeader: reportSubHeader,
      reportMessage: reportMessage,
      reportFooter: reportFooter,
    );
  }
}
