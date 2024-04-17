import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/models/WalletDetailModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Call_Api/Api.dart';
import '../models/PaymentDetailModel.dart';



class Detailwallet extends StatefulWidget {
  late final String walletBalance;
  @override
  State<Detailwallet> createState() => _DetailwalletState();
}

class _DetailwalletState extends State<Detailwallet> {
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    Widget body =
    ListView.builder(
      itemCount: 5,
      itemBuilder: (BuildContext context, int index) {
        // Add a return statement to return the Card widget
        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Transaction Id: ${items[index].tranction_id.toString(),}",
                    //       style: TextStyle(
                    //         fontSize: isMobile(context) ? 12 : 16,
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.w600,
                    //       ),
                    //     ),
                    //     //
                    //     // Text("Transaction Id:",
                    //     //   style: TextStyle(
                    //     //     color: Colors.black,
                    //     //     fontWeight: FontWeight.w600,
                    //     //   ),
                    //     // ),
                    //     // Text(
                    //     //   items[index].tranction_id.toString(),
                    //     //   style: TextStyle(
                    //     //     color: Colors.black,
                    //     //     fontWeight: FontWeight.w600,
                    //     //   ),
                    //     // ),
                    //   ],
                    // ),
                    Text(
                      "Transaction Id: ''",
                      style: TextStyle(
                        fontSize: isMobile(context) ? 11 : 13,
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    Text(
                      "Date: ''",
                      style: TextStyle(
                        fontSize: isMobile(context) ? 12 : 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),





                    // Row(
                    //   children: [
                    //     Text(
                    //       "Date:", // Add the heading here
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.grey,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //     Text(
                    //       items[index].createddate.toString(),
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.grey,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Remark:", // Add the heading here
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.grey,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //     Text(
                    //       items[index].reference.toString(),
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         color: Colors.grey,
                    //         fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Text(
                      "Remark: ''",
                      style: TextStyle(
                        fontSize: isMobile(context) ? 12 : 16,
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                      ),
                    ),

                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Amount:  ''",
                      style: TextStyle(
                        fontSize: isMobile(context) ? 12 : 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //        "Amount:",
                    //       style: TextStyle(
                    //         fontSize: 17,
                    //         color: Colors.black,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //     Text(
                    //       items[index].amount.toString(),
                    //       style: TextStyle(
                    //          color: Colors.lightBlueAccent,
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Text(
                      "Total Amount: ''",
                      style: TextStyle(
                        fontSize: isMobile(context) ? 12 : 16,
                        color: Colors.black,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Row(
                    //   children: [
                    //     Text(
                    //       "Total Amount:",
                    //       style: TextStyle(
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //     Text(
                    //       items[index].status.toString(),
                    //       style: TextStyle(
                    //          fontWeight: FontWeight.w400,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    Text(
                      "Status:  ''",
                      style: TextStyle(
                        fontSize: isMobile(context) ? 12 : 16,
                        color: Colors.green,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    //   children: [
                    //     Text(
                    //       "Status:",
                    //       style: TextStyle(
                    //
                    //         fontWeight: FontWeight.w500,
                    //       ),
                    //     ),
                    //
                    //     Text(
                    //       items[index].status.toString(),
                    //       style: TextStyle(
                    //         fontSize: 12,
                    //         fontWeight: FontWeight.w400,
                    //         color: Colors.green,
                    //       ),
                    //     ),
                    //   ],
                    // ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}

