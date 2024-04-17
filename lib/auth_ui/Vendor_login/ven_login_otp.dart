import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
class otpfield extends StatelessWidget {
  final Function(String) onSubmitCallback;
  final String title;
  const otpfield(
      {super.key,required this.onSubmitCallback,required this.title});

  @override


  Widget build(BuildContext context) {
    return  OtpTextField(
      numberOfFields: 6,
      borderColor: Colors.grey,
      focusedBorderColor: Colors.lightBlueAccent,
      showFieldAsBox: true,

      onCodeChanged: (String code) {

      },
      //runs when every textfield is filled
       onSubmit: (String verificationCode){
         onSubmitCallback(verificationCode);

      }, // end onSubmit
    );
  }
}
