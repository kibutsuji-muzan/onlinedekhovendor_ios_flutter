import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/Widgets/TextFieldRoundedCorner.dart';
import 'package:onlinedkhovendor/Widgets/dropdown_textfield.dart';
class shopdetails extends StatefulWidget {

  @override
  State<shopdetails> createState() => _shopdetailsState();
}

class _shopdetailsState extends State<shopdetails> {
  String selectedValue = "-1";
  TextEditingController shopname=TextEditingController();
  TextEditingController Latitude=TextEditingController();
  TextEditingController Longitude=TextEditingController();
  TextEditingController Commission=TextEditingController();
  TextEditingController Ranking=TextEditingController();

   @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child  :Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                   children: [
                    Column(
                      children: [
                        Center(child: Text("AD Burgur",style: TextStyle(fontSize: 20,color: Color(0xFF03a9f4,),fontWeight: FontWeight.bold),)),
                        Center(child: Text("Vendorid:16020",style: TextStyle(fontSize:15,color:Colors.grey),)),

                      ],
                    ),
                    Container(
                      height: 70,
                      width: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey
                      ),
                      child: Image.asset(AssetsImage.instance.foodd,width: 30, ),
                    ),


                  ],
                ),
                TexttField(title: 'Shop Name:',icon:Icons.perm_identity,controller:shopname,onPressed: (){},),
                TexttField(title: 'Latitude: ',icon:Icons.location_on,controller:Latitude,onPressed: (){},),
                TexttField(title: 'Longitude:',icon:Icons.location_on,controller:Longitude,onPressed: (){},),
                TexttField(title: 'Commission: ',icon:Icons.money,controller:Commission,onPressed: (){},),
                TexttField(title: 'Ranking: ',icon:Icons.leaderboard_rounded,controller:Ranking,onPressed: (){},),

               ],
            ),
          ),
        ),
      ),
    );
  }
}




