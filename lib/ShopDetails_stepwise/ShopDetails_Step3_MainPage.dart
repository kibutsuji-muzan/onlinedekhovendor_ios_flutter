import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:multiselect/multiselect.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/ShopDetails_stepwise/ShopDetails_Step4_SchedulingPage.dart';
import 'package:onlinedkhovendor/Ven_Order_Details/order_details.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Vendor_ServicePage/VendorServiceWidget.dart';
import 'package:onlinedkhovendor/Widgets/Search_Bar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'ShopDetails_Step2_MainPage.dart';



class shop3MainPage extends StatefulWidget {
  final String shopids;

  shop3MainPage({required this.shopids});
  @override
  State<shop3MainPage> createState() => _shop3MainPageState();
}

class _shop3MainPageState extends State<shop3MainPage> {
  List<String> selected = [];
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  List dropDownListData=[
    {"title":"Pickup","value":"1"},
    {"title":"Delivery","value":"2"},
    {"title":"Store In","value":"3"},
   ];
  String defaultValue="";

  @override
  Widget build(BuildContext context) {
    print('Shop ID: ${widget.shopids}');



    Widget body =  SingleChildScrollView(scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          children: [
            HomePageTop(),
            Center(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                ),
                elevation: 5,
                child:
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(height: 5,),
                      Text("Add Store Category Type",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight:FontWeight.w400),),

                      SizedBox(height: 10,),
                      // Container(
                      //   height: 40,
                      //   width: 270,
                      //   decoration: BoxDecoration(
                      //     border: Border.all(
                      //       width: 2.0,
                      //       color: Colors.grey
                      //     ),
                      //     borderRadius: BorderRadius.circular(30),
                      //   ),
                      //   child:DropDownMultiSelect(
                      //     onChanged: (List<String> x) {
                      //       setState(() {
                      //         selected =x;
                      //       });
                      //     },
                      //     options: ['a' , 'b' , 'c' , 'd'],
                      //     selectedValues: selected,
                      //     whenEmpty: 'Select Something',
                      //   ),
                      //   // Padding(
                      //   //   padding: const EdgeInsets.symmetric(horizontal: 16),
                      //   //   child: DropdownButtonHideUnderline(
                      //   //     child: DropdownButton(
                      //   //       value: defaultValue,
                      //   //       isExpanded: true,
                      //   //       icon: Icon(
                      //   //         Icons.arrow_drop_down, // Custom dropdown icon
                      //   //         // Icon color
                      //   //       ),
                      //   //       elevation: 2, // Add elevation for a shadow effect
                      //   //       style: TextStyle(
                      //   //         fontSize: isMobile(context) ? 12 : 16,
                      //   //         fontWeight: FontWeight.w500,
                      //   //         color: Colors.grey, // Text color
                      //   //       ),
                      //   //       items: [
                      //   //         DropdownMenuItem(
                      //   //           child: Center(
                      //   //             child: Text(
                      //   //               "Select Category",
                      //   //               style: TextStyle(
                      //   //                 fontSize: isMobile(context) ? 12 : 16,
                      //   //                 fontWeight: FontWeight.w500,
                      //   //               ),
                      //   //             ),
                      //   //           ),
                      //   //           value: "",
                      //   //         ),
                      //   //         ...dropDownListData.map<DropdownMenuItem<String>>((e) {
                      //   //           return DropdownMenuItem(
                      //   //             child: Text(e['title']),
                      //   //             value: e['value'],
                      //   //           );
                      //   //         }),
                      //   //       ],
                      //   //       onChanged: (value) {
                      //   //         print("Selected Value $value");
                      //   //         Future.delayed(Duration.zero, () {
                      //   //           setState(() {
                      //   //             defaultValue = value!;
                      //   //           });
                      //   //         });
                      //   //       },
                      //   //     ),
                      //   //   ),
                      //   // ),
                      //
                      //
                      // ),
                      Container(
                        height: 35,
                        width: 255,
                        child: DropDownMultiSelect(
                          onChanged: (List<String> x) {
                            setState(() {
                              selected = x;
                             // print('Selected values: $selected');

                            });
                          },
                          options: ['Pickup', 'Delivery', 'Dine-In'],
                          selectedValues: selected,
                          whenEmpty: 'Select Type',
                        ),
                      ),



                      SizedBox(height: 50,width: 260,
                        child: Padding(
                          padding: const EdgeInsets.only(top: 15),
                          child: TextField(
                            textAlign: TextAlign.center,
                            //  controller: name,
                            decoration: InputDecoration(
                              labelText: "Add Subcategory",
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
                               // print('Selected values: $selected');

                                availability_insert(selected);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>  shop4MainPage(shopids: '1009',)
                                    ));
                                //Register1_insert();
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
  Future<void> availability_insert(List<String> selected) async {
    print('availability_insert called with selected: $selected');

    SharedPreferences prefs = await SharedPreferences.getInstance();

    try {
      var data = {
        "Vendor_Id": prefs.getString(storepref.vendor_id_key) ?? '',
        "Shop_id": widget.shopids,
        "Availability_type": selected.join(',')
      };
      print('Shop_id: ${data["Shop_id"]}');

      var complete_url = appConstant.availability;
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

