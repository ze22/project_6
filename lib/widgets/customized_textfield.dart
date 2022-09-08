import 'package:flutter/material.dart';

class CustomizedTextfield extends StatelessWidget {
   TextEditingController myController;
  final String? hintText;
  final bool? isPassword;
  
  // bool obscure = false;
  // final bool? myController;
  bool _containsANumber = false;
  bool _numberofDigits = false;

  CustomizedTextfield(
      {Key? key, required this.myController, this.hintText, this.isPassword})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextField(
        keyboardType: isPassword!
            ? TextInputType.visiblePassword
            : TextInputType.emailAddress,
        enableSuggestions: isPassword! ? false : true,
        autocorrect: isPassword! ? false : true,
        obscureText: isPassword ?? false,
        controller: myController,
        // onChanged: (value) {
        //   setState
        //   _numberofDigits = value.length < 6 ? false : true;
        // },
        // keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          prefixIcon: isPassword!
              ? IconButton(
                  icon: const Icon(Icons.lock, color: Colors.grey),
                  onPressed: () {},
                )
              : null,
              

          suffixIcon: isPassword!
              ? IconButton(
                  icon: const Icon(Icons.remove_red_eye, color: Colors.grey),
                  onPressed: () {
                    // obscure = !isPassword!;
                  },
                )
              : null,
          
          // enabledBorder: OutlineInputBorder(
          //     borderSide: const BorderSide(color: Color(0xffffffff), width: 1),
          //     borderRadius: BorderRadius.circular(10)),
          // focusedBorder: OutlineInputBorder(
          //     borderSide: BorderSide(color: Color(0xffffff), width: 1),
          //     borderRadius: BorderRadius.circular(10)),
          fillColor: const Color(0xffFFFFFF),
          filled: true,
          hintText: hintText,
          
          // prefixIcon:
          //     myController ? const Icon(Icons.mail, color: Colors.black),: null,
          // border: OutlineInputBorder(
          //     borderRadius: BorderRadius.circular(10)),
        ),
        
      ),
    );
  }
}
