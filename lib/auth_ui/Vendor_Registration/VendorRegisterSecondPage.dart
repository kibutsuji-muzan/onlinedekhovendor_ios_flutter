 import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/Widgets/Progress_Bar/Progress_bar.dart';
import 'package:onlinedkhovendor/Widgets/TextFieldRoundedCorner.dart';
import 'package:onlinedkhovendor/auth_ui/Vendor_Registration/RegisterPage_Top.dart';
import 'package:onlinedkhovendor/auth_ui/Vendor_Registration/VendorRegisterThirdPage.dart';
 import 'package:roundcheckbox/roundcheckbox.dart';
class Register2 extends StatefulWidget {

  const Register2({super.key});

  @override
  State<Register2> createState() => _Register2State();
}

class _Register2State extends State<Register2> {
  List<File?> _selectedImages = [null,null,null,null,null,null];
  List<String> options = ['Select Mode Of Payment','Account Number', 'UPI'];// Initialize with null values or adjust the size as needed
  String selectedOption = 'Select Mode Of Payment';
  bool isAccountNumberSelected = false;
  bool isUpiSelected=false;

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  void onDropdownChanged(String? newValue) {
    setState(() {
      selectedOption = newValue ?? ''; // Provide a default value if newValue is null
      isAccountNumberSelected = selectedOption == 'Account Number';
    });
  }

  Future<void> _showImagePickerDialog(BuildContext context, int index) async {
    final picker = ImagePicker();
    final pickedImage = await showDialog<ImageSource>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Select Image Source"),
          actions: <Widget>[
            TextButton(
              child: Text("Camera"),
              onPressed: () {
                Navigator.of(context).pop(ImageSource.camera);
              },
            ),
            TextButton(
              child: Text("Gallery"),
              onPressed: () {
                Navigator.of(context).pop(ImageSource.gallery);
              },
            ),
          ],
        );
      },
    );

    if (pickedImage != null) {
      final pickedFile = await picker.pickImage(
        source: (pickedImage == ImageSource.camera)
            ? ImageSource.camera
            : ImageSource.gallery,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImages[index] = File(pickedFile.path);
        });
       }
    }
  }

  TextEditingController shopname=TextEditingController();
  TextEditingController address=TextEditingController();
  TextEditingController fassi=TextEditingController();
  TextEditingController gst=TextEditingController();
  TextEditingController category=TextEditingController();
  TextEditingController partner=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold( 
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
            children: [
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
                        child: Text("Vendor Partner",

                          style: TextStyle(
                              fontSize: isMobile(context) ? 28 : 34,
                              fontWeight: FontWeight.bold),),
                      ),
                      Text("Partner",style: TextStyle(fontSize: 25,color: Colors.grey),),
                    ],
                  ),
                ],
              ),
              progress(title: 'divideror',onPressed: (){},),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Container(
                  height: 680,width: 320,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    elevation: 5,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top:30),
                            child: Text("Shop/Business Details",style: TextStyle(fontSize: 20,color: Color(0xFF03a9f4),fontWeight: FontWeight.w500),),
                          ),
                          SizedBox(height: 50,width: 260,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: shopname,
                                decoration: InputDecoration(
                                  labelText: "Shop Name",
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
                                controller: address,
                                decoration: InputDecoration(
                                  labelText: "Shop Address",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          Column(
                            children: [
                              Container(
                                width: 260,
                                height: 40,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Color(0xFF03a9f4)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 16),
                                  child: DropdownButton<String>(
                                    value: selectedOption,
                                    icon: Icon(Icons.arrow_drop_down, color: Color(0xFF03a9f4)),
                                    underline: SizedBox(), // Remove the default underline
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        selectedOption = newValue ?? '';
                                        isAccountNumberSelected = newValue == 'Account Number';
                                        isUpiSelected = newValue == 'UPI';
                                      });
                                    },

                                    items: options.map((String option) {
                                      return DropdownMenuItem<String>(
                                        value: option,
                                        child: Text(
                                          option,
                                          style: TextStyle(color: Color(0xFF03a9f4)),
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              if (isUpiSelected)
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Container(
                                        height: 40,
                                        width: 260,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'UPI Id',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF03a9f4)),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Verify Upi Id'),
                                          IconButton(
                                            icon: Icon(Icons.edit, color: Color(0xFF03a9f4)),
                                            onPressed: () {
                                              // Add verification logic here
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              if (isAccountNumberSelected)
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(25),
                                  ),
                                  elevation: 10,
                                  child: Column(
                                    children: [
                                      SizedBox(height: 20),
                                      Container(
                                        height: 40,
                                        width: 260,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'Account Number',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF03a9f4)),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10,),
                                      Container(
                                        height: 40,
                                        width: 260,
                                        child: TextField(
                                          decoration: InputDecoration(
                                            labelText: 'IFSC Code',
                                            border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF03a9f4)),
                                              borderRadius: BorderRadius.circular(30),
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(height: 10),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text('Verify Account'),
                                          IconButton(
                                            icon: Icon(Icons.edit, color: Color(0xFF03a9f4)),
                                            onPressed: () {
                                              // Add verification logic here
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),


                            ],
                          ),
                          SizedBox(height: 50,width: 260,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: category,
                                decoration: InputDecoration(
                                  labelText: "Category",
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
                                controller: fassi,
                                decoration: InputDecoration(
                                  labelText: "FASSI/Any Other",
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
                                controller: gst,
                                decoration: InputDecoration(
                                  labelText: "GST Number",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 50,width: 260,
                            child:
                            Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: TextField(
                                textAlign: TextAlign.center,
                                controller: partner,
                                decoration: InputDecoration(
                                  labelText: "Type Of Patner",
                                  border: OutlineInputBorder(
                                    borderSide: BorderSide(color: Color(0xFF03a9f4),),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // TexttField(title: 'Shop Name',icon:Icons.shop,controller:shopname,onPressed: (){},),
                          // TexttField(title: 'Shop Address',icon:Icons.home,controller:address,onPressed: (){},),
                          // TexttField(title: 'FASSI/Any Other',icon:Icons.shop_two,controller:fassi,onPressed: (){},),
                          // TexttField(title: 'GST Number',icon:Icons.confirmation_number,controller:gst,onPressed: (){},),
                          // TexttField(title: 'Type Of Patner',icon:Icons.home,controller:partner,onPressed: (){},),
                          Padding(
                            padding: const EdgeInsets.only(top:10),
                            child: Text("Shop Image",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child:
                            Row(
                              children: List.generate(3, (index) {
                                 return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child:
                                  DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: Colors.grey,
                                    radius: Radius.circular(10),
                                    padding: EdgeInsets.all(6),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      child:
                                      Container(
                                        height: 70,
                                        width: 70,
                                        child: _selectedImages[index] != null
                                            ? Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _showImagePickerDialog(context, index);
                                              },
                                              child: Image.file(_selectedImages[index]!, fit: BoxFit.cover),
                                            ),

                                          ],
                                        )
                                            : IconButton(
                                          icon: Icon(Icons.camera_alt_outlined, color: Colors.black),
                                          onPressed: () {
                                            _showImagePickerDialog(context, index);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )

                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child:

                            Row(
                              children: List.generate(3, (index) {
                                int rowIndex = index + 3;
                                return Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: DottedBorder(
                                    borderType: BorderType.RRect,
                                    color: Colors.grey,
                                    radius: Radius.circular(10),
                                    padding: EdgeInsets.all(6),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.all(Radius.circular(12)),
                                      child: Container(
                                        height: 70,
                                        width: 70,
                                        child:
                                        _selectedImages[rowIndex] != null
                                            ? Column(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                _showImagePickerDialog(context, rowIndex);
                                              },
                                              child: Image.file(_selectedImages[rowIndex]!, fit: BoxFit.cover),
                                            ),

                                          ],
                                        )
                                            : IconButton(
                                          icon: Icon(Icons.camera_alt_outlined, color: Colors.black),
                                          onPressed: () {
                                            _showImagePickerDialog(context, rowIndex);
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                            )

                          ),



                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Container(height: 80,width: 140,
                              child: Card(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20),
                                  //set border radius more than 50% of height and width to make circle
                                ),
                                child: Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 20),
                                      child: Text('License Image',style: TextStyle(fontSize: 14),),
                                    ),
                                    Icon(Icons. camera_alt_outlined),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 15,bottom: 15),
                                child: Align(alignment: Alignment.topLeft,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF03a9f4),
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_back,color: Colors.white,),
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) =>Registertop()
                                            ));
                                      },
                                    ),

                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.only(bottom:15,left: 200),
                                child: Align(alignment: Alignment.topRight,
                                  child: CircleAvatar(
                                    backgroundColor: Color(0xFF03a9f4),
                                    child: IconButton(
                                      icon: Icon(Icons.arrow_forward,color: Colors.white,),
                                      onPressed: () {
                                        BusinessdetailSubmit();
                                        Navigator.push(
                                             context,
                                            MaterialPageRoute(builder: (context) => Register3()
                                            ));
                                      },

                                    ),

                                  ),
                                ),
                              ),
                            ],
                          )
                        ],

                      ),
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
  Future<void> BusinessdetailSubmit() async {
    var data = {
      "shop_name": shopname.text,
      "shop_address": address.text,
      "gst_no": gst.text,
      "type_vendor": partner.text,
      "category": category.text,
      "fassi": fassi.text,
      "vendorid": fassi.text,
    };


    print(shopname.text +" "+address.text+" "+gst.text+" "+partner.text+" "+category.text+" "+fassi.text);
    var completeUrl = appConstant.RegisterBuisnessDetails;

    try {
      var response = await CallApi().postData(data, completeUrl);
      final body = response.body;
      final json = jsonDecode(body);
      print(json);
    /*  if (json['response'] == 200) {
        final results = json['message'] as String;
        print(results);
      } else {
        print('Error: ${json['message']}');
      }*/
    } catch (e) {
      print('Error submitting data: $e');
    }
  }


}
