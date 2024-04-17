import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:onlinedkhovendor/Call_Api/storepref.dart';
import 'package:onlinedkhovendor/auth_ui/Vendor_login/vendor_login.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Vendor_HomePage/HomePage_MainPage.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {

    super.initState();
    _splashLoad();
  }

  Future<void> _splashLoad() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var vendor_id = prefs.getString(storepref.vendor_id_key) ?? '';
    print(vendor_id);
     Timer(Duration(seconds: 4), () {
      if (vendor_id.isNotEmpty) {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => MainPage()));
      } else {
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => vendorLogin()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        // child: SvgPicture.asset(
        //   'assets/images/odvendoricon.jpg',
        // ),
        child: Image.asset('assets/images/od_splash.gif'),
      ),
    );
  }
}


