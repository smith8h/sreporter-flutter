import 'dart:ui';
import 'package:sreporter/utils/disc_embeds.dart';
import 'package:sreporter/utils/utils.dart';

class DiscReporter {
  final String _webhook, _content, _username, _avatarUrl;
  bool _tts;
  final List<DiscEmbed> embeds = [];
  VoidCallback _onSuccess;
  Function(String failMsg) _onFailure;
  Map<String, dynamic> headers = {};
  Map<String, dynamic> params = {};

  DiscReporter({
    required String webhook,
    required String content,
    String reportUserName = 'SReporter',
    String reportUserAvatar =
        "https://te.legra.ph/file/7735c9a6b574efcb10ae4.jpg",
    bool tts = false,
    required VoidCallback onSuccess,
    required Function(String failMsg) onFaiure,
  })  : _webhook = webhook,
        _content = content,
        _username = reportUserName,
        _avatarUrl = reportUserAvatar,
        _tts = tts,
        _onSuccess = onSuccess,
        _onFailure = onFaiure;

  void addEmbed(DiscEmbed embed) {
    embeds.add(embed);
  }

  void sendReport() async {
    bool noInternet = !(await isInternetConnected());
    if (noInternet) {
      _onFailure('NO INTERNET CONNECTION!');
    } else if (_content.isEmpty) {
      _onFailure('NO CONTENT PROVIDED!');
    } else if (_webhook.isEmpty) {
      _onFailure('NO DISCORD WEBHOOK PROVIDED!');
    } else {
      params["content"] = _content;
      params["username"] = _username;
      params["avatar_url"] = _avatarUrl;
      params["tts"] = _tts;

              if (embeds.isNotEmpty) {
                  List<Map<String, dynamic>> embedObjects = [];

                  embeds.forEach((embed) {
                      Map<String, dynamic> embedObject = {};

                      embedObject["title"] = embed.title;
                      embedObject["description"] = embed.description;
                      embedObject["url"] = embed.url;

      //                 DiscEmbed.Footer footer = embed.getFooterEmbed();
      //                 DiscEmbed.Image image = embed.getImageEmbed();
      //                 DiscEmbed.Thumbnail thumbnail = embed.getThumbnailEmbed();
      //                 DiscEmbed.Author author = embed.getAuthorEmbed();
      //                 List<DiscEmbed.Field> fields = embed.getFields();

      //                 if (footer != null) {
      //                     HashMap<String, Object> jsonFooter = new HashMap<>();
      //                     jsonFooter.put("text", footer.getText());
      //                     jsonFooter.put("icon_url", footer.getIconURL());
      //                     embedObject.put("footer", jsonFooter);
      //                 }

      //                 if (image != null) {
      //                     HashMap<String, Object> jsonImage = new HashMap<>();
      //                     jsonImage.put("url", image.getURL());
      //                     embedObject.put("image", jsonImage);
      //                 }

      //                 if (thumbnail != null) {
      //                     HashMap<String, Object> jsonThumbnail = new HashMap<>();
      //                     jsonThumbnail.put("url", thumbnail.getURL());
      //                     embedObject.put("thumbnail", jsonThumbnail);
      //                 }

      //                 if (author != null) {
      //                     HashMap<String, Object> jsonAuthor = new HashMap<>();
      //                     jsonAuthor.put("name", author.getName());
      //                     jsonAuthor.put("url", author.getURL());
      //                     jsonAuthor.put("icon_url", author.getIconURL());
      //                     embedObject.put("author", jsonAuthor);
      //                 }

      //                 List<HashMap<String, Object>> jsonFields = new ArrayList<>();
      //                 for (DiscEmbed.Field field : fields) {
      //                     HashMap<String, Object> jsonField = new HashMap<>();
      //                     jsonField.put("name", field.getName());
      //                     jsonField.put("value", field.getValue());
      //                     jsonField.put("inline", field.isInline());
      //                     jsonFields.add(jsonField);
      //                 }

      //                 embedObject.put("fields", jsonFields.toArray());
      //                 embedObjects.add(embedObject);
      //             });

      //             params.put("embeds", embedObjects.toArray());
      //             connect.params(params, SConnect.PARAM);
      //         }

      //         headers.put("Content-Type", "application/json");
      //         headers.put("User-Agent", "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/97.0.4692.99 Safari/537.36");
      //         connect.headers(headers).tag("SendingDiscordReport").post();
      //     }
      // }
    }
  }
}
  