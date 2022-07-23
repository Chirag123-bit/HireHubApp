import 'package:hirehub/models/Chat/MessageModelWithoutChat.dart';
import 'package:hirehub/models/Users.dart';

class Chat {
  String? chatName;
  List<User>? users;
  bool? isGroupChat;
  MessageWithoutChat? latestMessage;
  User? groupAdmin;
  // String? createdAt;
  // String? updatedAt;
  String? id;

  Chat({
    this.chatName,
    this.users,
    this.isGroupChat,
    this.latestMessage,
    this.groupAdmin,
    // this.createdAt,
    // this.updatedAt,
    this.id,
  });

  factory Chat.fromJson(Map<String, dynamic> json) {
    return Chat(
      chatName: json['chatName'] as String,
      users: json['users'] != null
          ? (json['users'] as List).map((i) => User.fromJson(i)).toList()
          : null,
      isGroupChat: json['isGroupChat'] as bool,
      latestMessage: json['latestMessage'] != null
          ? MessageWithoutChat.fromJson(json['latestMessage'])
          : null,
      groupAdmin:
          json['groupAdmin'] != null ? User.fromJson(json['groupAdmin']) : null,
      // createdAt: json['created_at'] as String,
      // updatedAt: json['updated_at'] as String,
      id: json['_id'] as String,
    );
  }
}
