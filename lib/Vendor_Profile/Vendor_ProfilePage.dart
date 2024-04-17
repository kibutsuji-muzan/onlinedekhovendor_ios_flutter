import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Widgets/TextFieldRoundedCorner.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController identity = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController work = TextEditingController();
  TextEditingController type = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController account = TextEditingController();
  TextEditingController ifsc = TextEditingController();
  TextEditingController id = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    GetProfileDetails();
  }

  GetProfileDetails() async {
    var complete_url = appConstant.ProfileDetails;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key)?? '';
     print(vendor_id);
     var response = await CallApi().getData(vendor_id, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    if (json['response'] == 200) {
      var profiledetail = json['Result'];
      identity.text = profiledetail['name'];
      phone.text = profiledetail['mobno'];
      email.text = profiledetail['email'];
      work.text = profiledetail['type'];
      type.text = profiledetail['amounttype'];
      address.text = profiledetail['shopaddress'];
      account.text = profiledetail['accountno'];
      id.text = profiledetail['vendorid'];
      ifsc.text = profiledetail['IFSCcode'];
    }
  }

  Widget build(BuildContext context) {
    Widget body = Scaffold(
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            HomePageTop(),

            Center(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 15,top: 15),
                child: Container(
                  width: 330,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(35)),
                    elevation: 20,
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: Stack(
                              children: [
                                 Padding(
                                   padding: const EdgeInsets.only(top: 30),
                                   child: Text("Vendor Profile Page",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w500),),
                                 ),

                              ]
                          ),

                        ),
                        SizedBox(height: 20,),

                        SizedBox(height: 50, width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: id,
                              decoration: InputDecoration(
                                labelText: "Vendor Id: ",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              readOnly: true,
                            ),
                          ),
                        ),
                        SizedBox(height: 50, width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: identity,
                              decoration: InputDecoration(
                                labelText: "Name:",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 50, width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: phone,
                              decoration: InputDecoration(
                                labelText: "Phone Number:",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              readOnly: true,

                            ),
                          ),
                        ),
                        SizedBox(height: 50, width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: email,
                              decoration: InputDecoration(
                                labelText: "Email:",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              readOnly: true,

                            ),
                          ),
                        ),
                        SizedBox(height: 50, width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: work,
                              decoration: InputDecoration(
                                labelText: "Working Type:",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              readOnly: true,

                            ),
                          ),
                        ),
                        SizedBox(height: 50, width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: type,
                              decoration: InputDecoration(
                                labelText: "Vendor Type:",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              readOnly: true,

                            ),
                          ),
                        ),
                        SizedBox(height: 50, width: 260,
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: address,
                              decoration: InputDecoration(
                                labelText: "Address:",
                                border: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFF03a9f4),),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                              readOnly: true,

                            ),
                          ),
                        ),



                        // TexttField(title: 'Vendor Id: ',icon:Icons.perm_identity,controller:id,onPressed: (){
                        //
                        // },),
                        // TexttField(title: 'Name:',icon:Icons.perm_identity,controller:identity,onPressed: (){},),
                        //  TexttField(title: 'Phone Number: ',icon:Icons.phone,controller:phone,onPressed: (){},),
                        //  TexttField(title: 'Email:',icon:Icons.email,controller:email,onPressed: (){},),
                        //  TexttField(title: 'Working Type: ',icon:Icons.work,controller:work,onPressed: (){},),
                        //  TexttField(title: 'Vendor Type: ',icon:Icons.type_specimen,controller:type,onPressed: (){},),
                        //  TexttField(title: 'Address: ',icon:Icons.home,controller:address,onPressed: (){},),
                        //  TexttField(title: 'Account Number: ',icon:Icons.account_balance_wallet,controller:account,onPressed: (){},),
                        //  Padding(padding: const EdgeInsets.only(bottom: 10),
                        //    child: TexttField(title: 'IFSC Code, ',icon:Icons.code,controller:ifsc,onPressed: (){},),
                        //  ),
                        SizedBox(height: 10,),
                        ElevatedButton(onPressed: () {
                          update_profile();
                        }, child: Text("Submit")),
                        SizedBox(height: 15,),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
    return BootomNavHome(context, body); // Pass the body widget
  }

  update_profile() async {
    var complete_url = appConstant.ProfileDetailsUpdate;
    var data = {
      "vendorid":id.text,
      "name": identity.text,
      "mobileno": phone.text,
      "email": email.text,
      "addressShop": address.text,
      "type": type.text
    };
    var response = await CallApi().postData(data, complete_url);
    final body = response.body;
    final json = jsonDecode(body);

    if(json['Result']=="success" && json['response']==200){
      Fluttertoast.showToast(
          msg: "Profile Details Updated Successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
    else{
      print("Failed to upload Profile Details");
    }

  }
}
