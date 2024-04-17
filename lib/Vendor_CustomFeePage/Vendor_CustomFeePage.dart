import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Widgets/Elevated_Button.dart';
import 'package:onlinedkhovendor/Widgets/TextFieldRoundedCorner.dart';



class Custom_fee extends StatelessWidget {
  TextEditingController name=TextEditingController();
  TextEditingController account_name=TextEditingController();
  TextEditingController account_number=TextEditingController();
  TextEditingController ifsc=TextEditingController();
  TextEditingController upiid=TextEditingController();
  @override
  Widget build(BuildContext context) {


    Widget body =
    Column(
      children: [
        HomePageTop(),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Container(
            height: 170,
            width: 370,
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Align(alignment:Alignment.topLeft,child: Text("Vendor_Id: 16020",style: TextStyle(fontWeight: FontWeight.bold),)),
                        IconButton(
                          icon: const Icon(Icons.edit,color: Colors.lightBlueAccent,),
                          onPressed: () {
                            showModalBottomSheet(context: context, builder: (BuildContext context){
                              return SingleChildScrollView(scrollDirection: Axis.vertical,
                                child: Container(
                                  child: Column(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Container(
                                          height: 50,
                                          width: 370,
                                          child:  Card(
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20.0)
                                            ),
                                            child:Align(alignment:Alignment.center,child: Text("Update Account Details",style: TextStyle(fontWeight: FontWeight.bold),)),

                                          ),
                                        ),
                                      ),
                                      Container(
                                        width:370,
                                        child: Card(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15),
                                          ),
                                          child: Column(
                                            children: [
                                              TexttField(title: 'Delivery_fee:',icon:Icons.shop,controller:name,onPressed: (){},),
                                              TexttField(title: 'Packaging_fee: ',icon:Icons.account_balance,controller:account_name,onPressed: (){},),
                                                Padding(
                                                padding: const EdgeInsets.only(bottom: 20),
                                                child: TexttField(title: 'Taxes: ',icon:Icons.account_balance_wallet,controller:upiid,onPressed: (){},),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(bottom: 15),
                                                child: Container(
                                                  height: 25,
                                                  child: ElevatedButton(
                                                      onPressed: (){},
                                                      style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(
                                                            borderRadius: BorderRadius.circular(5.0)
                                                        ),
                                                      ),
                                                      child: Text("UPDATE")),
                                                ),
                                              )

                                            ],
                                          ),
                                        ),
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ],
                    ),
                    SizedBox(height:3,),

                    Align(alignment: Alignment.topLeft,
                      child: RichText(
                          text: const TextSpan(
                            text: 'Service ID: ',
                            style: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400
                            ),
                            children: [
                              TextSpan(
                                text: '1002',
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontStyle: FontStyle.italic,
                                    fontWeight: FontWeight.w500

                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height:3,),

                    Align(alignment: Alignment.topLeft,
                      child: RichText(
                          text: const TextSpan(
                            text: 'Delivery_fee: ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: '40/-',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,

                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height:3,),

                    Align(alignment: Alignment.topLeft,
                      child: RichText(
                          text: const TextSpan(
                            text: 'Packaging_Fee: ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: '50/-',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,

                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height:3,),

                    Align(alignment: Alignment.topLeft,
                      child: RichText(
                          text: const TextSpan(
                            text: 'Taxes: ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: ' 10%',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,

                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                    SizedBox(height:3,),

                    Align(alignment: Alignment.topLeft,
                      child: RichText(
                          text: const TextSpan(
                            text: 'Booking_Id: ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                            children: [
                              TextSpan(
                                text: '10611',
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontStyle: FontStyle.italic,

                                ),
                              ),
                            ],
                          )
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );


    return BootomNavHome(context,  body); // Pass the body widget
  }
}

