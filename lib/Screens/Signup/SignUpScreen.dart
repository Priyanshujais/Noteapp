import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noteapp/Screens/Signup/Blocs/SignupBlocs.dart';
import 'package:noteapp/Screens/Signup/Blocs/SignupState.dart';
import 'package:noteapp/Screens/Signup/Controllers/SignUpController.dart';
import 'package:noteapp/Widgets/ui.helper.dart';

class SignUpScreen extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Signup"),
        centerTitle: true,
      ),
      body: BlocConsumer<SignUpBlocs,SignUpState>(
        listener: (context,state){
          if(state is SignUpLoadedStates){
            return Uihelper.CustomSnackbar("Please Sign in ${state.signUpModels.data!.username}", context);

    }
          else if(state is SignUpErrorStates){
    return Uihelper.CustomSnackbar(state.error,context);
    }
    },builder:(context,state){
          if (state is SignUpLoadingStates){
            return Center (child:CircularProgressIndicator(),);
    }
          return Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
    Uihelper.CustomTextField(
    emailController, "Enter Your Email", Icons.mail_outline),
    Uihelper.CustomTextField(passController, "Enter your Password", Icons.lock),
    Uihelper.CustomTextField(usernameController, "Enter your Username", Icons.quick_contacts_mail),
    Uihelper.CustomTextField(phoneController, "Enter your Phone Number", Icons.phone),
    SizedBox(height:40,),
    ElevatedButton(onPressed: (){SignUpController.signUp(emailController.text.toString(), passController.text.toString(), usernameController.text.toString(), phoneController.text.toString(), context);
    }, child: Text("Sign Up"))
    ],
    );
    }
    )
    );
    }

}