// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'WelcomePage.dart';


void main() => runApp(Jobber());

//void main(){
// runApp(MyApp())
//}


class Jobber extends StatelessWidget {
  static const title = 'upload Flutter To GitHub';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // theme: ThemeData(
      //   primaryColor: Colors.blue.shade300,
      // ),
      home: WelcomePage(),
    );
  }
}
