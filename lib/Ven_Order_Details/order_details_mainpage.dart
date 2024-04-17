import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Ven_Order_Details/order_details.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Vendor_ServicePage/VendorServiceWidget.dart';
import 'package:onlinedkhovendor/Widgets/Search_Bar.dart';



class orderMain extends StatelessWidget {
  final String bookingid;
  orderMain({required this.bookingid});
  @override
  Widget build(BuildContext context){


  Widget body =  SingleChildScrollView(scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          children: [
             // Text(bookingid)
           // print(orderid);
            HomePageTop(),
            Ven_Orderdetails(bookingids:bookingid)

          ],
        ),
      ),
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}

