import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
 class image extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const image(
      {super.key,this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return     Padding(
      padding: const EdgeInsets.only(left: 25),
      child: Row(
        children: [
          Container(height: 80,width: 140,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                //set border radius more than 50% of height and width to make circle
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Center(child: Text('Front Side',style: TextStyle(fontSize: 14),)),
                  ),
                  Icon(Icons. camera_alt_outlined),
                ],
              ),
            ),
          ),
          Container(height: 80,width: 140,
            child: Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
                //set border radius more than 50% of height and width to make circle
              ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text('Back Side',style: TextStyle(fontSize: 14),),
                  ),
                  Icon(Icons. camera_alt_outlined),
                ],
              ),
            ),
          ),
        ],
      ),
    );



  }
}
