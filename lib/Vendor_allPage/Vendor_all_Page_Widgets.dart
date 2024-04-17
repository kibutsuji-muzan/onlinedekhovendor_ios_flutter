import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Ven_Order_Details/order_details_mainpage.dart';
import 'package:onlinedkhovendor/Widgets/Elevated_Button.dart';
import 'package:onlinedkhovendor/Widgets/Gradient_slider/slider_glider_cancel.dart';
import 'package:onlinedkhovendor/Widgets/Gradient_slider/slider_gradient.dart';
import 'package:onlinedkhovendor/models/OrderInitiatedModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:onlinedkhovendor/Widgets/Gradient_slider/slider_glider_done.dart';

class AllpageWidget extends StatefulWidget {
  @override
  State<AllpageWidget> createState() => _AllpageWidgetState();
}

class _AllpageWidgetState extends State<AllpageWidget> {
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  Future<List<OrderInitiatedModel>> orderdetailInitiated() async {
    var complete_url = appConstant.OrderInitiatedDoneAllStatus;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var data = {
      "vendorid": prefs.getString(storepref.vendor_id_key) ?? '',
      "deliverystatus": null,
      "start_date": null,
      "end_date": null,
      "servicename": null
    };
    var response = await CallApi().postData(data, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    if (json['response'] == 200) {
      var OrderDetail = json['Result'];
      //print(OrderDetail);
      final list = (OrderDetail) as List<dynamic>;
      return list.map((e) => OrderInitiatedModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: orderdetailInitiated(),
      builder: (context, data) {
        if (data.hasError) {
          return Center(child: Text("${data.error}"));
        } else if (data.hasData) {
          var items = data.data as List<OrderInitiatedModel>;
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
            itemCount: items?.length ?? 0,
            itemBuilder: (BuildContext context, int index) {
              bool isDone = items[index].deliverystatus == 'Done';
              bool isCancelled =
                  items[index].deliverystatus == 'Cancelled by User' ||
                      items[index].deliverystatus == 'Cancelled by Vendor';

              return Card(
                margin: EdgeInsets.symmetric(vertical: 8.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Displaying booking details
                      Text(
                        "Booking Id: ${items[index].bookingid}",
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          fontSize: isMobile(context) ? 16 : 20,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Shop Name: ${items[index].servicename}",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 12 : 16,
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        "Customer Name: ${items[index].user_name}",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 12 : 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Customer Mobile: ${items[index].user_mobileno}",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 12 : 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Delivery Agent: ${items[index].deliveryboy_name}",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 12 : 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Agent Number: ${items[index].deliveryboy_mobileno}",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 12 : 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Delivery Status: ${items[index].deliverystatus}",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 12 : 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 6),
                      Text(
                        "Order Type: ${items[index].delivery_type}",
                        style: TextStyle(
                          fontSize: isMobile(context) ? 12 : 16,
                          color: Colors.grey,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(height: 16),
                      // Order details button

                      Container(
                        height: 30,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => orderMain(
                                    bookingid:
                                        items[index].bookingid.toString()),
                              ),
                            );
                          },
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            backgroundColor: Color(0xFF03a9f4),
                          ),
                          child: Text('Order Details'),
                        ),
                      ),
                      // Sliders

                      if (!isDone && !isCancelled)
                        DoneSlider(
                          onSubmitCallback: () {
                            OrderDone(items[index].bookingid.toString());
                          },
                        ),
                      if (isDone && !isCancelled)
                        if (!isDone && !isCancelled)
                          gradient_slider(
                            onSubmitCallback: () {
                              OrderAccept(items[index].bookingid.toString());
                            },
                          ),
                      if (isDone && !isCancelled)
                        if (!isDone && !isCancelled)
                          gradient_slidercancel(
                            onSubmitCallback: () {
                              OrderCancelation(
                                  items[index].bookingid.toString());
                            },
                          ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

OrderCancelation(bookingId) async {
  var complete_url = appConstant.ToCancelorder;
  var merge_id = "10602/" + bookingId;
  var response = await CallApi().getData(merge_id, complete_url);
  final body = response.body;
  final json = jsonDecode(body);
  if (json['response'] == 200) {
    if (json['Result'] == "Cancel") {
////redirected
    }
  }
}

OrderAccept(bookingId) async {
  var complete_url = appConstant.ToAcceptorder;

  var merge_id = "10602/" + bookingId;
  // print(merge_id);
  var response = await CallApi().getData(merge_id, complete_url);
  final body = response.body;
  final json = jsonDecode(body);
  if (json['response'] == 200) {
    if (json['Result'] == "Cancel") {}
  }
}

OrderDone(bookingId) async {
  var complete_url = appConstant.SlideDone;
  var merge_id = "10602/" + bookingId;
  var response = await CallApi().getData(merge_id, complete_url);
  final body = response.body;
  final json = jsonDecode(body);
  if (json['response'] == 200) {
    if (json['Result'] == "Cancel") {}
  }
}
