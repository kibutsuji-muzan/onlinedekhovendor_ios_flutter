import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/VendorPromocode/Coupon_detailsVendor.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_ButtonsTabbar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_CarouselSlider.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/models/OrderInitiatedModel.dart';
import 'package:onlinedkhovendor/models/ShopDetailsModel.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../ShopDetails_stepwise/ShopDetails_Step1_MainPage.dart';

class ShopStore extends StatefulWidget {
  @override
  State<ShopStore> createState() => _ShopStoreState();
}
bool isSwitched = false;

class _ShopStoreState extends State<ShopStore> {
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  Future<List<ProductDetailModel>>showShopDetails() async{
    // ShowPaymentTransaction() async {
    var complete_url= appConstant.ShopDetails;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key)?? '';
    var response = await CallApi().getData(vendor_id, complete_url);
     final body = response.body;
    final json = jsonDecode(body);
    if(json['response']==200){
      var ProductDetail=json['Result'];
      print(ProductDetail);
      final list=(ProductDetail) as List<dynamic>;
      return list.map((e) => ProductDetailModel.fromJson(e)).toList();
    }else{
      return [];
    }
  }

  @override
  Widget build(BuildContext context) {
    late final _ratingController;
    late double _rating;
    double _userRating = 3.0;
    int _ratingBarMode = 1;
    double _initialRating = 2.0;
    bool _isRTLMode = false;
    bool _isVertical = false;
    IconData? _selectedIcon;
    Widget body =  SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          toolbarHeight: 45.0, // Adjust the height as needed

          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0), // Adjust padding as needed
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) =>  shop1MainPage()
                      ));
                },
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  backgroundColor: Colors.grey,
                ),
                child: Text('ADD STORE'),
              ),
            ),
          ],

        ),
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child:
          Container(
              height: MediaQuery.of(context).size.height, // Set a fixed height or use constraints
              child:
              FutureBuilder(future:showShopDetails(),
                  builder: (context,data){
                    if(data.hasError){
                      return Center(child: Text("${data.error}"));
                    }
                    else if(data.hasData){
                      var items=data.data as List<ProductDetailModel>;
                      return
                        ListView.builder(
                          itemCount:items==null?0:items.length,
                          itemBuilder: (BuildContext context, int index) {
                            return  Card(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20.0)
                              ),
                              elevation: 10,
                              child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Column(
                                          children: [
                                            Container(
                                              height: 60,
                                              width: 60,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(15),
                                                  // image: DecorationImage(
                                                  //   image: NetworkImage(appConstant.imageurl+(items[index].servicename ?? '')+'/'+(items[index]. ?? ''))
                                                  // ),
                                                  color: Colors.grey,
                                              ),
                                             // child: Image.asset( AssetsImage.instance.foodd,width: 20, ),
                                            ),
                                          ],
                                        ),
                                        Column(
                                            children: [
                                              TextButton(onPressed:  (){}, child:Text(items[index].servicename.toString(),style: TextStyle(color: Colors.grey,fontSize: isMobile(context) ? 12 : 16,),)),
                                              TextButton(onPressed:  (){}, child:Text(items[index].market.toString(),style: TextStyle(color: Colors.grey,fontSize: isMobile(context) ? 12 : 16,),)),
                                              TextButton(onPressed:  (){}, child:Text(items[index].shop_mob_no.toString(),style: TextStyle(color: Colors.grey,fontSize: isMobile(context) ? 12 : 16,),)),



                                              // RatingBar.builder(
                                              //   initialRating: _initialRating,
                                              //   minRating: 1,
                                              //   direction: _isVertical ? Axis.vertical : Axis.horizontal,
                                              //   allowHalfRating: true,
                                              //   unratedColor: Colors.amber.withAlpha(50),
                                              //   itemCount: 5,
                                              //   itemSize: 20.0,
                                              //   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                                              //   itemBuilder: (context, _) => Icon(
                                              //     _selectedIcon ?? Icons.star,
                                              //     color: Colors.amber,
                                              //   ),
                                              //   onRatingUpdate: (rating) {
                                              //     setState(() {
                                              //       _rating = rating;
                                              //     });
                                              //   },
                                              //   updateOnDrag: true,
                                              // )

                                            ]),
                                        Column(
                                          children: [
                                            TextButton(onPressed:  (){}, child:Text(items[index].status.toString(),style: TextStyle(fontSize: isMobile(context) ? 12 : 16,),)),


                                            //TextButton.icon(onPressed: (){}, icon:Icon(Icons.share), label:Text("Share")),
                                            Switch(
                                              value: isSwitched,
                                              onChanged: (value) {
                                                setState(() {
                                                  isSwitched = value;
                                                });
                                              },
                                            ),
                                            Container(
                                              height: 20,
                                              child: ElevatedButton(
                                                  onPressed: (){
                                                  },
                                                  style: ElevatedButton.styleFrom(
                                                    shape: RoundedRectangleBorder(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                    ),
                                                    backgroundColor: Color(0xFF03a9f4),
                                                  ),
                                                  child: Text('Manage',style: TextStyle(fontSize: isMobile(context) ? 12 : 16,),)),
                                            ),
                                          ],
                                        )

                                      ],
                                    ),
                                  )
                              ),
                            );
                          },
                        );

                    }
                    else{
                      return Center(child: CircularProgressIndicator(),);
                    }
                  }



              ))
        ),
      ),
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}
