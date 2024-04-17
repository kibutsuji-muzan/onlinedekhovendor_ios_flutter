import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Ven_Order_Details/order_details_mainpage.dart';
import 'package:onlinedkhovendor/Widgets/Elevated_Button.dart';
import 'package:onlinedkhovendor/Widgets/Gradient_slider/slider_gradient.dart';
import 'package:onlinedkhovendor/models/OrderInitiatedModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ven_cancel extends StatefulWidget{
  @override
  State<ven_cancel> createState() => _ven_cancelState();
}

class _ven_cancelState extends State<ven_cancel> {
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  Future<List<OrderInitiatedModel>>orderdetailInitiated() async{
    var complete_url=appConstant.OrderInitiatedDoneAllStatus;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var data={
      "vendorid":prefs.getString(storepref.vendor_id_key)?? '',
      "deliverystatus":"Cancelled By Vendor",
      "start_date":null,
      "end_date":null,
      "servicename":null
    };
    var response= await CallApi().postData(data, complete_url);
    final  body= response.body;
    final json=jsonDecode(body);
    if(json['response']==200){


      var OrderDetail=json['Result'];
      print(OrderDetail);
      final list=(OrderDetail) as List<dynamic>;
       return list.map((e)=>OrderInitiatedModel.fromJson(e)).toList();
    }
    else{
      return [];
    }
  }

  @override
  Widget build(BuildContext context){

    return FutureBuilder(future: orderdetailInitiated(),
      builder: (context,data){
        if(data.hasError){
          return Center(child: Text("${data.error}"));
        }
        else if(data.hasData){
          var items=data.data as List<OrderInitiatedModel>;
          if (items.isEmpty) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    'assets/images/noOrders.png',

                  ),
                  SizedBox(height: 20),

                ],
              ),
            );
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items==null?0:items.length,
            itemBuilder: (BuildContext context, int index) {
              // Add a return statent to return the Card widget
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
                          Row(
                            children: [
                              Text("Booking Id:",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              Text(
                                items[index].bookingid.toString(),
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 5,),
                          Text(
                            "Shop Name: ${items[index].servicename.toString()}",
                            style: TextStyle(
                              fontSize: isMobile(context) ? 12 : 16,
                              color: Colors.lightBlueAccent,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Shop Name: ", // Add the heading here
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.lightBlueAccent,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     Text(
                          //       items[index].servicename.toString(),
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.lightBlueAccent,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          Text(
                            "Customer Name: ${items[index].user_name.toString()}",
                            style: TextStyle(
                              fontSize: isMobile(context) ? 12 : 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Customer Name:", // Add the heading here
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     Text(
                          //       items[index].user_name.toString(),
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          Text(
                            "Customer Mobile Number:: ${items[index].user_mobileno.toString()}",
                            style: TextStyle(
                              fontSize: isMobile(context) ? 12 : 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Customer Mobile Number:", // Add the heading here
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     Text(
                          //       items[index].user_mobileno.toString(),
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          Text(
                            "Delivery Agent: ${items[index].deliveryboy_name.toString()}",
                            style: TextStyle(
                              fontSize: isMobile(context) ? 12 : 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Delivery Agent: ", // Add the heading here
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     Text(
                          //       items[index].deliveryboy_name.toString(),
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          Text(
                            "Delivery Agent Number: ${items[index].deliveryboy_mobileno.toString()}",
                            style: TextStyle(
                              fontSize: isMobile(context) ? 12 : 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Delivery Agent Number:" , // Add the heading here
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     Text(
                          //       items[index].deliveryboy_mobileno.toString(),
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          Text(
                            "Delivery Status: ${items[index].deliverystatus.toString()}",
                            style: TextStyle(
                              fontSize: isMobile(context) ? 12 : 16,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Delivery Status: ", // Add the heading here
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     Text(
                          //       items[index].deliverystatus.toString(),
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          Text(
                            "Order Type: ${items[index].delivery_type.toString()}",
                            style: TextStyle(
                              fontSize: isMobile(context) ? 12 : 16,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       "Order Type: ", // Add the heading here
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.grey,
                          //         fontWeight: FontWeight.w400,
                          //       ),
                          //     ),
                          //     Text(
                          //       items[index].delivery_type.toString(),
                          //       style: TextStyle(
                          //         fontSize: 12,
                          //         color: Colors.black,
                          //         fontWeight: FontWeight.bold,
                          //       ),
                          //     ),
                          //   ],
                          // ),
                          SizedBox(height: 5,),
                          Row(
                            children: [
                              Text(
                                items[index].date.toString(),
                                style: TextStyle(
                                  fontSize: isMobile(context) ? 12 : 16,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ), SizedBox(height: 5,),
                          Container(
                            height: 20,
                            child: ElevatedButton(
                                onPressed: (){
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => orderMain(bookingid: items[index].bookingid.toString()),
                                    ),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  backgroundColor: Color(0xFF03a9f4),
                                ),
                                child: Text('Order Details')),
                          )
                        ],
                      ),

                    ],
                  ),
                ),
              );
            },
          );
        }
        else{
          return Column(
            children: [
              CircularProgressIndicator(),

            ],
          );
        }
      },
    );
  }
}







