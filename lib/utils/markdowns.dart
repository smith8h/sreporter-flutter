class Bold {
  final String text;

  Bold(this.text);

  @override
  String toString() {
    return '<b>$text</b>';
  }
}

class Italic {
  final String text;

  Italic(this.text);

  @override
  String toString() {
    return '<i>$text</i>';
  }
}

class StrikeThrough {
  final String text;

  StrikeThrough(this.text);

  @override
  String toString() {
    return '<s>$text</s>';
  }
}

class Spoiler {
  final String text;

  Spoiler(this.text);

  @override
  String toString() {
    return '||$text||';
  }
}

class Underline {
  final String text;

  Underline(this.text);

  @override
  String toString() {
    return '<u>$text</u>';
  }
}

class Code {
  final String text;
  final String lang;

  Code(this.text, {this.lang = ''});

  @override
  String toString() {
    String txt;
    if (lang.isNotEmpty) {
      txt = """```$lang
$text
```""";
    } else {
      txt = "`$text`";
    }
    return txt;
  }
}
