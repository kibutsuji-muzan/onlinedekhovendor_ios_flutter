import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:roundcheckbox/roundcheckbox.dart';
class progress extends StatelessWidget {
  final void Function()? onPressed;
  final String title;
  const progress(
      {super.key,this.onPressed,required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:30,right: 30,top: 30),
      child: Row(children: <Widget>[

        Container(height: 30,width: 30,
          child: RoundCheckBox(
            onTap: (selected) {},
            checkedWidget: Icon(Icons.check, color: Colors.white),
            uncheckedWidget: Icon(Icons.check),
            animationDuration: Duration(
              seconds: 1,
            ),
            checkedColor:Color(0xFF03a9f4),
          ),
        ),
        Expanded(
          child: new Container(
              child: Divider(
                color:Color(0xFF03a9f4),
                thickness: 3,
              )),
        ),
        Container(height: 30,width: 30,
          child: RoundCheckBox(
            onTap: (selected) {},
            checkedWidget: Icon(Icons.check, color: Colors.white),
            uncheckedWidget: Icon(Icons.check),
            animationDuration: Duration(
              seconds: 1,
            ),
            checkedColor:Color(0xFF03a9f4),
          ),
        ),
        Expanded(
          child: new Container(
              child: Divider(
                color: Color(0xFF03a9f4),
                thickness: 3,
              )),
        ),
        Container(height: 30,width: 30,
          child: RoundCheckBox(
            onTap: (selected) {},
            checkedWidget: Icon(Icons.check, color: Colors.white),
            uncheckedWidget: Icon(Icons.check),
            animationDuration: Duration(
              seconds: 1,
            ),
            checkedColor:Color(0xFF03a9f4),
          ),
        ),
        Expanded(
          child: new Container(
              child: Divider(
                color:Color(0xFF03a9f4),
                thickness: 3,
              )),
        ),
        Container(height: 30,width: 30,
          child: RoundCheckBox(
            onTap: (selected) {},
            checkedWidget: Icon(Icons.check, color: Colors.white),
            uncheckedWidget: Icon(Icons.check),
            animationDuration: Duration(
              seconds: 1,
            ),
            checkedColor: Color(0xFF03a9f4),
          ),
        ),

      ]),
    );
  }
}
