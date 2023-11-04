class Bold {
  final String text;

  Bold(this.text);

  @override
  String toString() {
    return '**$text**';
  }
}

class Italic {
  final String text;

  Italic(this.text);

  @override
  String toString() {
    return '__${text}__';
  }
}

class StrikeThrough {
  final String text;

  StrikeThrough(this.text);

  @override
  String toString() {
    return '--$text--';
  }
}

class Spoiler {
  final String text;

  Spoiler(this.text);

  @override
  String toString() {
    return '--$text--';
  }
}
