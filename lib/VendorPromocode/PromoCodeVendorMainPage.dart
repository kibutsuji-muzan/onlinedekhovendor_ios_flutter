import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/VendorPromocode/PromoVendor.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_ButtonsTabbar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_CarouselSlider.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Widgets/modalBottomSheet.dart';
class PromoMainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body =  SingleChildScrollView(scrollDirection: Axis.vertical,
      child: Column(
        children: [
          HomePageTop(),
          PromoCode(),
        ],
      ),
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}
