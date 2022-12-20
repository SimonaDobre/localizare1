import 'package:localizare1/src/actions/index.dart';
import 'package:localizare1/src/data/auth_api.dart';
import 'package:localizare1/src/epics/auth_epics.dart';
import 'package:localizare1/src/models/index.dart';
import 'package:redux_epics/redux_epics.dart';

class AppEpics {
  const AppEpics({required this.authApi});

  final AuthApi authApi;

  Epic<AppState> get epic {
    return combineEpics(<Epic<AppState>>[
      //TypedEpic<AppState, LoginStart>(_loginStart),
      AuthEpics(authApi).epic
    ]);
  }




}