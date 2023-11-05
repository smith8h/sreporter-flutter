// ignore_for_file: constant_identifier_names, prefer_final_fields, unused_field

class TeleService {
  static const int USER_INFO = 0;
  static const int CUSTOM = 1;

  final String botToken, targetChat;
  int targetTopic;

  String reportMessage,
      reportHeader,
      reportSubHeader,
      reportFooter;

  final String _noTokenMsg = 'NO BOT TOKEN PROVIDED!',
      _noUsernameMsg = 'NO TARGET CHAT USERNAME/ID PROVIDED!',
      _failMsg = 'REPORT SEND FAILED! CHECK YOUR INTERNET CONNECTION.',
      _malformedUrl = 'MALFORMED URL! CHECK URL AGAIN.',
      _noBodyMsg = 'NO REPORT MESSAGE PROVIDED BY THE USER!',
      _noInternet = 'NO INTERNET CONNECTION!';

  TeleService({
    required this.botToken,
    required this.targetChat,
    this.targetTopic = 0,
    required this.reportHeader,
    this.reportSubHeader = '',
    required this.reportMessage,
    this.reportFooter = '',
  });
}
