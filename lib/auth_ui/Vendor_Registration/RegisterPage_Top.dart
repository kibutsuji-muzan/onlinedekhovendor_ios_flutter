import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
 import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/Widgets/Progress_Bar/Progress_bar.dart';
 import 'package:onlinedkhovendor/auth_ui/Vendor_Registration/VendorRegisterSecondPage.dart';

class Registertop extends StatefulWidget {
  const Registertop({super.key});

  @override
  State<Registertop> createState() => _RegistertopState();
}

class _RegistertopState extends State<Registertop> {
  TextEditingController name=TextEditingController();
  TextEditingController mobileno=TextEditingController();
  TextEditingController email=TextEditingController();
  TextEditingController alt_mob_no=TextEditingController();
  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body:SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child:
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Align(alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          radius: 40,
                          backgroundImage:AssetImage(AssetsImage.instance.vendorCircleImg),
                        ),
                      ),
                    ),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text("Vendor Partner",style: TextStyle(

                              fontSize: isMobile(context) ? 28 : 34,
                              fontWeight: FontWeight.bold),),
                        ),
                        Text("Partner",style: TextStyle(fontSize: 25,color: Colors.grey),),
                      ],
                    ),

                  ],
                ),
              ),
              progress(title: 'divideror',onPressed: (){},),

              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Container(
                  height: 410,width: 300,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    elevation: 5,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Text("Business/Shop Owner Details",style: TextStyle(fontSize: 20,color:  Color(0xFF03a9f4),fontWeight: FontWeight.w500),),
                        ),
                        SizedBox(height: 50,width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                               controller: name,
                              decoration: InputDecoration(
                                labelText: "Owner Name",
                                border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                    borderRadius: BorderRadius.circular(30),
                                ),
                            ),
                            ),
                          ),
                        ),
                        SizedBox(height: 15,),
                        SizedBox(height: 70,width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: mobileno,
                              decoration: InputDecoration(
                                labelText: "Mobile Number",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 70,width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              maxLength: 10,
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              controller: alt_mob_no,
                              decoration: InputDecoration(
                                labelText: "Alternative Business Number",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50,width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: email,
                              decoration: InputDecoration(
                                labelText: "Email",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                      //  TexttField(title: 'Owner Name',icon:Icons.person,controller:name,onPressed: (){},),
                       // TexttField(title: 'Mobile Number',icon:Icons.phone,controller:mobileno,onPressed: (){},),
                       // TexttField(title: 'Alternative Business Number',icon:Icons.phone_android,controller:alt_mob_no,onPressed: (){},),
                        //TexttField(title: 'Email',icon:Icons.email,controller:email,onPressed: (){},),
                        Align(alignment: Alignment.topRight,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20,right: 10),
                            child:
                            CircleAvatar(
                              backgroundColor: Color(0xFF03a9f4),
                              child: IconButton(
                                icon: Icon(Icons.arrow_forward,color: Colors.white,),
                                onPressed: () {
                                   ShopdetailSubmit();
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  Register2()
                                      ));
                                 // Register1_insert();
                                },
                              ),
                            ),
                          ),
                        ),
                      ],

                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  ShopdetailSubmit() async {
    var data={
      "Owner_name":name.text,
      "Mobile_Number":mobileno.text,
      "Alt_mob_no":alt_mob_no.text,
      "email":email.text,
    };
    var complete_url=appConstant.Register1_Insert;

    var response=await CallApi().postData(data,complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    if(json['response']==200){
      print(json);
      final results = json['message'] as String;
      print(results);
    }
  }
}
