import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/VendorPromocode/Coupon_detailsVendor.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_ButtonsTabbar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_CarouselSlider.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';

class Coupon extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget body =  Column(
      children: [
        HomePageTop(),
        CouponCode(),
      ],
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}
