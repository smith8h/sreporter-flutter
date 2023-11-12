// ignore_for_file: unused_local_variable, avoid_function_literals_in_foreach_calls, unused_field

import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart';
import 'package:sreporter/utils/utils.dart';

class DiscReporter {
  final String _webhook, _content, _username, _avatarUrl;
  final bool _tts;
  // final List<DiscEmbed> _embeds;
  final VoidCallback _onSuccess;
  final Function(String failMsg) _onFailure;

  DiscReporter({
    required String webhook,
    required String content,
    String reportUserName = 'SReporter',
    String reportUserIcon =
        'https://te.legra.ph/file/7735c9a6b574efcb10ae4.jpg',
    bool tts = false,
    // List<DiscEmbed> embeds = const [],
    required VoidCallback onSuccess,
    required Function(String failMsg) onFaiure,
  })  : _webhook = webhook,
        _content = content,
        _username = reportUserName,
        _avatarUrl = reportUserIcon,
        _tts = tts,
        _onSuccess = onSuccess,
        _onFailure = onFaiure;
  // _embeds = embeds;

  void report() async {
    bool internet = await isInternetConnected();
    if (!internet) {
      _onFailure('NO INTERNET CONNECTION!');
    } else if (_content.isEmpty) {
      _onFailure('NO REPORT CONTENT PROVIDED!');
    } else if (_webhook.isEmpty) {
      _onFailure('NO DISCORD WEBHOOK PROVIDED!');
    } else {
      final Map<String, dynamic> params = {
        'content': _content,
        'username': _username,
        'avatar_url': _avatarUrl,
        'tts': _tts,
        // 'embeds': buildEmbedObjects(_embeds),
      };

      final Map<String, String> headers = {
        'Content-Type': 'application/json',
        'User-Agent':
            'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML] like Gecko) Chrome/97.0.4692.99 Safari/537.36',
      };

      Response response = await post(Uri.parse(_webhook),
          headers: headers, body: jsonEncode(params));
      if (response.statusCode == 200 || response.statusCode == 204) {
        _onSuccess();
      } else {
        _onFailure(
            'DISCORD REPORT FAILED TO SEND! ErrorCode: ${response.statusCode}, ErrorMessage: "${response.body}".');
      }
    }
  }

  // buildEmbedObjects(List<DiscEmbed> embeds) {
  //   var embedObjects = [];

  //   for (DiscEmbed embed in embeds) {
  //     FooterEmbed? footer = embed.footerEmbed;
  //     ImageEmbed? image = embed.imageEmbed;
  //     ThumbnailEmbed? thumbnail = embed.thumbnailEmbed;
  //     AuthorEmbed? author = embed.authorEmbed;
  //     List<FieldEmbed>? fields = embed.fieldEmbeds;
  //     TimestampEmbed? timestamp = embed.timestamp;

  //     Map<String, Object> embedObject = {
  //       'type': 'rich',
  //       'title': embed.title,
  //       'description': embed.description,
  //       'url': embed.url,
  //       'color': embed.color,
  //       'footer': footer != null
  //           ? {
  //               'text': footer.text,
  //               'icon_url': footer.iconURL,
  //             }
  //           : {},
  //       'image': image != null
  //           ? {
  //               'url': image.url,
  //               'height': image.height,
  //               'width': image.width,
  //             }
  //           : {},
  //       'thumbnail': thumbnail != null
  //           ? {
  //               'url': thumbnail.url,
  //               'height': thumbnail.height,
  //               'width': thumbnail.width,
  //             }
  //           : {},
  //       'author': author != null
  //           ? {
  //               'name': author.name,
  //               'url': author.url,
  //               'icon_url': author.iconURL,
  //             }
  //           : {},
  //       'timestamp': timestamp != null ? timestamp.timestamp : '',
  //     };

  //     var jsonFields = [];
  //     fields?.forEach((field) {
  //       var jsonField = {
  //         'name': field.name,
  //         'value': field.value,
  //         'inline': field.inline,
  //       };
  //       jsonFields.add(jsonField);
  //     });
  //     embedObject['fields'] = jsonFields;

  //     embedObjects.add(embedObject);
  //   }

  //   return embedObjects;
  // }
}
