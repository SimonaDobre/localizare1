import 'package:flutter/foundation.dart';
import 'package:localizare1/src/models/index.dart';
import 'package:localizare1/src/reducer/auth_reducer.dart';
import 'package:redux/redux.dart';

  Reducer<AppState> reducer = combineReducers(<Reducer<AppState>>[
    (AppState state, dynamic action ){
      if (kDebugMode) {
        print(action);
      }
      return state;
    },
    _reducer,
  ]);


  AppState _reducer (AppState state, dynamic action){

    return state.copyWith(
      auth: authReducer(state.auth, action),
    );
  }