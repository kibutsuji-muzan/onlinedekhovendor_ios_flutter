import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class checkbox extends StatefulWidget {
  final void Function()? onPressed;
  final String title;
  const checkbox(
      {super.key,this.onPressed,required this.title});

  @override
  State<checkbox> createState() => _checkboxState();
}

class _checkboxState extends State<checkbox> {
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    return  Checkbox(
      value: _checkbox,
      activeColor: Colors.blue,
      side:BorderSide(color: Colors.blue),
      onChanged: (value) {
        setState(() {
          _checkbox = true;
        });
      },
    );
  }
}
