
import 'dart:io';

import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:onlinedkhovendor/ShopDetails_stepwise/ShopDetails_Step3_MainPage.dart';
import 'package:onlinedkhovendor/Ven_Order_Details/order_details.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_BottomNavBar.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_Header.dart';
import 'package:onlinedkhovendor/Vendor_ServicePage/VendorServiceWidget.dart';
import 'package:onlinedkhovendor/Widgets/Search_Bar.dart';



class shop2MainPage extends StatefulWidget {
 final String shopids;
 shop2MainPage({required this.shopids});
  @override
  State<shop2MainPage> createState() => _shop2MainPageState();
}
class _shop2MainPageState extends State<shop2MainPage> {
  List<File?> _selectedImages = [null, null, null, null, null, null];
  Future<void> _showImagePickerDialog(BuildContext context, int index) async {
  //  var id=(widget.shopids);
  //  print(id);
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
          //_selectedImages[index] = File(pickedFile.path);
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    print('Shop ID: ${widget.shopids}');



    Widget body =  SingleChildScrollView(scrollDirection: Axis.vertical,
      child: SafeArea(
        child: Column(
          children: [
            HomePageTop(),
           Card(
             shape: RoundedRectangleBorder(
                 borderRadius: BorderRadius.circular(30)
             ),
             elevation: 8,
             child:Padding(
               padding: const EdgeInsets.all(16.0),
               child: Column(
                 children: [
                   Text("Upload Shop Picture",style: TextStyle(color: Colors.grey,fontSize: 20,fontWeight:FontWeight.w400),),
                   SizedBox(height: 10,),

                   Row(
                     children: List.generate(3, (index) {
                       return Padding(
                         padding: const EdgeInsets.only(left: 10),
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
                               child: _selectedImages[index] != null
                                   ? Column(
                                 children: [
                                   GestureDetector(
                                     onTap: () {
                                       _showImagePickerDialog(context, index);
                                     },
                                   //  child: Image.file(_selectedImages[index]!, fit: BoxFit.cover),
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
                   ),
                   SizedBox(height: 20,),
                   Row(
                     children: List.generate(3, (index) {
                       int rowIndex = index + 3;
                       return Padding(
                         padding: const EdgeInsets.only(left: 10),
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
                               child: _selectedImages[rowIndex] != null
                                   ? Column(
                                 children: [
                                   GestureDetector(
                                     onTap: () {
                                       _showImagePickerDialog(context, rowIndex);
                                     },
                                  //   child: Image.file(_selectedImages[rowIndex]!, fit: BoxFit.cover),
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
                   ),
                   Align(alignment: Alignment.topRight,
                     child: Padding(
                       padding: const EdgeInsets.only(top:5,right: 10,bottom: 5),
                       child: CircleAvatar(
                         backgroundColor: Color(0xFF03a9f4),
                         child: IconButton(
                           icon: Icon(Icons.arrow_forward,color: Colors.white,),
                           onPressed: () {
                             Navigator.push(
                                 context,
                                 MaterialPageRoute(builder: (context) =>  shop3MainPage(shopids: widget.shopids)
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
           )
          ],
        ),
      ),
    );
    return BootomNavHome(context,  body); // Pass the body widget
  }
}

