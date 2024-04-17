
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/VendorPromocode/Coupon_detailsVendor.dart';
import 'package:onlinedkhovendor/VendorPromocode/Coupon_details_Main.dart';
import 'package:onlinedkhovendor/VendorPromocode/PromoVendor.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_DonePage/DonePage_Vendor.dart';
class Market_Tab_Bar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Flexible(
      child: Container(
        child:
        DefaultTabController(
          length: 4,
          child: Column(
            children: <Widget>[
              ButtonsTabBar(
                contentPadding: EdgeInsets.only(left:15,right: 15),
                backgroundColor: Color(0xFF03a9f4),
                unselectedBackgroundColor:Color(0xFFD3D3D3),
                unselectedLabelStyle: TextStyle(color:Colors.black),
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    icon: Icon(Icons.qr_code),
                    text: "Coupon",
                  ),
                  Tab(
                    icon: Icon(Icons.work_history),
                    text: "Story",
                  ),
                  Tab(
                    icon: Icon(Icons.ads_click),
                    text: "Ads",
                  ),
                  Tab(
                    icon: Icon(Icons.star ),
                    text: "Ranking",
                  ),

                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    PromoCode(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );



  }}