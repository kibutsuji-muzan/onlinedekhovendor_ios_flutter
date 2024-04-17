import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/bottomsheethome.dart';
import 'package:onlinedkhovendor/Vendor_ServicePage/modal_sheet_serviceWidget.dart';
import 'package:onlinedkhovendor/models/ShopDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ServiceVen extends StatefulWidget {
  final String searchText;

  ServiceVen({required this.searchText});

  @override
  _ServiceVenState createState() => _ServiceVenState();
}

class _ServiceVenState extends State<ServiceVen> {
  List<ProductDetailModel> items = [];

  Future<List<ProductDetailModel>> showShopDetails() async {
    var complete_url = appConstant.SubserviceDetails;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key) ?? '';

    var all_value = vendor_id + '/null/' + widget.searchText;

    var response = await CallApi().getData(all_value, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    if (json['response'] == 200) {
      var ProductDetail = json['Result'];
      final list = (ProductDetail) as List<dynamic>;
      return list.map((e) => ProductDetailModel.fromJson(e)).toList();
    } else {
      return [];
    }
  }

  @override
  void initState() {
    super.initState();

    // Fetch and initialize the items list here using your showShopDetails() function
    showShopDetails().then((data) {
      setState(() {
        items = data;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    bool isSwitched = false;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            child: FutureBuilder(
              future: showShopDetails(),
              builder: (context, data) {
                if (data.hasError) {
                  return Center(child: Text("${data.error}"));
                } else if (data.hasData) {
                  var items = data.data as List<ProductDetailModel>;
                  return ListView.builder(
                    itemCount: items == null ? 0 : items.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20.0),
                        ),
                        elevation: 10,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width: 150,
                                        child: Text(
                                          items[index]
                                              .subservicename
                                              .toString(),
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black54,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      Text(
                                        items[index].price.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        items[index].unit.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 3),
                                      Text(
                                        items[index].lable1.toString(),
                                        style: TextStyle(
                                          fontSize: 14,
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      SizedBox(height: 5),
                                      /*  Switch(
                                        value: isSwitched,
                                        onChanged: (value) {
                                          setState(() {
                                            isSwitched = value;
                                          });
                                          String status = value ? 'active' : 'deactivate'; // Determine the status based on switch state
                                          String subserviceId = items[index].subserviceid!; // Use ! to assert that subserviceid is not null
                                          toggle(subserviceId, status); // Call the toggle function with subserviceid and status
                                        },
                                      )*/

                                      Switch(
                                        value: items[index].status ==
                                            'active', // Set the switch value based on the current status
                                        onChanged: (value) async {
                                          setState(() {
                                            // Update the UI immediately to reflect the user's interaction
                                            items[index].status =
                                                value ? 'active' : 'deactivate';
                                          });
                                          String status =
                                              value ? 'active' : 'deactivate';
                                          String subserviceId =
                                              items[index].subserviceid!;
                                          // Call the toggle function and handle the response
                                          await toggle(subserviceId, status);
                                          // Fetch the updated item details after the toggle to ensure consistency
                                          var updatedItems =
                                              await showShopDetails();
                                          setState(() {
                                            items = updatedItems;
                                          });
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 90,
                                      width: 90,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        color: Colors.grey,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    ElevatedButton(
                                      onPressed: () {
                                        showModalBottomSheet<void>(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return Container(
                                              height: 300,
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: <Widget>[
                                                  price_update_service(),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      style: ElevatedButton.styleFrom(
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                        ),
                                      ),
                                      child: Text("Update"),
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
                  return Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: ElevatedButton(
                onPressed: () {
                  showModalBottomSheet(
                      context: context,
                      builder: (BuildContext context) {
                        return SizedBox(
                          child: ElevatedButton(
                            child: bottomsheetallorder(),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                          ),
                        );
                      });
                },
                child: Text("+"),
                style: ElevatedButton.styleFrom(
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(16.0),
                ),
              ),
            ),
          ])
        ],
      ),
    );
  }
}

Future<void> toggle(String subserviceid, String status) async {
  var complete_url = appConstant.ProductStatusUpdate;
  var data = {
    "subserviceid": subserviceid,
    "status": status,
  };
  var response = await CallApi().postData(data, complete_url);
  final body = response.body;
  final json = jsonDecode(body);
  print(json);
  if (json[response] == 200) {
  } else {}
}
