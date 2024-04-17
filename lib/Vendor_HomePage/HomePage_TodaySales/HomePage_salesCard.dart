import 'dart:async';
import 'dart:convert';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/models/ToadySalesModel.dart';
import 'package:shared_preferences/shared_preferences.dart';
class sales extends StatefulWidget{
  @override
  State<sales> createState() => _salesState();
}

class _salesState extends State<sales> {
  String Total_sales="",Average_Sales="",Pickup_Count="";
  @override
  void initState() {
    super.initState();
    DetailsProduct();
  }

  Future<List<TodayModel>>DetailsProduct() async{
     var complete_url= appConstant.Today_Page;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key)?? '';
    var response=await CallApi().getData(vendor_id,complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    print(json);
    if(json['response']==200){
      var ResultList=json['Result'][0];
      setState(() {
        Total_sales = ResultList["total_sales"];
        print(Total_sales);
        Average_Sales=ResultList["average_sales"];
        Pickup_Count=ResultList["pickup_count"];

      });
      var Result=json['Result'];
      final list=(Result) as List<dynamic>;
      return list.map((e) => TodayModel.fromJson(e)).toList();
    }else{
      return [];
    }
  }

  @override
  Widget build(BuildContext context){
    return Padding(
        padding: const EdgeInsets.only(bottom: 15,top: 10),
        child: Expanded(
            flex:0,
            child: Container(
              height: 220,
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0), // Adjust the radius as needed
                ),
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20,left: 20,right: 20,bottom: 20),
                  child: Column(

                    children: [

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Total Sales",style: TextStyle(fontSize: 15),),
                          Column(
                            children: [
                              Text("₹ ${Total_sales.toString()}", style: TextStyle(fontSize: 15)),
                              Text("+50%",style: TextStyle(fontSize: 13,color:Colors.green),),
                            ],
                          ),
                        ],
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Pickup Count",style: TextStyle(fontSize: 15),),
                          Column(
                            children: [
                              Text("₹ ${Pickup_Count.toString()}", style: TextStyle(fontSize: 15)),
                              Text("+50%",style: TextStyle(fontSize: 13, color:Colors.green),),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Average Order Value",style: TextStyle(fontSize: 15),),
                          Column(
                            children: [
                              Text("₹ ${Average_Sales.toString()}", style: TextStyle(fontSize: 15)),

                              Text("+50%",style: TextStyle(fontSize: 13,color: Colors.green),),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Done",style: TextStyle(fontSize: 15),),
                          Column(
                            children: [
                              Text("₹ 400",style: TextStyle(fontSize: 15,),),
                              Text("+50%",style: TextStyle(fontSize: 13 ,color:Colors.green,),
                              )],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ),
            )
        ));

  }}








