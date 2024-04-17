import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_countdown_timer/flutter_countdown_timer.dart';
import 'package:fluttertoast/fluttertoast.dart';
 import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
 import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_MainPage.dart';
import 'package:onlinedkhovendor/Vendor_PaymentPage/add_walletamount.dart';
import 'package:onlinedkhovendor/Widgets/Buttons/Otp_Button.dart';
import 'package:onlinedkhovendor/Widgets/Buttons/Signup_button.dart';
import 'package:onlinedkhovendor/Widgets/Buttons/primary_button.dart';
import 'package:onlinedkhovendor/Widgets/Checkboxes/simple_checkbox.dart';
import 'package:onlinedkhovendor/Widgets/Dividers/dividerbetweenOr.dart';
import 'package:onlinedkhovendor/Widgets/header_dropdown.dart';
import 'package:onlinedkhovendor/auth_ui/Vendor_Registration/RegisterPage_Top.dart';
import 'package:onlinedkhovendor/auth_ui/Vendor_login/ven_login_otp.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:url_launcher/url_launcher.dart';



class vendorLogin extends StatefulWidget {
  const vendorLogin({super.key});

  @override
  State<vendorLogin> createState() => _vendorLoginState();
}

class _vendorLoginState extends State<vendorLogin> {
  List<dynamic> users=[];
  TextEditingController controller=TextEditingController();
  TextEditingController mobile_number=TextEditingController();
  bool isVisible = true;
  int _otpCountdown = 60;
  bool _isOtpSent = false;
  Timer? _countdownTimer;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Column(
              children: [
                SizedBox(height: 25,),
                CircleAvatar(
                  backgroundImage: AssetImage(AssetsImage.instance.vendorCircleImg),
                  radius: 50,
                ),
                SizedBox(height: 20,),
                Text("Online Dekho",style: TextStyle(fontSize: 27,fontWeight: FontWeight.bold),),
                SizedBox(height: 5,),
                Text("Vendor Partner",style: TextStyle(fontSize: 17,color: Colors.grey),),
                SizedBox(height: 35,),
                Center(child: Text("Enter your registered phone number \nand we will send an OTP to continue",style: TextStyle(fontSize: 15,color: Colors.grey),)),
                SizedBox(height: 20,),
                SizedBox(
                  width: 300,
                  height: 70,
                  child: TextField(
                    maxLength: 10,

                    enabled: isVisible, // Disables the TextField when isVisible is true
                    textAlign: TextAlign.center,
                    controller: mobile_number,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Color(0xFF03a9f4)),
                          borderRadius: BorderRadius.circular(30)
                      ),
                      labelText: ' Enter Mobile Number',
                      prefixIcon: Icon(Icons.phone,color: Color(0xFF03a9f4),),

                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Visibility(
                  visible:isVisible,
                  child: OtpButton(title: 'Send OTP',onPressed: (){
                    login_Vendor();
                   // print("hello world11");
                    setState(() {
                      isVisible=!isVisible;
                      _isOtpSent = true;
                    });
                  },),
                ),
                SizedBox(height: 20,),
                Visibility(

                  visible:!isVisible,
                  child: Column(
                    children: [
                      otpfield(title: 'Send OTP',onSubmitCallback: (verificationCode) async{
                        print(verificationCode);
                        submit_api_login(verificationCode);



                      },),
                      SizedBox(height: 10,),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 30),
                            child: Align(
                              alignment: Alignment.topRight,
                              child: _isOtpSent
                                  ? CountdownTimer(
                                endTime: DateTime.now().millisecondsSinceEpoch + _otpCountdown * 1000,
                                onEnd: _onCountdownEnd,
                                textStyle: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: Colors.blueGrey),
                              )
                                  : CupertinoButton(
                                child: Text("RESEND OTP", style: TextStyle(fontSize: 13)), onPressed: () {
                                resend_otp();
                                //  submit_api_login();
                                },
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(height: 15,),

                      Row(
                        children: [
                          checkbox(title: 'checkbox',onPressed: (){},),
                          SizedBox(height: 17,),
                          Row(
                            children: [
                              Image.asset( AssetsImage.instance.whatsappIcon,width: 30,),
                              Padding(
                                padding: const EdgeInsets.only(left:3),
                                child: Text('Get updates on Whatsapp'),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SizedBox(height: 30,),
                      Align(alignment:Alignment.topLeft,
                          child:
                          CupertinoButton(child:Text("Change Number?",style: TextStyle(fontSize: 12),), onPressed: (){
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(builder: (context) =>vendorLogin ()
                            ));
                      })),
                    ],
                  ),
                ),
                Visibility(
                  visible:isVisible,
                  child: Column(
                    children: [
                      divider(title: 'divideror',onPressed: (){},),

                       signButton(title: 'SignUp/Registration',onPressed: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Registertop()
                            ));
                      },),
                       CupertinoButton(child:Text("Don't Have an Account?",style: TextStyle(fontSize: 12),), onPressed: (){
                      //  callProfileApi();
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) =>  Registertop()
                            ));

                      }),
                    ],
                  ),
                ),
                SizedBox(height: 100,),

                Center(child: Text("By continuing, you agree to our",style: TextStyle( fontSize: 13),)),
                InkWell(
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Text(
                      "Terms of Service | Privacy Policy | Code of Conduct",
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                  onTap: () async {
                    var _url = ''; // Fixed the variable name and added https://
                    await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url'; // Fixed function names and spacing
                  },
                ),


              ]
          ),
        ),
      ),
    );

  }

  login_Vendor() async {
    var complete_url=appConstant.LoginVendoViaMobno;
    var data={
      "mobile_number":mobile_number.text,
    };
    print(mobile_number.text);
    var response=await CallApi().postData(data, complete_url);
    final body = response.body;
    print(body);
    final json = jsonDecode(body);

    print(json['random_number']);

    Fluttertoast.showToast(
        msg: json['random_number'].toString(),
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 5,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0);

    print(json['random_number']);//toast mein dikhana hai
    if(json[response]==200){
    }
    else{
    }
  }
  submit_api_login(String verificationCode) async {
    var complete_url=appConstant.SubmitOtp;
    var data={
      "mobile_number":mobile_number.text,
      "random_number":verificationCode,

    };
    var response=await CallApi().postData(data, complete_url);
    final body = response.body;
    final json = jsonDecode(body);

     if(json['response']==200 && json['Result']=="success"){

       SharedPreferences prefs = await SharedPreferences.getInstance();
       var vendor_info = json['vendor_info'];
       var vendor_id = vendor_info['vendorid'];
       var email = vendor_info['email'];
       var type = vendor_info['type'];
       var name = vendor_info['name'];

       prefs.setString(storepref.vendor_id_key, vendor_id);
       prefs.setString(storepref.vendor_email_key, email);
       prefs.setString(storepref.vendor_type_key, type);
       prefs.setString(storepref.vendor_name_key, name);

      Navigator.push(
            context,
            MaterialPageRoute(builder: (context) =>MainPage()
            ));
     }
    else{

       Fluttertoast.showToast(
           msg: "Invalid Otp ! Enter Correct OTP",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.BOTTOM,
           timeInSecForIosWeb: 1,
           backgroundColor: Colors.red,
           textColor: Colors.white,
           fontSize: 16.0);

     }


  }
  resend_otp() async {
    var complete_url=appConstant.ResendOtp;
    var response = await CallApi().getData(mobile_number.text, complete_url);
    final body = response.body;
    final json = jsonDecode(body);
    if(json['response']==200){
      Fluttertoast.showToast(
          msg:json['Result'],//msg value
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);

    }
  }

  void _startCountdown() {
    const oneSec = const Duration(seconds: 1);
    _countdownTimer = new Timer.periodic(
      oneSec,
          (Timer timer) {
        if (_otpCountdown == 0) {
          _onCountdownEnd();
        } else {
          setState(() {
            _otpCountdown--;
          });
        }
      },
    );
  }
  void _onCountdownEnd() {
    _countdownTimer?.cancel();
    setState(() {
      _isOtpSent = false;
      _otpCountdown = 60;
    });
  }

}


