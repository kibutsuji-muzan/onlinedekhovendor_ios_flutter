import 'package:flutter/material.dart';
class ElevateButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const ElevateButton(
      {super.key,this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20,

      child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
            ),
            backgroundColor: Color(0xFF03a9f4),
          ),
          child: Text(title)),
    );

  }
}









