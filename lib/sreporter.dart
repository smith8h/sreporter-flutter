library sreporter;

import 'tele_reporter.dart';

class SReporter {
  static TeleService teleService({
    required String botToken,
    required String targetChat,
    int targetChatTopic = 0,
  }) {
    return TeleService(
      botToken: botToken,
      targetChat: targetChat,
      targetTopic: targetChatTopic,
    );
  }
}
