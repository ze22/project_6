import 'package:flutter/material.dart';
import 'package:flutter_guide/screens/forgot_password.dart';
import 'package:flutter_guide/screens/profile_screen.dart';
import 'package:flutter_guide/screens/signup_screen.dart';
import 'package:flutter_guide/widgets/customized_textfield.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/customize_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordControler = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
            child: Container(
                height: MediaQuery.of(context).size.height,
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.white, width: 1),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: IconButton(
                            icon: const Icon(Icons.arrow_back_sharp),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                    ),
                    const Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text("Sign in",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 27,
                              fontWeight: FontWeight.bold,
                            )),
                      ),
                    ),
                    // Padding(
                    //   padding: EdgeInsets.all(10.0),
                    //   child: TextField(
                    //     controller: _emailController,
                    //     // keyboardType: TextInputType.emailAddress,
                    //     decoration: const InputDecoration(
                    //       fillColor: Color(0xffFFFFFF),
                    //       filled: true,
                    //       hintText: "Enter Email",
                    //       prefixIcon: Icon(Icons.mail, color: Colors.black),
                    //       // border: OutlineInputBorder(
                    //       //     borderRadius: BorderRadius.circular(10)),
                    //     ),
                    //   ),
                    // ),
                    CustomizedTextfield(
                      myController: _emailController,
                      hintText: "Enter Mail",
                      isPassword: false,
                      // prefixIcon: const Icon(Icons.mail, color: Colors.black),
                    ),
                    CustomizedTextfield(
                      myController: _passwordControler,
                      hintText: "Enter Password",
                      isPassword: true,
                      // prefixIcon: const Icon(Icons.lock, color: Colors.black),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: Padding(
                        padding: const EdgeInsets.all(10),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ForgotPassword()));
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ),
                    CustomizedButton(
                      buttonText: "Login",
                      buttonColor: const Color(0xff07526A),
                      textcolor: Colors.white,
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => const ProfileScreen()));
                      },
                    ),
                    // SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.height * 0.17,
                            color: Colors.grey,
                          ),
                          const Text("or Login with"),
                          Container(
                            height: 1,
                            width: MediaQuery.of(context).size.height * 0.2,
                            color: Colors.grey,
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              icon: const Icon(
                                Icons.facebook,
                                color: Colors.blue,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.google,
                                // color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          Container(
                            height: 40,
                            width: 60,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.transparent, width: 1),
                                borderRadius: BorderRadius.circular(10)),
                            child: IconButton(
                              icon: const Icon(
                                FontAwesomeIcons.apple,
                                // color: Colors.black,
                              ),
                              onPressed: () {},
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 200,
                    ),
                    // const Spacer(
                    //   flex: 1,
                    // ),
                    // const SizedBox(
                    //   height: 50,
                    // ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(58, 8, 8, 8.0),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Don't have  an account?",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 17,
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (_) => const SignUpScreen()));
                            },
                            child: const Text(
                              " Register",
                              style: TextStyle(
                                color: Color(0xff07526A),
                                fontSize: 20,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )),
          )),
    );
  }
}
