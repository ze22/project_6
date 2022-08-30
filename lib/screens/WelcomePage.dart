// ignore: file_names
import 'package:flutter/material.dart';
import 'package:flutter_guide/screens/login_screen.dart';
import 'package:flutter_guide/screens/signup_screen.dart';
import 'package:flutter_guide/widgets/customize_button.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: double.infinity,
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage("assets/background.png"),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        color: Color(0xff07526A),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          const SizedBox(
            height: 60,
            width: 220,
            child: Image(
              image: AssetImage(
                "assets/welcome.png",
              ),
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 45,
          ),
          CustomizedButton(
            buttonText: "Login",
            buttonColor: Colors.white,
            textcolor: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const LoginScreen()));
            },
          ),
          CustomizedButton(
            buttonText: "Register",
            buttonColor: Colors.white,
            textcolor: Colors.black,
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (_) => const SignUpScreen()));
            },
          ),
          // SizedBox(
          //   height: 30,
          // ),
          // Padding(padding: const EdgeInsets.all(10.0))
          // const Text(
          //   "",
          //   style: TextStyle(color: Color(0xFF07526A), fontSize: 30),
          // )
        ]),
      ),
    );
  }
}
