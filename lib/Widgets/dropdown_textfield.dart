import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../Call_Api/Api.dart';
import '../models/dropdownmodel.dart';

class dropdown extends StatefulWidget {
  @override
  State<dropdown> createState() => _dropdownState();
}

class _dropdownState extends State<dropdown> {
  List<Map<String, dynamic>> dropDownListData = [];
  String? defaultValue;

  @override
  void initState() {
    super.initState();
    fetchDataFromAPI();
  }

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  Future<void> fetchDataFromAPI() async {
    try {
      var data = await getDataFromAPI(); // Fetch data from the API
      setState(() {
        dropDownListData = data; // Set the data in the state
      });
    } catch (e) {
      // Handle errors, e.g., connection issues or API errors
      print("Error fetching data: $e");
    }
  }

  Future<List<Map<String, dynamic>>> getDataFromAPI() async {
    var complete_url = appConstant.ShopDetails;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key) ?? '';
    var response = await CallApi().getData(vendor_id, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
 
    if (json['response'] == 200) {
      final List<dynamic> shopList = json['Result']['shops'];
      for (var shop in shopList) {
        print("Shop Item: $shop");
        print("Servicename: ${shop['servicename']}");
        print("Market: ${shop['market']}");
      }
      return shopList.map((shop) {
        print("Value: ${shop['sid']}"); // Print the value to check its type
        return {
          'title': shop['servicename'],
          'subtitle': shop['market'],
          'value': shop['sid'].toString(),
        };
      }).toList();
    } else {
      throw Exception('Failed to load data from the API');
    }
  }

  // Helper function to safely convert a string to an integer
  int parseToInt(String value) {
    try {
      return int.parse(value);
    } catch (e) {
      print("Error parsing value: $e");
      return 0; // Set a default value or handle the error as needed
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        height: 40,
        width: 150,
        child: ListView(
          shrinkWrap: true,
          children: [
            DropdownButtonHideUnderline(
              child: DropdownButton<String>(
                value: defaultValue,
                isExpanded: true,
                menuMaxHeight: 350,
                items: [
                  DropdownMenuItem(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "SHOP NAME",
                          style: TextStyle(
                            fontSize: isMobile(context) ? 13 : 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "ADDRESS",
                          style: TextStyle(
                            fontSize: isMobile(context) ? 13 : 15,
                            color: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                    value: "",
                  ),
                  ...dropDownListData.map<DropdownMenuItem<String>>((e) {
                    return DropdownMenuItem(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e['title']),
                          Text(
                            e['subtitle'],
                            style: TextStyle(
                              fontSize: isMobile(context) ? 13 : 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      value: e['value'].toString(),
                    );
                  }),
                ],
                onChanged: (value) {
                  print("Selected Value Type: String");
                  print("Selected Value: $value");

                  // Use the helper function to convert the value to an integer
                  int intValue = parseToInt(value ?? '');

                  // Now you can use intValue as an integer

                  Future.delayed(Duration.zero, () {
                    setState(() {
                      defaultValue = value;
                    });
                  });
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
