import 'package:flutter/material.dart';
Dialog leadDialog = Dialog(
  child: Container(
    height: 180.0,
    width: 150.0,
    color: Colors.white,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Log out from?',
            style:
            TextStyle(color: Colors.black, fontSize: 18.0,fontWeight: FontWeight.w500),
          ),
        ),
        Divider(),
        InkWell(child: Container(
          alignment: Alignment.center,
          child: Text("Current Device",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w400),),
        ),onTap: (){},),
        Divider(),
        InkWell(child: Container(
          alignment: Alignment.center,
          child: Text("All Devices",style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.w400),),
        ),onTap: (){},),
        Divider(),
        InkWell(child: Container(
          alignment: Alignment.center,
          child: Text("Cancel",style: TextStyle(color: Colors.grey,fontWeight: FontWeight.w400),),
        ),onTap: (){},),
        Divider(),
      ],
    ),
  ),
);