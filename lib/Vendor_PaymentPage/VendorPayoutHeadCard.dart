import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Vendor_PaymentPage/Vendor_PayoutPage.dart';

class PayoutPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            height: 100,
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
                      Text("Payment Detail",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),SizedBox(height: 5,),
                      Text("Your Transaction Report",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.grey),),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
            child: DetailPayout()),

      ],
    );
  }
}




