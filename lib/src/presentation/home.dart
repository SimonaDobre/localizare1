import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart'; // pt StoreProvider
import 'package:localizare1/src/epics/app_epics.dart';
import 'package:localizare1/src/models/index.dart';
import 'package:localizare1/src/presentation/chat_page.dart';
import 'package:localizare1/src/presentation/containers/user_container.dart';
import 'package:localizare1/src/presentation/home_page.dart';
import 'package:localizare1/src/presentation/login_page.dart';
import 'package:localizare1/src/reducer/reducer.dart';
import 'package:redux/redux.dart';
import 'package:redux_epics/redux_epics.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    // todo: display Login or HomePage

    return UserContainer(
      builder: (BuildContext context, AppUser? user) {
        if (user == null){
          return const LoginPage();
        } else {
          return const HomePage();
        }
      },);
  }
}