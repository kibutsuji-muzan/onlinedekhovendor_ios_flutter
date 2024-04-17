import 'package:flutter/material.dart';

class helpButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const helpButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white, backgroundColor: Color(0xFF03a9f4),

          //textStyle: Colors.,
          side: const BorderSide(
            color: Color(0xFF03a9f4),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: onPressed,
        child: Text(title),
      ),
    );
  }
}
