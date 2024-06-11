import 'dart:convert';
import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/src/bloc.dart';

import 'package:http/http.dart' as http;
import 'package:noteapp/Screens/Signup/Models/signup.dart';
import 'package:noteapp/Utills/baseurl.dart';

import '../Model/LogInModel.dart';
import 'LogInEvents.dart';
import 'LogInState.dart';

class LogInBlocs extends Bloc<LogInEvents, LogInStates> {
  LogInBlocs() : super(LogInInitialStates());
  LogIn(String email, String password, ) async {
    emit(LogInLoadingStates());
    final response = await http.post(Uri.parse(BaseUrl.login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
        }));

    if (response.statusCode == 200) {
      Map<String, dynamic> responsedata = jsonDecode(response.body);
      LogInModel logInModel = LogInModel.fromJson(responsedata);
      log(responsedata.toString());
      emit(LogInLoadedStates (logInModel: logInModel));
    } else {
      Map<String, dynamic> responseerror = jsonDecode(response.body);
      log(responseerror.toString());
      emit(LogInErrorStates(error: responseerror['message']));
    }
  }
}
