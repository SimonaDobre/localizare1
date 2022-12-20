import 'package:localizare1/src/models/index.dart';

class AuthApi {

  Future<AppUser> login({ required String email,required String password}) async {

    // login
    return AppUser(uid: 'uid', email: email, displayName: email.split('@').first);
  }

}