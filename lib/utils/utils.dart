import 'package:http/http.dart';

Future<bool> isInternetConnected() async {
    try {
      Response response = await get(Uri(scheme: 'https', host: 'github.com'));
      return response.statusCode == 200;
    } catch (e) {
      return false;
    }
  }