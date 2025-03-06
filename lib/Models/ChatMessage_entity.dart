// ignore_for_file: file_names

class ChatMessageEntity {
  String id;
  String? text;
  String? imageUrl;
  int createAt;
  Author author;

  ChatMessageEntity({
    required this.id,
    this.text,
    this.imageUrl,
    required this.createAt,
    required this.author,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      id: json['id'],
      text: json['text'],
      createAt: json['createAt'],
      author: Author.fromJson(json['author']),
      imageUrl: json['imageUrl'],
    );
  }
}

class Author {
  String name;

  Author({required this.name});

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(name: json['name']);
  }
}
