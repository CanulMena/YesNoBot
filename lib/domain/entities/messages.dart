enum FromQuo { hers, me }

class Message{
  final String text;
  final String? urlApi;
  final FromQuo fromQuo;

  Message({
    required this.text,
    required this.fromQuo,
    this.urlApi
    });
}