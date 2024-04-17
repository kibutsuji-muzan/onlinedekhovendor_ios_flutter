import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
 import 'package:onlinedkhovendor/Ven_Order_Details/order_details.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Vendor_ServicePage/VendorServiceWidget.dart';
import 'package:onlinedkhovendor/Widgets/Search_Bar.dart';

import 'ShopDetails_Step2_MainPage.dart';



class shop1MainPage extends StatefulWidget {
  @override
  State<shop1MainPage> createState() => _shop1MainPageState();
}
TextEditingController name=TextEditingController();
TextEditingController address= TextEditingController();
TextEditingController mob=TextEditingController();
class _shop1MainPageState extends State<shop1MainPage> {

  @override
  Widget build(BuildContext context) {


    Widget body =  SingleChildScrollView(scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          children: [
            HomePageTop(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)
                  ),
                  elevation: 5,
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Text("Add Store Information",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight:FontWeight.w400),),
                      SizedBox(height: 50,width: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextField(
                            textAlign: TextAlign.center,
                          //  controller: name,
                            controller: name,
                            decoration: InputDecoration(
                              labelText: "Store Name",
                              prefixIcon: Icon(Icons.store),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,width: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextField(
                            textAlign: TextAlign.center,
                            controller: address,
                            decoration: InputDecoration(
                              labelText: "Address",
                              prefixIcon: Icon(Icons.home),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 50,width: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextField(
                            textAlign: TextAlign.center,
                           controller: mob,
                            decoration: InputDecoration(
                              labelText: "Mobile Number",
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Align(alignment: Alignment.topRight,
                        child: Padding(
                          padding: const EdgeInsets.only(top:5,right: 10,bottom: 5),
                          child: CircleAvatar(
                            backgroundColor: Color(0xFF03a9f4),
                            child: IconButton(
                              icon: Icon(Icons.arrow_forward,color: Colors.white,),
                              onPressed: () {
                                shop_insert();
                                Navigator.push(
                                   context,
                                   MaterialPageRoute(builder: (context) =>  shop2MainPage(shopids: '1009',)
                                   ));
                             //   Register1_insert();
                              },
                            ),
                          ),
                        ),
                      ),

                    ],

                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
  Future<void> shop_insert() async {
    try {
      var data = {
        "servicename": name.text,
        "shop_address": address.text,
        "shop_mob_no": mob.text,
      };
      var complete_url = appConstant.shopInfoInsert;
      var response = await CallApi().postData(data, complete_url);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final results = json['message'] as String;
        print(results);
      } else {
         print('Error: ${response.statusCode}');
      }
    } catch (e) {
       print('Error: $e');
    }
  }

}

