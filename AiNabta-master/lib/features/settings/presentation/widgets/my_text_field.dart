import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  TextEditingController? txt = new TextEditingController();
  bool r;

  MyTextField({required this.txt, required this.r});

  Widget build(BuildContext context) {
    return TextField(
      controller: txt,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      readOnly: r,
      decoration: InputDecoration(
        fillColor: Colors.green,
        filled: true,
      ),
    );
  }
}
