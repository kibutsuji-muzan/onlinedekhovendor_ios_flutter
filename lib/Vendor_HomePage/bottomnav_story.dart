import 'package:flutter/material.dart';

class gifstory extends StatelessWidget {
  const gifstory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Container(
          width: double.infinity, // Occupy entire width of the screen
          height: double.infinity,

        // Occupy entire height of the screen
         child: Image.asset('assets/images/vendorstory.gif',fit: BoxFit.cover,)),

    ) ;
  }
}
