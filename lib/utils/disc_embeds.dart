// ignore_for_file: unused_field

class DiscEmbed {
  final String _title, _description, _url;
  final FooterEmbed? _footer;
  final ThumbnailEmbed? _thumbnail;
  final ImageEmbed? _image;
  final AuthorEmbed? _author;
  final List<FieldEmbed> _fields;

  DiscEmbed({
    required String title,
    required String description,
    required String url,
    AuthorEmbed? authorEmbed,
    ImageEmbed? imageEmbed,
    ThumbnailEmbed? thumbnailEmbed,
    List<FieldEmbed> fieldEmbeds = const [],
    FooterEmbed? footerEmbed,
  })  : _title = title,
        _description = description,
        _url = url,
        _author = authorEmbed,
        _image = imageEmbed,
        _thumbnail = thumbnailEmbed,
        _footer = footerEmbed,
        _fields = fieldEmbeds;

  String get title => _title;

  String get description => _description;

  String get url => _url;

  FooterEmbed? get footerEmbed => _footer;

  List<FieldEmbed>? get fieldEmbeds => _fields;

  ImageEmbed? get imageEmbed => _image;

  AuthorEmbed? get authorEmbed => _author;

  ThumbnailEmbed? get thumbnailEmbed => _thumbnail;
}

class FooterEmbed {
  final String _text;
  final String _iconUrl;

  FooterEmbed(String text, String iconUrl)
      : _text = text,
        _iconUrl = iconUrl;

  String get text => _text;

  String get iconURL => _iconUrl;
}

class ThumbnailEmbed {
  final String _url;

  ThumbnailEmbed({required String url}) : _url = url;

  String get url => _url;
}

class ImageEmbed {
  final String _url;

  ImageEmbed({required String url}) : _url = url;

  String get url => _url;
}

class AuthorEmbed {
  final String _name, _url, _iconUrl;

  AuthorEmbed({
    required String name,
    required String url,
    required String iconUrl,
  })  : _name = name,
        _url = url,
        _iconUrl = iconUrl;

  String get name => _name;

  String get url => _url;

  String get iconURL => _iconUrl;
}

class FieldEmbed {
  final String _name;
  final String _value;
  final bool _inline;

  FieldEmbed({
    required String name,
    required String value,
    bool inline = false,
  })  : _name = name,
        _value = value,
        _inline = inline;

  String get name => _name;

  String get value => _value;

  bool get inline => _inline;
}
