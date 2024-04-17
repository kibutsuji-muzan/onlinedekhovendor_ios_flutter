import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Add_ShopDetails_Vendor/shopdetails_form.dart';
import 'package:onlinedkhovendor/Widgets/HomeaddressPage.dart';
import 'package:onlinedkhovendor/Widgets/SalesTodayContainer.dart';
import 'package:onlinedkhovendor/Widgets/dropdown_textfield.dart';
import 'package:onlinedkhovendor/Widgets/toggle_Button.dart';
// import 'package:odvendor/screens/user_ui/SalesPage/Sales%20Page.dart';
// import 'package:odvendor/screens/user_ui/new_page_vendor.dart';
import '../../../constants/colors.dart';

class HomePageTop extends StatefulWidget {
  const HomePageTop({super.key});

  @override
  State<HomePageTop> createState() => _HomePageTopState();
}
class _HomePageTopState extends State<HomePageTop> {
  bool isSwitched = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

SizedBox(width: 2,),
          Text('ONLINE DEKHO',style: TextStyle(color: Colors.lightBlue,fontWeight: FontWeight.bold),),
          HomeTopToggleButton(),
        //  SizedBox(height: 10,),
          //SalesContainer(),
        ],
      ),
    );
  }

}
