enum FromWho {
  me,
  your,
}

class Message {
  final String text;
  String? imageUrl;
  final FromWho fromWho;

  Message({
    required this.text,
    required this.fromWho,
    this.imageUrl,
  });
}
