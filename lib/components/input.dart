import 'package:flutter/material.dart';

class Input extends StatefulWidget {
  Input({super.key, required this.controller});

  TextEditingController controller;

  @override
  _InputState createState() => _InputState();
}

class _InputState extends State<Input> {
  

  

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      showCursor: true,
      readOnly: true,
      autofocus: true,
      textAlignVertical: TextAlignVertical.center,
      textAlign: TextAlign.right,
      textDirection: TextDirection.ltr,
      maxLines: 4,
      style: const TextStyle(fontSize: 30, color: Colors.white),
      cursorColor: Colors.green,
      decoration: const InputDecoration(
        filled: true,
        fillColor: Colors.black,
        contentPadding: EdgeInsets.all(30),
      ),
    );
  }
}
