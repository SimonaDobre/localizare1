import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart'; // pt StoreProvider
import 'package:localizare1/src/data/auth_api.dart';
import 'package:localizare1/src/epics/app_epics.dart';
import 'package:localizare1/src/models/index.dart';
import 'package:localizare1/src/presentation/chat_page.dart';
import 'package:localizare1/src/presentation/containers/user_container.dart';
import 'package:localizare1/src/presentation/home.dart';
import 'package:localizare1/src/presentation/home_page.dart';
import 'package:localizare1/src/presentation/login_page.dart';
import 'package:localizare1/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

void main() {

  final AuthApi authApi = AuthApi();
  final AppEpics epics = AppEpics(authApi: authApi);

  final Store<AppState> store = Store<AppState>(
      reducer,
      initialState: AppState(),
      middleware: <Middleware<AppState>>[
    EpicMiddleware<AppState>(epics.epic),
  ]);

  runApp( GroupApp(store: store));
}

class GroupApp extends StatelessWidget {
  const GroupApp({super.key,required this.store});

  final Store<AppState> store;

  @override
  Widget build(BuildContext context) {
    return StoreProvider<AppState>(
      store: store,
      child: MaterialApp(
        title: 'titlul meu',
        routes: <String, WidgetBuilder>{
          '/': (BuildContext context) => const Home(),
          '/chat': (BuildContext context) => const ChatPage(),
        },
      ),
    );
  }
}


