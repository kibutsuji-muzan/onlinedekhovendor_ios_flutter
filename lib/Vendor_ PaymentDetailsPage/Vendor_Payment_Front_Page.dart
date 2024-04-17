import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
 import 'package:onlinedkhovendor/Vendor_CustomFeePage/Vendor_CustomFeePage.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Widgets/Elevated_Button.dart';
import 'package:onlinedkhovendor/Widgets/TextFieldRoundedCorner.dart';



class PayDetailsfirst extends StatelessWidget {
   TextEditingController account_name=TextEditingController();
  TextEditingController account_number=TextEditingController();
  TextEditingController ifsc=TextEditingController();
  TextEditingController upiid=TextEditingController();
  @override
  Widget build(BuildContext context) {


    Widget body =
     Column(
       children: [
         HomePageTop(),
         Padding(
           padding: const EdgeInsets.all(15.0),
           child: Container(
             height: 170,
             width: 370,
             child: Card(
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(20.0)
               ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Column(
                 children: [
                   Row(mainAxisAlignment: MainAxisAlignment.center,
                     children: [
                       Text('AD BROTHERS',
                         style: TextStyle(
                           fontSize: 14,
                             color: Colors.lightBlueAccent,
                             fontWeight: FontWeight.w500,
                         ),
                       ),
                       IconButton(
                         icon: const Icon(Icons.edit,color: Colors.lightBlueAccent,),
                         onPressed: () {
                           showModalBottomSheet(context: context, builder: (BuildContext context){
                             return SingleChildScrollView(scrollDirection: Axis.vertical,
                               child: Container(
                                 child: Column(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.only(top: 10),
                                       child: Container(
                                         height: 50,
                                         width: 370,
                                         child:  Card(
                                           shape: RoundedRectangleBorder(
                                               borderRadius: BorderRadius.circular(20.0),
                                           ),
                                           color: Color(0xffF5F5F5),
                                           child:Align(alignment:Alignment.center,child: Text("Update Custom Fee Details",style: TextStyle(fontWeight: FontWeight.bold),)),

                                         ),
                                       ),
                                     ),
                                     Container(
                                       width:370,
                                       child: Card(
                                         shape: RoundedRectangleBorder(
                                           borderRadius: BorderRadius.circular(15),
                                         ),
                                         child: Column(
                                           children: [
                                              TexttField(title: 'Account Name: ',icon:Icons.account_balance,controller:account_name,onPressed: (){},),
                                             TexttField(title: 'Account Number:',icon:Icons.numbers,controller:account_number,onPressed: (){},),
                                             TexttField(title: 'IFSC_CODE: ',icon:Icons.confirmation_num,controller:ifsc,onPressed: (){},),
                                             Padding(
                                               padding: const EdgeInsets.only(bottom: 20),
                                               child: TexttField(title: 'UPI_ID: ',icon:Icons.account_balance_wallet,controller:upiid,onPressed: (){},),
                                             ),
                                             Padding(
                                               padding: const EdgeInsets.only(bottom: 15),
                                               child: Container(
                                                 height: 25,
                                                 child: ElevateButton(title: 'UPDATE',)
                                               ),
                                             )

                                           ],
                                         ),
                                       ),
                                     ),

                                   ],
                                 ),
                               ),
                             );
                           });
                         },
                       ),
                     ],
                   ),
                   SizedBox(height:5,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [
                       Text('Account Name',
                         style: TextStyle(
                             color: Colors.grey,
                          ),
                       ),
                       Text('Shweksha Srivastava',
                         style: TextStyle(
                             color:  Colors.black,
                          ),
                       )
                     ],
                   ),
                   SizedBox(height:3,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [
                       Text('Account Number',
                         style: TextStyle(
                           color: Colors.grey,
                         ),
                       ),
                       Text('111222333444',
                         style: TextStyle(
                           color:  Colors.black,
                         ),
                       )
                     ],
                   ),
                   SizedBox(height:3,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,

                     children: [
                       Text('IFSC_CODE',
                         style: TextStyle(
                           color: Colors.grey,
                         ),
                       ),
                       Text('SS241012',
                         style: TextStyle(
                           color:  Colors.black,
                         ),
                       )
                     ],
                   ),
                   SizedBox(height:3,),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Text('UPI_ID',
                         style: TextStyle(
                           color: Colors.grey,
                         ),
                       ),
                       Text('6534562983',
                         style: TextStyle(
                           color:  Colors.black,
                         ),
                       )
                     ],
                   ),
                 ],
               ),
             ),
             ),
           ),
         ),
       ],
     );


    return BootomNavHome(context,  body); // Pass the body widget
  }
  // Payment_Insert() async {
  //   var Pay= {
  //     "account_name": account_name.text,
  //     "account_number": account_number.text,
  //     "ifsc": ifsc.text,
  //     "upiid":upiid.text};
  //   var complete_url= appConstant.Payment_Insert;
  //   var response=await CallApi().postData(Pay,complete_url);
  //   final body = response.body;
  //   final json = jsonDecode(body);
  //   if(json['response']==200){
  //     print(json);
  //     final results = json['message'] as String;
  //     print(results);
  //   }
  //
  // }
}

