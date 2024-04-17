import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_ButtonsTabbar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_CarouselSlider.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Vendor_Marketing/market_widget.dart';
 import 'package:onlinedkhovendor/Widgets/modalBottomSheet.dart';

class Tab_Bar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body =  Column(
      children: [
        HomePageTop(),
        Market_Tab_Bar(),
      ],
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}
