import 'package:flutter/material.dart';
import 'package:flutter_guide/screens/login_screen.dart';
import 'package:flutter_guide/screens/otp_form.dart';
import 'package:flutter_guide/widgets/customize_button.dart';
import 'package:flutter_guide/widgets/customized_textfield.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  // ignore: prefer_final_fields
  TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
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
                child: Text("Forgot Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Please enter your correct email to receive verification Code to reset the password",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 20,
                  // fontWeight: FontWeight.bold,
                ),
              ),
            ),
            CustomizedTextfield(
              myController: _emailController,
              hintText: "Enter Mail",
              isPassword: false,
            ),
            CustomizedButton(
              buttonText: "Send Code",
              buttonColor: const Color(0xff07526A),
              textcolor: Colors.white,
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (_) => const OtpForm()));
              },
            ),
            const Spacer(
              flex: 1,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(88, 8, 8, 8.0),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Remember password",
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
                        color: Color(0xff07526A),
                        fontSize: 20,
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
