import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/models/OrderDetailModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Ven_Orderdetails extends StatefulWidget {

  final String bookingids;
   Ven_Orderdetails({required this.bookingids});

  @override
  State<Ven_Orderdetails> createState() => _Ven_OrderdetailsState();
}

class _Ven_OrderdetailsState extends State<Ven_Orderdetails> {
  String addressid="",Shop_name="",date="",delivery_type="",grand_total="",booking_id="",totalprice="",quantity="",subserviceid="";

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  Future<List<OrderDetailModel>>DetailsProduct() async{

     var id=(widget.bookingids);
    var complete_url= appConstant.ProductAddDetails;
   var response=await CallApi().getData(id,complete_url);
    final body = response.body;
    final json = jsonDecode(body);
     if(json['response']==200){
        var orderInfoList=json['Orderinfo'][0];

       setState(() {
         booking_id = orderInfoList["bookingid"];
         Shop_name=orderInfoList["servicename"];
         date=orderInfoList["date"];
         delivery_type=orderInfoList["delivery_type"];
         addressid = orderInfoList["addressid"];
         grand_total = orderInfoList["grandtotal"];

       });
      var Productinfo=json['Productinfo'];

      final list=(Productinfo) as List<dynamic>;

      print(list);
      return list.map((e) => OrderDetailModel.fromJson(e)).toList();
    }else{
      return [];
    }
  }
  @override
  Widget build(BuildContext context) {
    return
       Card(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(20.0),
         ), elevation: 10,
         child: Padding(
           padding: const EdgeInsets.only(left:8.0,top: 8.0),
           child: Container(
               child:Column(
                   children: [
                     Align(alignment: Alignment.topLeft,
                       child: Text(
                         "Booking_Id:  $booking_id",
                         style: TextStyle(
                           fontSize: isMobile(context) ? 14 : 16,
                           fontWeight: FontWeight.bold

                         ),
                       ),
                     ),
                     SizedBox(height: 5,),
                     Align(alignment: Alignment.topLeft,
                       child: Text(
                         "Shop Name:  $Shop_name",
                         style: TextStyle(
                           fontSize: isMobile(context) ? 12 : 16,

                         ),
                       ),
                     ),

                     SizedBox(height: 5,),
                     Align(alignment: Alignment.topLeft,
                       child: Text(
                         "Date and Time:  $date",
                         style: TextStyle(
                           fontSize: isMobile(context) ? 12 : 16,

                         ),
                       ),
                     ),

                     SizedBox(height: 5,),
                     Align(alignment: Alignment.topLeft,
                       child: Text(
                         "Order Type:  $delivery_type",
                         style: TextStyle(
                           fontSize: isMobile(context) ? 12 : 16,
                         ),
                       ),
                     ),

                     SizedBox(height: 5,),
                     Align(alignment: Alignment.topLeft,
                       child: Text(
                           "Address:  $addressid",
                         style: TextStyle(
                           fontSize: isMobile(context) ? 12 : 16,

                         ),
                       ),
                     ),

                     SizedBox(height: 5,),
                     Align(alignment: Alignment.topLeft,
                       child: Text(
                         "Grand Total: ₹ $grand_total",
                         style: TextStyle(
                           fontSize: isMobile(context) ? 12 : 16,
                             color: Colors.green,
                           fontWeight: FontWeight.w500

                         ),
                       ),
                     ),
                     SizedBox(height: 10,),
               FutureBuilder(future: DetailsProduct(),
               builder: (context,data){
                 if(data.hasError){
                   return Center(child: Text("${data.error}"));
                 }
                 else if(data.hasData){
                   var items=data.data as List<OrderDetailModel>;
                   return
                     ListView.builder(
                         shrinkWrap: true,
                         itemCount:items.length,itemBuilder:(BuildContext context,int index){
                       return Card(
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.circular(20.0),
                           ), elevation: 10,
                           child: Padding(
                             padding: const EdgeInsets.only(left: 10,top: 10,bottom: 10),
                             child:
                             Column(
                               children: [
                                 Padding(
                                   padding: const EdgeInsets.only(right: 10,top: 5),
                                   child: Row(
                                      children: [
                                        Container(
                                          height: 90,
                                          width: 90,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),

                                            color: Colors.grey,
                                          ),
                                        ),
                                       Padding(
                                         padding: const EdgeInsets.only(left: 10),
                                         child: Column(children: [

                                           Text(items[index].subservicename.toString() ??'',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500 ),), SizedBox(height: 5,),
                                           Text(items[index].price.toString() ?? '',style: TextStyle(color: Colors.black ),), SizedBox(height: 5,),
                                           Text(items[index].unit.toString() ?? '',style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500 ),), SizedBox(height: 5,),
                                         ],

                                         ),
                                       ),


                                     ],

                                   ),
                                 ),SizedBox(height: 5,),
                                 Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                   children: [
                                     Column(
                                       children: [
                                         Text(items[index].lable1.toString() ?? '',style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500),), SizedBox(height: 5,),
                                         Text(items[index].quantity.toString() ?? '',style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500 ),), SizedBox(height: 5,),
                                       ],
                                     ),

                                     Text(items[index].lable2.toString() ?? '',style: TextStyle(color: Colors.black,fontWeight: FontWeight.w500 ),), SizedBox(height: 5,),
                                     Column(
                                       children: [
                                         Text('Total Amount',style: TextStyle(color: Colors.black ,fontWeight: FontWeight.w500),),
                                         Text(items[index].totalprice.toString() ?? '',style: TextStyle(color: Colors.black,fontWeight:FontWeight.w500 ),), SizedBox(height: 5,),
                                        ],
                                     ), SizedBox(height: 5,), 
                                   ],
                                 )

                               ],
                             ),
                           )
                       );
                     }
                     );
                 }
                 else{
                   return Center(child: CircularProgressIndicator(),);
                 }
               },
               )
                   ]
               )),
         ),
       );
    }
}
