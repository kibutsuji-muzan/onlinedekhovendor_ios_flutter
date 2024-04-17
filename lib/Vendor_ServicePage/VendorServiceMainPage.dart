import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Vendor_ServicePage/VendorServiceWidget.dart';
import 'package:onlinedkhovendor/Widgets/Search_Bar.dart';



class serviceMain extends StatefulWidget {
  @override
  State<serviceMain> createState() => _serviceMainState();
}

class _serviceMainState extends State<serviceMain> {
  String searchText = "";

  void handleSearch(String text) {
    setState(() {

      print(text);
      searchText = text;
    });
  }
  @override
  Widget build(BuildContext context) {


    Widget body =  SingleChildScrollView(scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          children: [
            HomePageTop(),
            searchBar(onSearch:handleSearch,),
            //Text("Search Text:$searchText"),
            ServiceVen(searchText: searchText), // Pass the search text
          ],
        ),
      ),
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}
