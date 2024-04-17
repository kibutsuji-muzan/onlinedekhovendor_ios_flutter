import 'dart:async';
import 'dart:convert';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Ven_Order_Details/order_details_mainpage.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_CancelPage/Cancel_Page_Vendor.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_CancelPage/Vendor_CancelPage_Main.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_InitiatedPage/InititatePage_MainPage.dart';
import 'package:onlinedkhovendor/Widgets/Gradient_slider/slider_glider_cancel.dart';
import 'package:onlinedkhovendor/Widgets/Gradient_slider/slider_glider_done.dart';
import 'package:onlinedkhovendor/Widgets/Gradient_slider/slider_gradient.dart';
import 'package:onlinedkhovendor/models/OrderInitiatedModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Widgets/Elevated_Button.dart';

class bottomsheetallorder extends StatefulWidget {
  @override
  State<bottomsheetallorder> createState() => _bottomsheetallorderState();
}

class _bottomsheetallorderState extends State<bottomsheetallorder> {
  TextEditingController otpController = TextEditingController();

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  Future<List<OrderInitiatedModel>> orderdetailInitiated() async {
    var complete_url = appConstant.OrderInitiatedDoneAllStatus;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = {
      "vendorid": prefs.getString(storepref.vendor_id_key) ?? '',
      "deliverystatus": "Order Placed",
      "start_date": null,
      "end_date": null,
      "servicename": null
    };
    var response = await CallApi().postData(data, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    if (json['response'] == 200) {
      var OrderDetail = json['Result'];
      final list = (OrderDetail) as List<dynamic>;
      return list.map((e) => OrderInitiatedModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  bool isFinished = false;
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
              child: Image.asset(
                "assets/images/noOrders.png", // Replace with your image path
                width: 700, // Adjust width as needed
                height: 700, // Adjust height a
                // s needed
              ),
            );
          }
          return ListView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            itemCount: items == null ? 0 : items.length,
            itemBuilder: (BuildContext context, int index) {
              // Add a return statent to return the Card widget
              return Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Card(
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
                              "Booking Id: ${items[index].bookingid.toString()}",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 12 : 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Shop Name: ${items[index].servicename.toString()}",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 12 : 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Customer Name: ${items[index].user_name.toString()}",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 12 : 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Customer Mobile Number: ${items[index].user_mobileno.toString()}",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 12 : 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Delivery Agent: ${items[index].deliveryboy_name.toString()}",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 12 : 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Delivery Agent Number: ${items[index].deliveryboy_mobileno.toString()}",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 12 : 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Delivery Status: ${items[index].deliverystatus.toString()}",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 12 : 16,
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Order Type: ${items[index].delivery_type.toString()}",
                              style: TextStyle(
                                fontSize: isMobile(context) ? 12 : 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: 30,
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => orderMain(
                                          bookingid: items[index]
                                              .bookingid
                                              .toString()),
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
                            Column(
                              children: [
                                SizedBox(
                                  height:
                                      40, // Set a percentage of screen width
                                  width: MediaQuery.of(context).size.width *
                                      0.8, // Set a percentage of screen width
                                  child: gradient_slider(
                                    onSubmitCallback: () {
                                      OrderAccept(
                                          items[index].bookingid.toString());
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Center(
                                  child: SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width * 0.8,
                                    height:
                                        40, // Set a percentage of screen width
                                    child: gradient_slidercancel(
                                      onSubmitCallback: () {
                                        OrderCancelation(
                                            items[index].bookingid.toString());
                                      },
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
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

  Getmatchtopdata() async {
    var complete_url = appConstant.DoneMatchOtp;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key) ?? '';
    var bookingid = '1057';
    String randomNumber = otpController.text;

    var response = await CallApi().getData(
        vendor_id + "/" + bookingid + "/" + randomNumber, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    //print(json);
    if (json['response'] == 200 && json['message'] == "success") {
    } else {
      Fluttertoast.showToast(
          msg: "Invalid Otp ! Enter Correct OTP",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

  OrderDone(bookingId) async {
    var complete_url = appConstant.SlideDone;

    var merge_id = "10602/" + bookingId;
    var response = await CallApi().getData(merge_id, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    print(json);
    if (json['message'] == "Otp sent") {
      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Container(
            padding: EdgeInsets.all(20.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Enter OTP",
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20.0),
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "OTP",
                    hintText: "Enter OTP",
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Getmatchtopdata();
                  },
                  child: Text("Done"),
                ),
              ],
            ),
          );
        },
      );
    } else {
      // Handle other cases here if needed.
    }
  }
}
