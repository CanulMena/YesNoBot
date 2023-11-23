enum FromQuo { hers, me }

class Message{
  final String text;
  final String? imageUrl;
  final FromQuo fromQuo;

  Message({
    required this.text,
    required this.fromQuo,
    this.imageUrl
    });
}