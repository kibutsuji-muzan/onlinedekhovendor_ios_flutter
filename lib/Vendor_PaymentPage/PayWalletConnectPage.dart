import 'package:buttons_tabbar/buttons_tabbar.dart';
 import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Vendor_PaymentPage/VendorPayoutHeadCard.dart';
import 'package:onlinedkhovendor/Vendor_PaymentPage/VendorWalletHeadCard.dart';
import 'package:onlinedkhovendor/Vendor_PaymentPage/add_walletamount.dart';

class PaymentWallet extends StatefulWidget{
  @override
  State<PaymentWallet> createState() => _PaymentWalletState();
}

class _PaymentWalletState extends State<PaymentWallet> {
  @override
  Widget build(BuildContext context){
    return Expanded(
        child:DefaultTabController(
            length: 2,
            child: Scaffold(
              appBar: AppBar(
                title:  Text("Payment Details",style: TextStyle(color:Colors.white),),

                actions: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adjust padding as needed
                    child:  InkWell(child: Container(height: 35,width: 120,child: Center(child: Text("ADD MONEY",style: TextStyle(fontSize: 14),)),decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(10)),),onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) =>  AddAmountWallet()
                          ));
                    },),
                  ),
                ],


                // title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //   children: [
                //     Text("Payment Details",style: TextStyle(color:Colors.white),),
                //     InkWell(child: Container(height: 35,width: 120,child: Center(child: Text("ADD MONEY",style: TextStyle(fontSize: 14),)),decoration: BoxDecoration(border: Border.all(color: Colors.white),borderRadius: BorderRadius.circular(10)),),onTap: (){
                //       Navigator.push(
                //           context,
                //           MaterialPageRoute(builder: (context) =>  addamountwallet()
                //           ));
                //     },),
                //
                //   ],
                // ),
                bottom: TabBar(
                  isScrollable: true,
                  tabs: [
                    Tab(
                      icon: Icon(Icons.payment),
                      text: "Payout",
                    ),
                    Tab(
                      icon: Icon(Icons.wallet),
                      text: "Wallet",
                    ),
                  ],
                ),
              ),
              body: TabBarView(
                children: [
                  Center(
                      child: PayoutPage()
                  ),
                  Center(
                    child: wallet(),
                  ),

                ],
              ),
            )));
  }}

