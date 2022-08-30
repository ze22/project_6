import 'package:flutter/material.dart';

class CustomizedButton extends StatelessWidget {
  final String? buttonText;
  final Color? buttonColor;
  final Color? textcolor;
  final VoidCallback? onPressed;
  const CustomizedButton(
      {Key? key,
      this.buttonText,
      this.buttonColor,
      this.textcolor,
      this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: onPressed,
        child: Container(
            height: 50,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: buttonColor,
                border: Border.all(
                    width: 1, color: const Color.fromARGB(255, 6, 118, 138)),
                borderRadius: BorderRadius.circular(10)),
            child: Center(
                child: Text(
              buttonText!,
              style: TextStyle(
                color: textcolor,
                fontSize: 20,
              ),
            ))),
      ),
    );
  }
}
