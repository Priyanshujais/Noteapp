import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Screens/Signup/Blocs/SignupBlocs.dart';
import 'package:noteapp/Widgets/ui.helper.dart';
import 'package:flutter/material.dart';

class SignUpController {
  static signUp(String email, String password, String username,
      String phonenumber, BuildContext context) {

    if (email == " " || password == " " || username == " " || phonenumber == " ") {
      return Uihelper.CustomSnackbar("Enter Required Field's", context);
    } else {
      context.read<SignUpBlocs>().signUp(
          email, password, username, phonenumber);
    }

  }
}
