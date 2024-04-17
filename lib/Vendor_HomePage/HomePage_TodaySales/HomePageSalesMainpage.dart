
import 'package:flutter/material.dart';

import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
 import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_TodaySales/HomePage_salesCard.dart';
import 'package:onlinedkhovendor/Widgets/DailymonthweekCustomTabs.dart';



class TodaySales extends StatelessWidget {
  @override
  Widget build(BuildContext context) {


    Widget body =  Column(
      children: [
        HomePageTop(),
        customtabs()


      ],
    );



    return BootomNavHome(context,  body); // Pass the body widget
  }
}

