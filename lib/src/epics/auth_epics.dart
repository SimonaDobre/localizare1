import 'package:localizare1/src/actions/index.dart';
import 'package:localizare1/src/data/auth_api.dart';
import 'package:localizare1/src/models/index.dart';
import 'package:redux_epics/redux_epics.dart';
import 'package:rxdart/transformers.dart';

class AuthEpics {

  const AuthEpics(this._api);
  final AuthApi _api;

  Epic<AppState> get epic {
    return combineEpics(<Epic<AppState>>[
      TypedEpic<AppState, LoginStart>(_loginStart),

    ]);
  }


  Stream<dynamic> _loginStart(Stream<LoginStart> actions, EpicStore<AppState> store) {

    return actions.flatMap((LoginStart action) {
      return Stream<void>.value(null)
          .asyncMap((_) => _api.login(email: action.email, password: action.password))
      .map((AppUser user) => Login.successful(user))
      .onErrorReturnWith((Object error, StackTrace stackTrace) => Login.error(error, stackTrace));
    });
  }
}