import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/VendorPromocode/PromoVendorelevatedbutton.dart';
import 'package:onlinedkhovendor/Vendor_PaymentPage/Vendor_PayoutPage.dart';

class CouponCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(13.0),
        ),
        elevation: 10,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top:15,left: 5),
              child:  ListTile(title: Text("ONECARD100",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),trailing: elevated(),leading: Image.asset('assets/images/coupon.png'),),
            ),
            Text("Save Rs.87 on this order using OneCard!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color(0xFF03a9f4)),),
            Divider(),
            Padding(
              padding: const EdgeInsets.only(top: 8),
              child: Text("Maximum discount upto Rs.100 on orders above Rs.250",style: TextStyle(color: Colors.blueGrey,fontSize: 11,fontWeight: FontWeight.bold),),
            ),
             Padding(
               padding: const EdgeInsets.only(top:5,bottom: 5),
               child: Container(
                 height: 120,
                 width: 300,
                 child: Card(
                   elevation: 15,
                   shape: RoundedRectangleBorder(
                     borderRadius: BorderRadius.circular(13.0),
                   ),
                   child: Column(
                     children: [

                       Padding(
                         padding: const EdgeInsets.only(top:5),
                         child: RichText(
                             text: const TextSpan(
                               text: 'Coupon Code Name: ',
                               style: TextStyle(
                                   color: Colors.blueGrey,
                                 fontWeight: FontWeight.w500
                               ),
                               children: [
                                 TextSpan(
                                   text: 'OnlineDekho',
                                   style: TextStyle(
                                       color: Colors.lightBlueAccent

                                   ),
                                 ),
                               ],
                             )
                         ),
                       ),
                        SizedBox(height: 5,),
                       RichText(
                           text: const TextSpan(
                             text: 'Expiry Date: ',
                             style: TextStyle(
                                 color: Colors.redAccent,
                                 fontWeight: FontWeight.w500
                             ),
                             children: [
                               TextSpan(
                                 text: 'Within 24 hours',
                                 style: TextStyle(
                                     color: Colors.red

                                 ),
                               ),
                             ],
                           )
                       ),
                       SizedBox(height: 5,),
                       RichText(
                           text: const TextSpan(
                             text: 'Shops Applicable: ',
                             style: TextStyle(
                                 color: Colors.blueGrey,
                                 fontWeight: FontWeight.w500
                             ),
                             children: [
                               TextSpan(
                                 text: '\nHunger Lunger\nAD Burgers',
                                 style: TextStyle(
                                   fontSize: 13,
                                     color: Colors.lightBlueAccent

                                 ),
                               ),
                             ],
                           )
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

  }
}




