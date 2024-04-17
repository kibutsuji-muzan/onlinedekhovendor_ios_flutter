import 'package:flutter/material.dart';
class TexttField extends StatelessWidget {
  final void Function()? onPressed;

  final icon; // Updated type to IconData?

  final String title;

  const TexttField(
      {super.key,this.onPressed,this.icon,required this.title, required controller});

  @override
  Widget build(BuildContext context) {
    return  SizedBox(height: 50,width: 260,
      child: Padding(
        padding: const EdgeInsets.only(top: 15),
        child: TextField(
          textAlign: TextAlign.center,
          decoration: InputDecoration(

              border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF03a9f4),),
                  borderRadius: BorderRadius.circular(30)
              ),
              labelText:title,
              prefixIcon:Icon(icon)
          ),
        ),
      ),
    );
  }
}
