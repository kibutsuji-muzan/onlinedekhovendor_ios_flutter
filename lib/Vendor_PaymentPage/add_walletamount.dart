import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
 import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AddAmountWallet extends StatefulWidget {
  @override
  State<AddAmountWallet> createState() => _AddAmountWalletState();
}

class _AddAmountWalletState extends State<AddAmountWallet> {
  String cforderid='';
  String paymentSession='';
  TextEditingController amountController = TextEditingController();

  int currentAmount = 0;

  void addAmount(int amount) {
    setState(() {
      currentAmount += amount;
      amountController.text = currentAmount.toString();
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        // You can adjust responsiveness based on screen width here
        final maxWidth = constraints.maxWidth;

        Widget body = SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: SafeArea(
            child: Column(
              children: [
                HomePageTop(),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 8,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          TextField(
                            controller: amountController,
                            textAlign: TextAlign.center,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.allow(RegExp(r'[0-9]')), // Only allow numbers
                            ],
                            decoration: InputDecoration(
                              labelText: "Enter Amount(₹)",
                            ),
                          ),
                          SizedBox(height: 25),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                child: Container(
                                  height: 35,
                                  width: maxWidth * 0.22,
                                  child: Center(child: Text("+₹ 1000")),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                                ),
                                onTap: () {
                                  addAmount(1000);
                                },
                              ),
                              InkWell(
                                child: Container(
                                  height: 35,
                                  width: maxWidth * 0.22,
                                  child: Center(child: Text("+₹ 5000")),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                                ),
                                onTap: () {
                                  addAmount(5000);
                                },
                              ),
                              InkWell(
                                child: Container(
                                  height: 35,
                                  width: maxWidth * 0.22,
                                  child: Center(child: Text("+₹ 10,000")),
                                  decoration: BoxDecoration(border: Border.all(color: Colors.grey)),
                                ),
                                onTap: () {
                                  addAmount(10000);
                                },
                              ),
                            ],
                          ),
                          Container(
                            width: double.infinity,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15, left: 5, right: 5),
                              child: ElevatedButton(
                                onPressed: () {


                                  /////call the api create order (amount)
                                },
                                child: Text("Add Money"),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        );
        return BootomNavHome(context, body); // Pass the body widget
      },
    );
  }



}
