class MessageWithoutChat {
  // String? sender;
  String? content;
  String? createdAt;
  String? updatedAt;
  String? id;

  MessageWithoutChat({
    // required this.sender,
    required this.content,
    required this.createdAt,
    required this.updatedAt,
    this.id,
  });

  factory MessageWithoutChat.fromJson(Map<String, dynamic> json) {
    return MessageWithoutChat(
      // sender: json['sender'] as String,
      content: json['content'] as String,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      id: json['_id'] as String,
    );
  }
}
