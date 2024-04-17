import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_TodaySales/HomePageSalesMainpage.dart';

class SalesContainer extends StatefulWidget{
  @override
  State<SalesContainer> createState() => _SalesContainerState();
}

class _SalesContainerState extends State<SalesContainer> {
  @override
  Widget build(BuildContext context){
    return
      SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(right: 10),
          child: Column(
            children: [
              InkWell(
              child:Container(
                height: 25,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(
                    color: Colors.grey
                  ),
                ),
              ),
              onTap: (){

                Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) =>  TodaySales()
                    ));
              },),
               InkWell(child: Text("Today",style: TextStyle(fontSize: 12,color: Colors.grey,fontWeight: FontWeight.w500),),
               onTap: (){
                 Navigator.push(
                     context,
                     MaterialPageRoute(builder: (context) =>  TodaySales()
                     ));

               },)

            ],
          ),
        ),
      );

  }}









