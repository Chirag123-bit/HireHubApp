import 'package:hirehub/APIs/UserAPI.dart';
import 'package:hirehub/models/Users.dart';
import 'package:hirehub/response/LoginResponse.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<LoginResponse?> loginUser(User user) async {
    return await UserAPI().loginUser(user);
  }
}
