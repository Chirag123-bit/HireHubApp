import 'package:dio/dio.dart';
import 'package:hirehub/APIs/HttpServices.dart';
import 'package:hirehub/response/ChatResponse/FetchChatResponse.dart';
import 'package:hirehub/response/ChatResponse/MessageFetchResponse.dart';
import 'package:hirehub/utils/url.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ChatsAPI {
  Future _getToken() async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    var storedToken = sharedPreferences.getString('token');
    return storedToken;
  }

  Future<FetchChatResponse?> getChats() async {
    FetchChatResponse? fetchChatsResponse;
    var url = baseUrl + chatsUrl;
    var dio = HttpServices().getDioInstance();
    var token = await _getToken();
    try {
      Response response = await dio.get(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
      );
      if (response.statusCode == 200) {
        fetchChatsResponse = FetchChatResponse.fromJson(response.data);
      } else {
        fetchChatsResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return fetchChatsResponse;
  }

  Future<String?> getChatId(String userId) async {
    var url = baseUrl + chatsUrl;
    var dio = HttpServices().getDioInstance();
    var token = await _getToken();
    String? fetchChatsResponse;
    try {
      Response response = await dio.post(
        url,
        options: Options(
          headers: {
            'Content-Type': 'application/json',
            'Accept': 'application/json',
            'Authorization': 'Bearer ' + token
          },
        ),
        data: {"userId": userId},
      );
      if (response.statusCode == 200) {
        fetchChatsResponse = response.data["data"];
      } else {
        fetchChatsResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return fetchChatsResponse;
  }

  Future<FetchMessagesResponse?> getMessages(String chatId) async {
    FetchMessagesResponse? fetchChatsResponse;
    var url = baseUrl + messagesUrl + "/$chatId";
    var dio = HttpServices().getDioInstance();
    var token = await _getToken();
    try {
      Response response = await dio.get(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
      );
      if (response.statusCode == 200) {
        fetchChatsResponse = FetchMessagesResponse.fromJson(response.data);
      } else {
        fetchChatsResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return fetchChatsResponse;
  }

  Future<FetchMessagesResponse?> sendMessages(
      String chatId, String content) async {
    FetchMessagesResponse? fetchChatsResponse;
    var url = baseUrl + messagesUrl;
    var dio = HttpServices().getDioInstance();
    var token = await _getToken();
    try {
      Response response = await dio.post(
        url,
        options: Options(headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer ' + token
        }),
        data: {"content": content, "chatId": chatId},
      );
      if (response.statusCode == 200) {
        fetchChatsResponse = FetchMessagesResponse.fromJson(response.data);
      } else {
        fetchChatsResponse = null;
      }
    } catch (e) {
      print(e);
    }
    return fetchChatsResponse;
  }
}
