import 'package:flutter/material.dart';

class signButton extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const signButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 170,
      height: 40,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.blueGrey, backgroundColor: Colors.white,
          //textStyle: Colors.,
          side: const BorderSide(
            color: Colors.grey,
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
