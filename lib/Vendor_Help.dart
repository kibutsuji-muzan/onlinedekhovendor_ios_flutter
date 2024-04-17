import 'dart:convert';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:onlinedkhovendor/Call_Api/Api.dart';
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';
import 'package:onlinedkhovendor/Constants/assets_images.dart';
import 'package:onlinedkhovendor/Widgets/Buttons/Help_Button.dart';
import 'package:onlinedkhovendor/Widgets/Buttons/Whatsapp_Button.dart';
import 'package:url_launcher/url_launcher.dart';

class venHelp extends StatefulWidget {
  const venHelp({super.key});

  @override
  State<venHelp> createState() => _venHelpState();
}
TextEditingController name=TextEditingController();
TextEditingController mobileno=TextEditingController();
TextEditingController email=TextEditingController();
TextEditingController problem=TextEditingController();
class _venHelpState extends State<venHelp> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

        ),
        body: SingleChildScrollView(scrollDirection: Axis.vertical,
          child: Stack(
            
            children: [
              Container(
                child: Image.asset( AssetsImage.instance.helpImage,),
              ),
              SingleChildScrollView(scrollDirection: Axis.vertical,
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top:120),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      width: 290,
                      height: 500,
                      child: Column(
                        children: [

                          Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: whatsappButton(
                              title: 'WHATSAPP US',
                              onPressed: () async {
                               },
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.only(left: 30),
                            child: Center(child: Text('Please Write to us for any queries',style: TextStyle(color: Color(0xFF03a9f4),fontSize: 20,fontWeight: FontWeight.bold),)),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SingleChildScrollView(scrollDirection: Axis.vertical,
                              child: Column(
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 19),
                                    child: SizedBox(height:40,width:250,
                                      child: TextField(
                                        controller: name,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF03a9f4)),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          labelText: 'Name',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SizedBox(height: 40,width: 250,
                                      child: TextField(
                                        controller: email,
                                        textAlign: TextAlign.center,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF03a9f4)),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          labelText: 'Email',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: SizedBox(height: 40,width: 250,
                                      child: TextField(
                                        controller: mobileno,
                                        textAlign: TextAlign.center,
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(color: Color(0xFF03a9f4)),
                                              borderRadius: BorderRadius.circular(30)
                                          ),
                                          labelText: 'Mobile Number',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 10),
                                    child: TextField(
                                      controller: problem,
                                      textAlign: TextAlign.center,
                                      maxLines: null,
                                      keyboardType: TextInputType.multiline,
                                      textInputAction: TextInputAction.newline,
                                      decoration: InputDecoration(
                                        border: OutlineInputBorder(
                                            borderSide: BorderSide(color: Color(0xFF03a9f4)),
                                            borderRadius: BorderRadius.circular(30)
                                        ),
                                        labelText: 'Query',
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 40,),
                          helpButton(title: 'GET HELP',onPressed: (

                              ){
                            Help_insert();
                            Fluttertoast.showToast(
                              msg: "We'll contact you very soon",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.BOTTOM,
                              backgroundColor: Colors.grey,
                              textColor: Colors.white,
                            );
                          },),
                        ],
                      ),

                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
}
///55 wala
//
Help_insert() async {
  var help= { "name": name.text,
    "mobileno": mobileno.text,
    "email": email.text,
    "problem": problem.text,
    "type":"vendor"};


  var complete_url=appConstant.Help_Insert;

  var response=await CallApi().postData(help,complete_url);
  final body = response.body;
  final json = jsonDecode(body);


  if(json['response']==200){
    print(json);
    final results = json['message'] as String;
    print(results);
  }

}

//
// // bachwala..........
// void vendor() async{
//   const url="http://127.0.0.1:8000/api/Helpcheck";
//   try {
//     final uri = Uri.parse(url);
//     final response = await http.post(uri, body: {
//       "name": name.text,
//       "mobileno": mobileno.text,
//       "email": email.text,
//       "problem": problem.text,
//       "type":"vendor"
//     }
//
//     );
//
//     final body = response.body;
//
//     final json = jsonDecode(body);
//     print(json);
//     final results = json['message'] as String;
//   //  print(results);
//   }
//   catch(e){
//     print(e);
//   }
// }

