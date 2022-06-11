import 'package:hirehub/APIs/UserAPI.dart';
import 'package:hirehub/models/Users.dart';

class UserRepository {
  Future<bool> registerUser(User user) async {
    return await UserAPI().registerUser(user);
  }

  Future<bool> loginUser(User user) async {
    return await UserAPI().loginUser(user);
  }
}
