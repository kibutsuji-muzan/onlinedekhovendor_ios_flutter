import 'dart:async';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';

import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_InitiatedPage/InititatePage_MainPage.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/bottomsheethome.dart';

class bottomsheet extends StatefulWidget {
  @override
  State<bottomsheet> createState() => _bottomsheetState();
}

class _bottomsheetState extends State<bottomsheet> {
  static String imagesPath = "assets/images";
  final String newOrder = "$imagesPath/neworder.png";

  bool isFinished = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  return SizedBox(
                    child: ElevatedButton(
                      child: bottomsheetallorder(),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white),
                    ),
                  );
                },
              );
            },
            child: CircleAvatar(
              backgroundColor: Colors
                  .blue, // Background color if the image doesn't cover the entire area
              child: ClipOval(
                child: Image.asset(
                  newOrder,
                  width: 160, // Adjust the width of the image
                  height: 160, // Image path
                  fit:
                      BoxFit.cover, // Adjust the fit to cover the entire circle
                ),
              ),
            ),
            style: ElevatedButton.styleFrom(
              shape: CircleBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
