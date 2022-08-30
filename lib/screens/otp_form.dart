// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_guide/screens/new_password.dart';
import 'package:flutter_guide/widgets/customize_button.dart';

import '../widgets/customized_pin_code.dart';

class OtpForm extends StatefulWidget {
  const OtpForm({Key? key}) : super(key: key);

  @override
  State<OtpForm> createState() => _OtpFormState();
}

class _OtpFormState extends State<OtpForm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: (Scaffold(
      body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Column(
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
                      child: Text("opt Verification",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 37,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                  ),
                  const Center(
                    child: Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text(
                        "check your mail for opt code! ",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 20,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  const CustomizedPinCode(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Didn't receive code",
                        style: TextStyle(
                          fontSize: 17,
                        ),

                        // style: Theme.of(context).textTheme.bodyText2,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (_) => const OtpForm()));
                        },
                        child: const Text(
                          " Resend",
                          style: TextStyle(
                            color: Color(0xff07526A),
                            fontSize: 20,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              Column(
                children: [
                  CustomizedButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const NewPassword()));
                    },
                    buttonText: "Verify",
                    textcolor: Colors.white,
                    buttonColor: Color(0xff07526A),
                  ),
                ],
              )
            ],
          )),
    )));
  }
}
