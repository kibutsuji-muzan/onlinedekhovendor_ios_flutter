import 'dart:convert';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Call_Api/Api.dart';
import '../models/PaymentDetailModel.dart';



class DetailPayout extends StatefulWidget {
  @override
  State<DetailPayout> createState() => _DetailPayoutState();
}

class _DetailPayoutState extends State<DetailPayout> {
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }
  Future<List<PaymentDetailModel>>showPaymentTransaction() async{
 // ShowPaymentTransaction() async {
    var complete_url= appConstant.PaymentDetail;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key)?? '';
    var response = await CallApi().getData(vendor_id, complete_url);     final body = response.body;
    final json = jsonDecode(body);
    if(json['response']==200){

      var PaymentDetail=json['Result'];

      final list=(PaymentDetail) as List<dynamic>;
      return list.map((e) => PaymentDetailModel.fromJson(e)).toList();


    }else{
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
     Widget body =  FutureBuilder(future:showPaymentTransaction(),
         builder: (context,data){
       if(data.hasError){
         return Center(child: Text("${data.error}"));
       }
       else if(data.hasData){
         var items=data.data as List<PaymentDetailModel>;
         return   ListView.builder(shrinkWrap: true,
           itemCount: items==null?0:items.length,
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
                         Text(
                           "Order Id: ${items[index].orderid.toString()}",
                           style: TextStyle(
                             fontSize: isMobile(context) ? 12 : 16,
                             color: Colors.black,
                             fontWeight: FontWeight.w400,
                           ),
                         ),

                         Text(
                           "Commission Amount ₹: ${items[index].commisionamount.toString()}",
                           style: TextStyle(
                             fontSize: isMobile(context) ? 12 : 16,
                             color: Colors.black,
                             fontWeight: FontWeight.w400,
                           ),
                         ),

                         Text(
                           "Date: ${items[index].createddate.toString()}",
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
                           "${items[index].amount.toString()}",
                           style: TextStyle(
                             fontSize: isMobile(context) ? 12 : 16,
                             color: Colors.grey,
                             fontWeight: FontWeight.w400,
                           ),
                         ),

                         Text(
                           "${items[index].status.toString()}",
                           style: TextStyle(
                             fontSize: isMobile(context) ? 12 : 16,
                             color: Colors.grey,
                             fontWeight: FontWeight.w400,
                           ),
                         ),

                         Text(
                           "${items[index].tansstatus.toString()}",
                           style: TextStyle(
                             fontSize: isMobile(context) ? 12 : 16,
                             fontWeight: FontWeight.w400,
                             color: items[index].tansstatus == 'SUCCESS'
                                 ? Colors.green
                                 : items[index].tansstatus == 'Cancellation Charge'
                                 ? Colors.red
                                 : Colors.black,
                           ),
                         ),

                       ],
                     ),

             ])));
           },
         );

       }
       else{
         return Center(child: CircularProgressIndicator(),);
       }
         }
     );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}

