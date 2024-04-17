import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/models/serviceDetailModel.dart';
import 'package:shared_preferences/shared_preferences.dart';


class HomeTopToggleButton extends StatefulWidget{


  @override
  State<HomeTopToggleButton> createState() => _HomeTopToggleButtonState();
}

class _HomeTopToggleButtonState extends State<HomeTopToggleButton> {
  late ServiceDetailModel shopDetail = ServiceDetailModel('', '', '');

  @override
  void initState() {

    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Switch(
        value: shopDetail.status == 'active',
        onChanged: (value) async {
          setState(() {
            shopDetail.status = value ? 'active' : 'deactived';
          });
          String status = value ? 'active' : 'deactived';
          /////////get vendorid with sp. and pas it on servicetoggle and also resturcture api .
         // String serviceId = shopDetail.serviceid!;
          await servicetoggle( status);

        },
      ),
    );
  }

  Future<void> servicetoggle( String status) async {
    var completeUrl = appConstant.ServiceStatusUpdate;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key)?? '';


    var data = {
      "vendorid":vendor_id,
      "status": status,
    };
    var response = await CallApi().postData(data, completeUrl);
    final body = response.body;
    final json = jsonDecode(body);
    if (json['response'] == 200) {
      print('shop status updated');
    } else {
      print('something went wrong');
    }
  }
}

