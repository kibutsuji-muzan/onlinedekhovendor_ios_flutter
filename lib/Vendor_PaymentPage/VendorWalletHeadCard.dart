import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Vendor_PaymentPage/Vendor_walletPage.dart';
import 'package:onlinedkhovendor/models/WalletDetailModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class wallet extends StatefulWidget {

  @override
  State<wallet> createState() => _walletState();
}

class _walletState extends State<wallet> {
  String? walletBalance = ''; // Initialize wallet balance variable



  @override
  void initState() {
    super.initState();
    fetchWalletBalance(); // Fetch wallet balance when the widget initializes
  }

  Future<void> fetchWalletBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    walletBalance = prefs.getString(storepref.wallet_amount_key) ?? '';
    setState(() {}); // Update the state to reflect the fetched wallet balance
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 150,
            width: 350,
            child: Card(
              elevation:10,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)
              ),
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(top:20),
                  child: Column(
                    children: [

                       Text("Wallet Cash",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 5,),
                      Text(
                        walletBalance ?? '', // Display the fetched wallet balance
                        style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold, color: Colors.green),
                      ),                      Text("Your Transaction Report",style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold,color: Colors.grey),),

                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: Detailwallet()),

      ],
    );
  }
}




