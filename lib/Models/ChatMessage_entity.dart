// ignore_for_file: file_names

class ChatMessageEntity {
  int id;
  String text;
  String? imageUrl;
  Author author;
  int createAt;

  ChatMessageEntity({
    required this.id,
    required this.text,
    required this.createAt,
    this.imageUrl,
    required this.author,
  });
}

class Author {
  String name;

  Author({required this.name});
}
