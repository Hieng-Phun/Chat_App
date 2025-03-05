// ignore_for_file: file_names

class ChatMessageEntity {
  String id;
  String? text;
  String? imageUrl;
  Author author;
  int createAt;

  ChatMessageEntity({
    required this.id,
    this.text,
    required this.createAt,
    this.imageUrl,
    required this.author,
  });

  factory ChatMessageEntity.fromJson(Map<String, dynamic> json) {
    return ChatMessageEntity(
      id: json['id'],
      createAt: json['createAt'],
      author: Author.fromJson(json['author']),
      text: json['text'],
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
