import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/Store_Management/Shop_Details.dart';
import 'package:onlinedkhovendor/Vendor_Help.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Vendor_MorePage/coming_soon/more.dart';
import 'package:onlinedkhovendor/Vendor_Profile/Vendor_ProfilePage.dart';
import 'package:onlinedkhovendor/Widgets/TextFieldRoundedCorner.dart';
import 'package:onlinedkhovendor/auth_ui/Vendor_login/vendor_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Call_Api/Api.dart';
class venMore extends StatefulWidget {
  @override
  State<venMore> createState() => _venMoreState();
}

class _venMoreState extends State<venMore> {
  @override
  void initState() {
    super.initState();
    //GetProfileHeaderDetails();
  }
  Future<Map<String, dynamic>> GetProfileHeaderDetails()async{
    //ProfileDetailsFuture<Json> GetProfileHeaderDetails() async {
    var complete_url= appConstant.ProfileDetails;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key)?? '';
    var response = await CallApi().getData(vendor_id, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    if(json['response']==200){
      final Map<String, dynamic> data = json['Result'];
      // print(data);
      return data;
    }else {
      throw Exception('Failed to load data from theAPI');}
  }
  Future<void> _logout(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
      Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => vendorLogin()),
          (Route<dynamic> route) => false, // This predicate disables back navigation
    );
  }
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    Widget body = SafeArea(
      child: Scaffold(
        floatingActionButton: FloatingActionButton(
          heroTag: null,
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => venHelp()
                ));
          },
          child: const Icon(Icons.help),
        ),
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child:
          Column(
              children: [
                HomePageTop(),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 320,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),)
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FutureBuilder<Map<String, dynamic>>(
                            future: GetProfileHeaderDetails(),
                            builder: (context, snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return CircularProgressIndicator(); // Show a loading indicator while fetching data.
                              } else if (snapshot.hasError) {
                                return Text('Error: ${snapshot.error}');
                              } else {
                                final apiValue = snapshot.data;
                                final name = (apiValue?['name']);
                                final email = (apiValue?['email']);
                                return Column(
                                  children: [
                                    Text(name),
                                    SizedBox(height: 5),
                                    Text(email),
                                  ],
                                );
                              }
                            },
                          ),


                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Align(alignment: Alignment.topLeft,
                                child:  Text(email.text)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {

                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Profile()
                        ));
                  },
                ),
                Padding(
                    padding: const EdgeInsets.only(top: 18, left: 30),
                    child: Row(
                        children: [
                          InkWell(
                            child: Container(
                              width: 70,
                              height: 90,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [
                                  BoxShadow(color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 10,
                                    offset: Offset(0, 3),)
                                ],
                              ),
                              child: Column(children: [
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 25),
                                      child: Container(
                                          alignment: Alignment.center,
                                          child: Icon(Icons.store)
                                      ),
                                    ),
                                    SizedBox(height: 5,),
                                    Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Text("Store Management",
                                        style: TextStyle(fontSize: 10),),
                                    ),
                                  ],
                                )
                              ],),),
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>
                                      ShopStore()
                                  ));
                            },
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 11),
                            child: InkWell(
                              child: Container(
                                  width: 70,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 3,
                                        blurRadius: 10, offset: Offset(0, 3),)
                                    ],
                                  ),
                                  child: Column(children: [
                                    Column(
                                      mainAxisAlignment: MainAxisAlignment
                                          .center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              top: 25),
                                          child: Container(
                                              alignment: Alignment.center,
                                              child: Icon(Icons.rate_review)
                                          ),
                                        ),
                                        SizedBox(height: 5,),
                                        Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Center(child: Text(
                                            "Rating Management",
                                            style: TextStyle(fontSize: 10),)),
                                        ),
                                      ],
                                    ),
                                  ],
                                  )
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        coming_soon()
                                    ));

                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              child: Container(
                                width: 70,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),)
                                  ],
                                ),
                                child: Column(children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Icon(Icons.person)
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Padding(
                                        padding: const EdgeInsets.all(3.0),
                                        child: Text("Customer Funnel",
                                          style: TextStyle(fontSize: 10),),
                                      )
                                    ],
                                  ),
                                ]
                                ),

                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        coming_soon()
                                    ));

                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: InkWell(
                              child: Container(
                                width: 70,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 3,
                                      blurRadius: 10,
                                      offset: Offset(0, 3),)
                                  ],
                                ),
                                child: Column(children: [
                                  Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 25),
                                        child: Container(
                                            alignment: Alignment.center,
                                            child: Icon(Icons.payment)
                                        ),
                                      ),
                                      SizedBox(height: 5,),
                                      Center(child: Text("Marketing",
                                        style: TextStyle(fontSize: 10),))
                                    ],
                                  ),
                                ]
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) =>
                                        coming_soon()
                                    ));

                              },
                            ),
                          )
                        ]
                    )
                ),
                SizedBox(height: 20,),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.share),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Share Service/Shop"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                )
,
                SizedBox(height: 5,),
                /*InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.share),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Share"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                )
                ,*/
             //   SizedBox(height: 5,),
               /* InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 5),
                              child: Container(
                                alignment: Alignment.topLeft,
                                child: Icon(Icons.share),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Text("Rate And Review"),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  onTap: () {},
                ),*/
                SizedBox(height: 5,),
                InkWell(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 11),
                    child: Container(
                      width: 320,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 10,
                            offset: Offset(0, 3),
                          )
                        ],
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Container(
                              alignment: Alignment.topLeft,
                              child: Icon(Icons.logout),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text("Logout"),
                          ),
                        ],
                      ),
                    ),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Logout"),
                          content: Text("Are you sure you want to logout ?"),
                          actions: [
                            TextButton(
                              child: Text("Cancel"),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                            TextButton(
                              child: Text("Logout",style: TextStyle(color: Colors.red),),
                              onPressed: () {
                                Navigator.of(context).pop();
                                _logout(context); // Call logout function upon confirmation


                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),



              ]
          ),
        ),
      ),
    );
    return BootomNavHome(context, body); // Pass the body widget


  }
}
