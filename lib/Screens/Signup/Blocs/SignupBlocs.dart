import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/src/bloc.dart';
import 'package:noteapp/Screens/Signup/Blocs/SignupEvents.dart';
import 'package:noteapp/Screens/Signup/Blocs/SignupState.dart';
import 'package:http/http.dart' as http;
import 'package:noteapp/Screens/Signup/Models/signup.dart';
import 'package:noteapp/Utills/baseurl.dart';

class SignUpBlocs extends Bloc<SignUpEvents, SignUpState> {
  SignUpBlocs() : super(SignUpInitialStates());
  signUp(String email, String password, String username,
      String phonenumber) async {
    emit(SignUpLoadingStates());
    final response = await http.post(Uri.parse(BaseUrl.signup),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "email": email,
          "password": password,
          "username": username,
          "phonenumber": phonenumber,
        }));

    if (response.statusCode == 200) {
      Map<String, dynamic> responsedata = jsonDecode(response.body);
      SignUpModel signUpModel = SignUpModel.fromJson(responsedata);
      emit(SignUpLoadedStates(signUpModels: signUpModel));
    } else {
      Map<String, dynamic> responseerror = jsonDecode(response.body);
      emit(SignUpErrorStates(error: responseerror['message']));
    }
  }
}