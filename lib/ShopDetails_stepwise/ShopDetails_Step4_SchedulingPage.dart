import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Widgets/Checkboxes/simple_checkbox.dart';

import '../Vendor_HomePage/HomePage_BottomNavBar.dart';
import '../Vendor_HomePage/HomePage_Header.dart';

class shop4MainPage extends StatefulWidget {
  final String shopids;

  shop4MainPage({required this.shopids});
  @override
  State<shop4MainPage> createState() => _shop4MainPageState();
}

class _shop4MainPageState extends State<shop4MainPage> {
  bool isVisible = true;

  bool closeondate=true;

  TimeOfDay _openingTime = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _closingTime = TimeOfDay(hour: 18, minute: 0); // Set a default closing time
  TimeOfDay  _openAgainShopTime = TimeOfDay(hour: 7, minute: 15);
  TimeOfDay _closeAgainShopTime = TimeOfDay(hour: 18, minute: 0); //

  Future<void> _selectOpeningTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _openingTime,
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (newTime != null) {
      setState(() {
        _openingTime = newTime;
      });
    }
  }

  Future<void> _selectClosingTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _closingTime,
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (newTime != null) {
      setState(() {
        _closingTime = newTime;
      });
    }
  }
  Future<void> _selectOpenTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _openingTime,
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (newTime != null) {
      setState(() {
        _openingTime = newTime;
      });
    }
  }

  Future<void> _selectCloseTime(BuildContext context) async {
    final TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: _closingTime,
      initialEntryMode: TimePickerEntryMode.input,
    );

    if (newTime != null) {
      setState(() {
        _closingTime = newTime;
      });
    }
  }

  List<String> selected = [];
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  String? selectedDay = 'Select Days Of week';

  List<String> daysOfWeek = [
    'Sunday',
    'Monday',
    'Tuesday',
    'Wednesday',
    'Thursday',
    'Friday',
    'Saturday',
  ];

  @override
  Widget build(BuildContext context) {
    print('Shop ID: ${widget.shopids}');
    Widget body = Column(
      children: [
        HomePageTop(),
        Padding(
          padding: const EdgeInsets.only(top: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(color: Colors.grey),
                  color: Colors.white,
                ),
                child: DropdownButton<String>(
                  value: selectedDay,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedDay = newValue;
                    });
                  },
                  underline: SizedBox(),
                  icon: Icon(Icons.arrow_drop_down),
                  items: [
                    DropdownMenuItem<String>(
                      value: 'Select Days Of week',
                      child: Text('Select Days Of week'),
                    ),
                    for (String day in daysOfWeek)
                      DropdownMenuItem<String>(
                        value: day,
                        child: Text(day),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Container(
                width: 300,
                child:
                Column(
                  children: [
                    Visibility(
                      visible: closeondate,
                      child: GestureDetector(
                        onTap: () => _selectOpeningTime(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Opening Time: ${_openingTime.format(context)}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Visibility(
                      visible: closeondate,
                      child: GestureDetector(
                        onTap: () => _selectClosingTime(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Closing Time: ${_closingTime.format(context)}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),

                    Visibility(
                      visible: !isVisible,
                      child: GestureDetector(
                        onTap: () => _selectOpenTime(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Opening Time: ${_openingTime.format(context)}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Visibility(
                      visible: !isVisible,

                      child: GestureDetector(
                        onTap: () => _selectCloseTime(context),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 14.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            border: Border.all(color: Colors.grey),
                            color: Colors.white,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Closing Time: ${_closingTime.format(context)}',
                                style: TextStyle(fontSize: 16.0),
                              ),
                              Icon(Icons.arrow_drop_down),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Visibility(
                      visible: !isVisible,

                      child: Align(alignment: Alignment.topLeft,
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              isVisible = true;
                            });
                          },

                          child: Text('Cancel'),
                        ),
                      ),
                    ),
                    Visibility(
                       child: Align(alignment: Alignment.topRight,
                        child: ElevatedButton(
                          onPressed: (){
                            setState(() {
                              isVisible = false;
                            });
                          },

                          child: Text('Add More'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
              children: [
              checkbox(title: 'checkbox',onPressed: (){
                setState(() {
                  closeondate = true;

                });
              },),
    SizedBox(height: 25,),
    Row(
    children: [
     Padding(
    padding: const EdgeInsets.only(left:3),
    child: Text('Closed On That Day'),
    ),
    ],
    ),
            ],
          ),
        ]),
        ),
        Container(
          height: 25,
          child: ElevatedButton(
              onPressed: (){
                shop4_insert();
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                backgroundColor: Color(0xFF03a9f4),
              ),
              child: Text('Proceed',style: TextStyle(fontSize: isMobile(context) ? 12 : 16,),)),
        ),
      ],
    );
    return BootomNavHome(context, body);
  }
  Future<void> shop4_insert() async {
    try {
      var data = {
        "Shop_id": widget.shopids,
        "open_time": _openingTime.format(context), // Add opening time
        "close_time": _closingTime.format(context),
      };
      var complete_url = appConstant.shopInfoInsert;
      var response = await CallApi().postData(data, complete_url);

      if (response.statusCode == 200) {
        final body = response.body;
        final json = jsonDecode(body);
        final results = json['message'] as String;
        print(results);
      } else {
        print('Error: ${response.statusCode}');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

}
