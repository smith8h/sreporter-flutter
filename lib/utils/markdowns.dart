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
    return '<tg-spoiler>$text</tg-spoiler>';
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
    return lang.isNotEmpty
        ? '<pre language="$lang">$text</pre>'
        : '<code>$text</code>';
  }
}
