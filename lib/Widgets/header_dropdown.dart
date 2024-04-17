import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/models/ShopDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class header_dropdown extends StatefulWidget {
  @override
  State<header_dropdown> createState() => _header_dropdownState();
}

class _header_dropdownState extends State<header_dropdown> {
  //const header_dropdown({super.key});
var data=[];
var _value=1;
       var dynamicData = [];
        void initState() {
          super.initState();
          DropDownShopAddress();
        }

      DropDownShopAddress() async{
          var complete_url= appConstant.ShopDetails;
          SharedPreferences prefs = await SharedPreferences.getInstance();
          var vendor_id = prefs.getString(storepref.vendor_id_key)?? '';
          var response=await CallApi().getData("10602",complete_url);
          final body = response.body;
          final json = jsonDecode(body);

          if(json['response']==200){

             setState(() {
               dynamicData =  json['Result'].map((value) => value['servicename'].toString()).toList();

             });
          }
        }
        @override
       Widget build(BuildContext context) {

    return Scaffold(
      body: Column(
        children: [

//
// DropdownButton(items: item
//     , onChanged: onChanged)



//           DropdownButton(items: dynamicData.map((e) {
// print(e);
//             return DropdownMenuItem(child: Text(e),);
//           }).toList(),
// value: ,
//               onChanged: (v){
//               })

        ],
      ),
    );
  }
}
