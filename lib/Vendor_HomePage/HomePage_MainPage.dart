import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_ButtonsTabbar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_CarouselSlider.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Widgets/dropdown_textfield.dart';
import 'package:onlinedkhovendor/Widgets/modalBottomSheet.dart';

import 'HomePage_InitiatedPage/InititatePage_MainPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body = Column(
      children: [
        const HomePageTop(),
        sliderHome(),
        tabButtons(),
        bottomsheet(),
      ],
    );
    return BootomNavHome(context, body); // Pass the body widget
  }
}
