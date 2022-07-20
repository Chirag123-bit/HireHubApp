class Message {
  String? sender;
  String? content;
  String? chat;
  String? createdAt;
  String? updatedAt;
  String? id;

  Message({
    required this.sender,
    required this.content,
    required this.createdAt,
    required this.chat,
    required this.updatedAt,
    this.id,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      sender: json['sender'] as String,
      content: json['content'] as String,
      chat: json['content'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      id: json['_id'] as String,
    );
  }
}
