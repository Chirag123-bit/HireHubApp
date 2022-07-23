// ignore: file_names
import 'package:hirehub/models/Chat/MessageModel.dart';

class FetchMessagesResponse {
  List<Message>? messages;

  FetchMessagesResponse({this.messages});

  factory FetchMessagesResponse.fromJson(Map<String, dynamic> json) {
    return FetchMessagesResponse(
      messages: json['data'] != null
          ? (json['data'] as List).map((i) => Message.fromJson(i)).toList()
          : null,
    );
  }
}
