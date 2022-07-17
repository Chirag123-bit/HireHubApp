import 'package:local_auth/local_auth.dart';

class LocalAuthApi {
  static final _auth = LocalAuthentication();

  static Future<bool> authenticate() async {
    // return await _auth.authenticate(
    //   localizedReason: 'Scan your fingerprint to authenticate',
    //   useErrorDialogs: true,
    //   stickyAuth: true,
    // );
    return false;
  }
}
