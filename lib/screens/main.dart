// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'WelcomePage.dart';
import 'package:flutter_guide/utils/user_preferences.dart';





// void main() => runApp(Jobber());

Future main() async{
  WidgetsFlutterBinding.ensureInitialized();

  await userPreferences.init();

runApp(Jobber());
}


class Jobber extends StatelessWidget {
  static const title = 'upload Flutter To GitHub';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.blue.shade400,
        dividerColor: Colors.black,
        
      ),
      home: WelcomePage(),
    );
  }
}
