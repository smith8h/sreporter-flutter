import 'package:flutter_test/flutter_test.dart';
import 'package:sreporter/sreporter.dart';
import 'package:sreporter/utils/utils.dart';

void main() {
  test('DONE', () {
    SReporter.teleReporter(
      botToken: '195211143...',
      targetChat: '14888...', // or mention username '@smith8h'
      reportHeader: 'Report sent from ${TeleItalic('Demo App')}.',
      reportSubHeader:
          '${TeleSpoiler('${TeleUnderline('Flutter-Demo')}')}', // optional
      reportMessage: '${TeleCode('Custom.message')}',
      reportFooter: 'Footer...', // optional
      onSuccess: () {},
      onFailure: (msg) {
        expect(msg,
            'TELEGRAM REPORT FAILED TO SEND! ErrorCode: 404, ErrorMessage: "Not Found".');
      },
    ).report();
  });
}
