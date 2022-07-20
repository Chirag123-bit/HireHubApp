class ChatModel {
  String name;
  String icon;
  bool isGroup;
  String time;
  String currentMessage;
  bool select = false;
  String? id;

  ChatModel({
    required this.name,
    required this.icon,
    required this.isGroup,
    required this.time,
    required this.currentMessage,
    this.select = false,
    this.id,
  });
}
