import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/VendorPromocode/Coupon_details_Main.dart';
import 'package:onlinedkhovendor/VendorPromocode/PromoVendorelevatedbutton.dart';


class PromoCode extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top:10,left: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("APPLY COUPON",style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:5,left: 15),
                child: Container(
                  alignment: Alignment.topLeft,
                  child: Text("Your Cart : Rs.290.0",style: TextStyle(fontSize: 12,color: Colors.grey),),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: "Apply Coupon",
                      suffixIcon: TextButton(onPressed: (){},child: Text("Apply",style: TextStyle(color:Color(0xFF03a9f4),fontWeight: FontWeight.w600
                      ),),),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(9)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:15),
                child: Container(
                    alignment: Alignment.topLeft,
                    child: Text("More Options",style: TextStyle(fontSize:15,fontWeight: FontWeight.bold),)
                ),
              ),
              Container(
                height: 170,
                width: 330,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  elevation: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:15,left: 5),
                        child:  ListTile(title:
                        Text("ONECARD100",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          trailing:IconButton(
                            icon: const Icon(Icons.delete,),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Coupon()
                                  ));

                            },
                          ),
                          leading: Image.asset('assets/images/coupon.png'),),
                      ),
                      Text("Save Rs.87 on this order using OneCard!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color(0xFF03a9f4)),),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text("Maximum discount upto Rs.100 on orders above Rs.250",style: TextStyle(color: Colors.blueGrey,fontSize: 11,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                width: 330,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  elevation: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:15,left: 5),
                        child:
                        ListTile(title:
                        Text("ONECARD100",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          trailing:Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.delete,),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  Coupon()
                                      ));

                                },
                              ),
                              IconButton(
                                icon: const Icon(Icons.delete,),
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  Coupon()
                                      ));

                                },
                              ),
                            ],
                          ),
                          leading: Image.asset('assets/images/coupon.png'),),
                      ),
                      Text("Save Rs.87 on this order using OneCard!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color(0xFF03a9f4)),),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text("Maximum discount upto Rs.100 on orders above Rs.250",style: TextStyle(color: Colors.blueGrey,fontSize: 11,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                height: 170,
                width: 330,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(13.0),
                  ),
                  elevation: 10,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top:15,left: 5),
                        child:  ListTile(title:
                        Text("ONECARD100",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                          trailing:IconButton(
                            icon: const Icon(Icons.delete,),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) =>  Coupon()
                                  ));

                            },
                          ),
                          leading: Image.asset('assets/images/coupon.png'),),
                      ),
                      Text("Save Rs.87 on this order using OneCard!",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 14,color: Color(0xFF03a9f4)),),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.only(top: 8),
                        child: Text("Maximum discount upto Rs.100 on orders above Rs.250",style: TextStyle(color: Colors.blueGrey,fontSize: 11,fontWeight: FontWeight.bold),),
                      ),
                    ],
                  ),
                ),
              ),

            ],
          ),
        ],
      );
  }
}




