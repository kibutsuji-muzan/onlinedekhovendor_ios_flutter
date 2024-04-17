import 'package:buttons_tabbar/buttons_tabbar.dart';
 import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_TodaySales/HomePage_salesCard.dart';
import 'package:onlinedkhovendor/Widgets/DatePicker.dart';


class customtabs extends StatefulWidget{
  @override
  State<customtabs> createState() => _customtabsState();
}

class _customtabsState extends State<customtabs> {
  @override
  Widget build(BuildContext context){
    return Expanded(
      child: DefaultTabController(
        length: 3,
        child: Column(
          children: <Widget>[
            Material(
              color:Color(0xFFD3D3D3),
              child: TabBar(
                  unselectedLabelColor:Colors.black,
                  labelColor:Colors.white,
                  indicatorColor:Colors.white,
                  labelPadding: const EdgeInsets.all(0.0),
                  tabs:  [
                    Tab(text: "Daily",),
                    Tab(text: "Weekly",),
                    Tab(text: "Monthy",)
                  ]
              ),
            ),
            Expanded(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                children: [
                  Card(
                      child: Column(
                        children: [
                          DateWidget(),
                          sales(),

                        ],
                      )),
                ],
              ),
            ),

          ],
        ),

      ),);



  }}

