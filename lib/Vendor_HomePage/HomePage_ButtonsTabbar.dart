
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_DonePage/DonePage_Vendor.dart';
import 'package:onlinedkhovendor/Vendor_allPage/AllPage_mainconnect_Page.dart';

import 'HomePage_CancelPage/Vendor_CancelPage_Main.dart';
import 'HomePage_InitiatedPage/InititatePage_MainPage.dart';

class tabButtons extends StatelessWidget{
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
                physics: ScrollPhysics(),
                contentPadding: EdgeInsets.only(left:15,right: 15),
                backgroundColor: Color(0xFF03a9f4),
                unselectedBackgroundColor:Color(0xFFD3D3D3),
                unselectedLabelStyle: TextStyle(color:Colors.black),
                labelStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                tabs: [
                  Tab(
                    icon: Icon(Icons.start_sharp),
                    text: "Initiated",
                  ),
                  Tab(
                    icon: Icon(Icons.done),
                    text: "Done",
                  ),
                  Tab(
                    icon: Icon(Icons.cancel_outlined),
                    text: "Cancelled",
                  ),
                  Tab(
                    icon: Icon(Icons.done_all ),
                    text: "All",
                  ),

                ],
              ),
              Expanded(
                child: TabBarView(
                  children: <Widget>[
                    initiate(),
                    Vendor_Done(),
                    mainVenCancel(),
                    allconnectPage(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );

  }}