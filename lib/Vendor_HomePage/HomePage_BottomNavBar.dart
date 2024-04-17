import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Constants/colors.dart';
import 'package:onlinedkhovendor/Vendor_HomePage/HomePage_MainPage.dart';
import 'package:onlinedkhovendor/story_editor/pages/home_page.dart' as story;
import 'package:onlinedkhovendor/Vendor_MorePage/Vendor_More_Tabs.dart';
import 'package:onlinedkhovendor/Vendor_PaymentPage/PayWalletConnectPage.dart';
import 'package:onlinedkhovendor/Vendor_ServicePage/VendorServiceMainPage.dart';
import 'package:onlinedkhovendor/story_editor/pages/home_page.dart';

Widget BootomNavHome(BuildContext context, Widget body) {
  return Scaffold(
    body: body,
    floatingActionButton: FloatingActionButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const story.HomePage()),
        );
      },
      child: Icon(Icons.video_call),
    ),
    floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    bottomNavigationBar: BottomAppBar(
      color: Color(0xFF03a9f4),
      shape: CircularNotchedRectangle(),
      notchMargin: 6,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 10, left: 5, right: 5),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.dashboard, color: AppColors.whiteColor),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => MainPage()));
                  },
                ),
                Text('Home', style: TextStyle(color: AppColors.whiteColor)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.home_repair_service,
                      color: AppColors.whiteColor),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => serviceMain()));
                  },
                ),
                Text('Our Products',
                    style: TextStyle(color: AppColors.whiteColor)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.payment, color: AppColors.whiteColor),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentWallet()));
                  },
                ),
                Text('Payment', style: TextStyle(color: AppColors.whiteColor)),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.more, color: AppColors.whiteColor),
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => venMore()));
                  },
                ),
                Text('More', style: TextStyle(color: AppColors.whiteColor)),
              ],
            ),
          ],
        ),
      ),
    ),
  );
}
