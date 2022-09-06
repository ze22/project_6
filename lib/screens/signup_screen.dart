// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_guide/screens/profile_screen.dart';
import 'package:flutter_guide/screens/registeration%20_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/customize_button.dart';
import '../widgets/customized_textfield.dart';
import 'login_screen.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

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
                    child: Text("Register",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 37,
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
                  myController: _userNameController,
                  hintText: "Username",
                  isPassword: false,
                  // prefixIcon: const Icon(Icons.mail, color: Colors.black),
                ),
                CustomizedTextfield(
                  myController: _emailController,
                  hintText: "Email",
                  isPassword: false,
                  // prefixIcon: const Icon(Icons.lock, color: Colors.black),
                ),
                CustomizedTextfield(
                  myController: _passwordController,
                  hintText: "Password",
                  isPassword: true,
                  // prefixIcon: const Icon(Icons.lock, color: Colors.black),
                ),
                CustomizedTextfield(
                  myController: _confirmPasswordController,
                  hintText: "Confirm Password",
                  isPassword: true,
                  // prefixIcon: const Icon(Icons.lock, color: Colors.black),
                ),
                CustomizedButton(
                  buttonText: "Register",
                  buttonColor: const Color(0xff07526A),
                  textcolor: Colors.white,
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const ProfileScreen()));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      Container(
                        height: 1,
                        width: MediaQuery.of(context).size.height * 0.14,
                        color: Colors.grey,
                      ),
                      const Text("or Register with"),
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
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
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
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.black, width: 1),
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
                        height: 60,
                        width: 100,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey, width: 1),
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
                const SizedBox(
                  height: 50,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(48, 8, 8, 8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Text(
                        "Already have  an account?",
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
                                  builder: (_) => const LoginScreen()));
                        },
                        child: const Text(
                          " Login",
                          style: TextStyle(
                            color: Colors.green,
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
