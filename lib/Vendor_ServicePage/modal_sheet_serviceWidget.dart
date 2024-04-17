import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/models/ShopDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/ShopDetailsModel.dart';

class price_update_service extends StatefulWidget {
  @override
  State<price_update_service> createState() => _price_update_serviceState();
}

class _price_update_serviceState extends State<price_update_service> {
  TextEditingController mrp=TextEditingController();
  TextEditingController new_price=TextEditingController();
  TextEditingController discount=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProductPrice();

  }
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),

        child: Column(
          children: [
            Text("Update Price",style: TextStyle(fontSize: 22,color: Colors.lightBlueAccent,fontWeight: FontWeight.w500),),
            TextField(controller: mrp,decoration: InputDecoration(labelText: "MRP"),),
            TextField(controller:new_price,decoration:InputDecoration(labelText: "New Price"),),
            TextField(controller:discount,decoration: InputDecoration(labelText: "Discount"),),
            SizedBox(height: 15,),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: (){updateProductPrice();}, child: Text("Update")),
                ElevatedButton(onPressed: (){Navigator.pop(context);
                }, child: Text("Cancel")),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> getProductPrice() async {
    var complete_url = appConstant.ProductPriceGet;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key)?? '';
    print(vendor_id);
    var response = await CallApi().getData(vendor_id, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    if (json['response'] == 200) {
      var ProductDetail=json['Result'];
      mrp.text = ProductDetail['MRPhead'];
      new_price.text = ProductDetail['price'];
      discount.text = ProductDetail['discountval'];

    }
  }

  updateProductPrice()async{
    var complete_url=appConstant.ProductPriceUpdate;
    SharedPreferences prefs = await SharedPreferences.getInstance();

    var data={
      "subserviceid":'1001',
      "MRPhead": mrp.text,
      "price":new_price.text,
      "discountval":discount.text
    };
    var response=await CallApi().postData(data, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    print("Update Request Data: $data");
    if(json['Result']=="success" && json['response']==200){
      Fluttertoast.showToast(
          msg: "Price Details Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
    else{
      print("Failed to Update Price Of a Product");
    }

  }

  }

