import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Widgets/dropdown_textfield.dart';

class
HomePageAddress extends StatefulWidget{
  @override
  State<HomePageAddress> createState() => _HomePageAddressState();
}

class _HomePageAddressState extends State<HomePageAddress> {
  List dropDownListData=[
    {"title":"BCA","value":"1"},
    {"title":"BBA","value":"2"},
    {"title":"B.Tech","value":"3"},
    {"title":"MCA","value":"4"},
  ];

  String defaultValue="";
  @override
  Widget build(BuildContext context){
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(left: 11),
        child: Row(
          children: [
            Icon(Icons.location_on,color: Colors.green,),


    ]),
      ));
  }}









