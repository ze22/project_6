import 'dart:ffi';

import 'package:flutter/material.dart';



class TextFieldWidget extends StatefulWidget {
  final int maxLines;
  final String label;
  final String text;
  final ValueChanged<String> onChanged;
  const TextFieldWidget({
    Key? key,
    this.maxLines = 1,
    required this.label,
    required this.text,
    required this.onChanged
  }) : super(key: key);

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();

    controller = TextEditingController(text: widget.text);
  }

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }



  @override
  Widget build(BuildContext context) => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
    Text(
      widget.label,
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
    ),
    SizedBox(height: 7),
    TextField(
      controller: controller,
      decoration: InputDecoration(
        border: OutlineInputBorder()
      ),

    maxLines: widget.maxLines,
    ),
  ],
  );
}