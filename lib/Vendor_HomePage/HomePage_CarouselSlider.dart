
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';


class sliderHome extends StatelessWidget{
  final List<String> imageList = [
    'assets/images/sliderimg1.png',
    'assets/images/sliderimg2.png',
    'assets/images/sliderimg3.png'
  ];
  @override
  Widget build(BuildContext context){
    return CarouselSlider(
      options: CarouselOptions(
        height: 130,  // Adjust the height as needed
        autoPlay: true,
        enlargeCenterPage: true,
      ),
      items: imageList.map((imageUrl) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric( vertical: 17.0),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20)
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.asset(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),



            );
          },
        );
      }).toList(),
    );
  }}








