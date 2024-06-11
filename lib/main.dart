import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Screens/Homescreens/HomeScreen.dart';
import 'Screens/Login/Blocs/LogInBlocs.dart';
import 'Screens/Login/LogInScreen.dart';
import 'Screens/Signup/Blocs/SignupBlocs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(create: (_)=>LogInBlocs(),),
      BlocProvider(create: (_)=>SignUpBlocs(),),

    ],
      child: ScreenUtilInit(
        child: MaterialApp(
          title: 'Notes App',
          home: Loginscreen(),
        ),
      ),
    );
  }
}
