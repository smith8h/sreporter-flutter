import 'package:http/http.dart';

Future<bool> isInternetConnected() async {
  try {
    Response response = await get(Uri.parse('https://telegram.org/'));
    return response.statusCode == 200;
  } catch (e) {
    return false;
  }
}

class TeleBold {
  final String text;

  TeleBold(this.text);

  @override
  String toString() {
    return '<b>$text</b>';
  }
}

class TeleItalic {
  final String text;

  TeleItalic(this.text);

  @override
  String toString() {
    return '<i>$text</i>';
  }
}

class TeleStrikeThrough {
  final String text;

  TeleStrikeThrough(this.text);

  @override
  String toString() {
    return '<s>$text</s>';
  }
}

class TeleSpoiler {
  final String text;

  TeleSpoiler(this.text);

  @override
  String toString() {
    return '<tg-spoiler>$text</tg-spoiler>';
  }
}

class TeleUnderline {
  final String text;

  TeleUnderline(this.text);

  @override
  String toString() {
    return '<u>$text</u>';
  }
}

class TeleCode {
  final String text;
  final String lang;

  TeleCode(this.text, {this.lang = ''});

  @override
  String toString() {
    return lang.isNotEmpty
        ? '<pre language="$lang">$text</pre>'
        : '<code>$text</code>';
  }
}

// class DiscEmbed {
//   final String _title, _description, _url;
//   final int _color;
//   final FooterEmbed? _footer;
//   final ThumbnailEmbed? _thumbnail;
//   final ImageEmbed? _image;
//   final AuthorEmbed? _author;
//   final List<FieldEmbed>? _fields;
//   final TimestampEmbed? _timestamp;

//   DiscEmbed(
//       {required String title,
//       required String description,
//       required String url,
//       required int color,
//       AuthorEmbed? author,
//       ImageEmbed? image,
//       ThumbnailEmbed? thumbnail,
//       List<FieldEmbed>? inlineFields,
//       FooterEmbed? footer,
//       TimestampEmbed? timestamp})
//       : _title = title,
//         _description = description,
//         _url = url,
//         _color = color,
//         _author = author,
//         _image = image,
//         _thumbnail = thumbnail,
//         _footer = footer,
//         _timestamp = timestamp,
//         _fields = inlineFields;

//   String get title => _title;

//   String get description => _description;

//   String get url => _url;

//   FooterEmbed? get footerEmbed => _footer;

//   List<FieldEmbed>? get fieldEmbeds => _fields;

//   ImageEmbed? get imageEmbed => _image;

//   AuthorEmbed? get authorEmbed => _author;

//   ThumbnailEmbed? get thumbnailEmbed => _thumbnail;

//   TimestampEmbed? get timestamp => _timestamp;

//   int get color => _color;
// }

// class FooterEmbed {
//   final String _text;
//   final String _iconUrl;

//   FooterEmbed({required String text, required String iconUrl})
//       : _text = text,
//         _iconUrl = iconUrl;

//   String get text => _text;

//   String get iconURL => _iconUrl;
// }

// class TimestampEmbed {
//   final DateTime _timestamp;

//   TimestampEmbed({required DateTime timestamp}) : _timestamp = timestamp;

//   String get timestamp {
//     return '${_timestamp.month}-${_timestamp.day}-${_timestamp.year} '
//         '${_timestamp.hour}:${_timestamp.minute}';
//   }
// }

// class ThumbnailEmbed {
//   final String _url;
//   final int _height, _width;

//   ThumbnailEmbed({required String url, required int width, required int height})
//       : _url = url,
//         _width = width,
//         _height = height;

//   String get url => _url;

//   int get width => _width;

//   int get height => _height;
// }

// class ImageEmbed {
//   final String _url;
//   final int _height, _width;

//   ImageEmbed({required String url, required int width, required int height})
//       : _url = url,
//         _width = width,
//         _height = height;

//   String get url => _url;

//   int get width => _width;

//   int get height => _height;
// }

// class AuthorEmbed {
//   final String _name, _url, _iconUrl;

//   AuthorEmbed({
//     required String name,
//     required String url,
//     required String iconUrl,
//   })  : _name = name,
//         _url = url,
//         _iconUrl = iconUrl;

//   String get name => _name;

//   String get url => _url;

//   String get iconURL => _iconUrl;
// }

// class FieldEmbed {
//   final String _name;
//   final String _value;
//   final bool _inline;

//   FieldEmbed({
//     required String name,
//     required String value,
//     bool inline = false,
//   })  : _name = name,
//         _value = value,
//         _inline = inline;

//   String get name => _name;

//   String get value => _value;

//   bool get inline => _inline;
// }
