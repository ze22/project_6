// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter_guide/screens/profile_screen.dart';
import 'package:flutter_guide/screens/registeration%20_form.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import '../widgets/customize_button.dart';
import '../widgets/customized_textfield.dart';
import 'login_screen.dart';
import 'search_screen.dart';
import '../providers/auth.dart';
import '../models/http_exception.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  Map<String, String> _authData = {
    'email': '',
    'password': '',
  };
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  var _isLoading = false;
  void _showErrorDialog(String message) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Text('An Error Occurred!'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text('Okay'),
            onPressed: () {
              Navigator.of(ctx).pop();
            },
          )
        ],
      ),
    );
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) {
      // Invalid!
      return;
    }
    _formKey.currentState!.save();
    setState(() {
      _isLoading = true;
    });
    try {
      // Sign user up
      await Provider.of<Auth>(context, listen: false).signup(
        _authData['email']!,
        _authData['password']!,
      );
    } on HttpException catch (error) {
      var errorMessage = 'Authentication failed';
      if (error.toString().contains('EMAIL_EXISTS')) {
        errorMessage = 'This email address is already in use.';
      } else if (error.toString().contains('INVALID_EMAIL')) {
        errorMessage = 'This is not a valid email address';
      } else if (error.toString().contains('WEAK_PASSWORD')) {
        errorMessage = 'This password is too weak.';
      } else if (error.toString().contains('EMAIL_NOT_FOUND')) {
        errorMessage = 'Could not find a user with that email.';
      } else if (error.toString().contains('INVALID_PASSWORD')) {
        errorMessage = 'Invalid password.';
      }
      _showErrorDialog(errorMessage);
    } catch (error) {
      const errorMessage =
          'Could not authenticate you. Please try again later.';
      _showErrorDialog(errorMessage);
    }
  }

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
                //  CustomizedTextfield(
                //    myController: _userNameController,
                //    hintText: "Username",
                //    isPassword: false,
                // prefixIcon: const Icon(Icons.mail, color: Colors.black),
                //  ),
                //CustomizedTextfield(
                //  myController: _emailController,
                //  hintText: "Email",
                //  isPassword: false,
                // prefixIcon: const Icon(Icons.lock, color: Colors.black),
                //  ),
                // CustomizedTextfield(
                //   myController: _passwordController,
                //   hintText: "Password",
                //   isPassword: true,
                // prefixIcon: const Icon(Icons.lock, color: Colors.black),
                //  ),
                //  CustomizedTextfield(
                //    myController: _confirmPasswordController,
                //    hintText: "Confirm Password",
                //    isPassword: true,
                // prefixIcon: const Icon(Icons.lock, color: Colors.black),
                //  ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'E-Mail'),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value!.isEmpty || !value.contains('@')) {
                      return 'Invalid email!';
                    }
                  },
                  onSaved: (value) {
                    _authData['email'] = value!;
                  },
                ),
                TextFormField(
                  decoration: InputDecoration(labelText: 'Password'),
                  obscureText: true,
                  controller: _passwordController,
                  validator: (value) {
                    if (value!.isEmpty || value.length < 5) {
                      return 'Password is too short!';
                    }
                  },
                  onSaved: (value) {
                    _authData['password'] = value!;
                  },
                ),
                TextFormField(
                    decoration: InputDecoration(labelText: 'Confirm Password'),
                    obscureText: true,
                    validator: (value) {
                      if (value != _passwordController.text) {
                        return 'Passwords do not match!';
                      }
                    }),
                CustomizedButton(
                  buttonText: "Register",
                  buttonColor: const Color(0xff07526A),
                  textcolor: Colors.white,
                  onPressed: () {
                    () => _submit();
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
