import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/Widgets/Buttons/Otp_Button.dart';
import 'package:onlinedkhovendor/Widgets/CameraImages/ImageBackandFrontside.dart';
import 'package:onlinedkhovendor/Widgets/Checkboxes/simple_checkbox.dart';
import 'package:onlinedkhovendor/Widgets/Progress_Bar/Progress_bar.dart';
import 'package:onlinedkhovendor/Widgets/TextFieldRoundedCorner.dart';
import 'package:onlinedkhovendor/auth_ui/Vendor_Registration/VendorRegisterSecondPage.dart';
 import 'package:roundcheckbox/roundcheckbox.dart';
class Register3 extends StatefulWidget {

  const Register3({super.key});

  @override

  State<Register3> createState() => _Register3State();
}

TextEditingController idproof=TextEditingController();
TextEditingController account=TextEditingController();
TextEditingController ifsc=TextEditingController();
TextEditingController refferal=TextEditingController();
class _Register3State extends State<Register3> {
  List<bool> checkboxValues = [false, false, false, false, false];

  bool isMobile(BuildContext context) {
    return MediaQuery.of(context).size.width < 600;
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: SingleChildScrollView(scrollDirection: Axis.vertical,
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
                Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 10),
                  child:  progress(title: 'progress',onPressed: (){},),
                ),

                Container(
                  height: 560,width: 340,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top:30),
                          child: Text("Id Proof/Account Details Details",style: TextStyle(fontSize: 20,color:Color(0xFF03a9f4),fontWeight: FontWeight.w500),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10,),
                          child: Container(
                            child: Column(
                              children: [TexttField(title: 'Id Proof Number',icon:Icons.numbers,controller:idproof,onPressed: (){},),
                                Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text("Addhar Card Picture",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                                ),
                                image(title: 'image',onPressed: (){},),
                              ],

                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Row(
                            children: [
                              Container(
                                height: 70,
                                width: 70,
                                child:  Column(
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                       },
                                      child:  Text('hell0')
                                    ),

                                  ],
                                )

                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 30),
                                child: Text("Check Picture",style: TextStyle(fontSize: 16,fontWeight: FontWeight.w500),),
                              ),
                            ],
                          ),
                        ),
                        image(title: 'image',onPressed: (){},),
/*                        TexttField(title: 'Account Number',icon:Icons.account_balance,controller:account,onPressed: (){},),
                        TexttField(title: 'IFSC Code',icon:Icons.code,controller:ifsc,onPressed: (){},),*/
                        TexttField(title: 'Referral Code(If Any)',icon:Icons.emergency_share_outlined,controller:refferal,onPressed: (){},),
                        Padding(
                          padding: const EdgeInsets.only(top:20,left:30,right: 30),
                          child: Row(
                            children: [
                              checkbox(title: 'checkbox',onPressed: (){},),
                              Text("I agree above details"),

                            ],
                          ),
                        ),

                        Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20,bottom:10,right: 10,top: 10),
                              child: Align(alignment: Alignment.topLeft,
                                child: CircleAvatar(
                                  backgroundColor: Color(0xFF03a9f4),
                                  child: IconButton(
                                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) =>  Register2()
                                          ));
                                    },
                                  ),

                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom:10,top: 10),
                              child: OtpButton(title: 'Submit',onPressed: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => const Register3()
                                    ));

                              }),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
