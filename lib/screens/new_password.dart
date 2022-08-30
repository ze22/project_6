import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_guide/screens/login_screen.dart';
import 'package:flutter_guide/widgets/customized_textfield.dart';
import 'package:flutter_guide/widgets/customize_button.dart';

class NewPassword extends StatefulWidget {
  const NewPassword({Key? key}) : super(key: key);

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmNewPasswordController =
      TextEditingController();
  bool obscure = false;

  bool _containsANumber = false;
  bool _numberofDigits = false;

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
                child: Text("Reset Password",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 37,
                      fontWeight: FontWeight.bold,
                    )),
              ),
            ),
            const Align(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "please Enter your new password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 17,
                  ),
                ),
              ),
            ),
            CustomizedTextfield(
              myController: _newPasswordController,
              hintText: "enter new password",
              isPassword: true,
            ),
            CustomizedTextfield(
              myController: _confirmNewPasswordController,
              hintText: "confirm new password",
              isPassword: true,
            ),
            Column(
              children: [
                CustomizedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()));
                  },
                  buttonText: "Change password",
                  textcolor: Colors.white,
                  buttonColor: Color(0xff07526A),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
