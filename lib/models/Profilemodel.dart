// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Result result;
  int response;

  Welcome({
    required this.result,
    required this.response,
  });

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    result: Result.fromJson(json["Result"]),
    response: json["res`ponse"],
  );

  Map<String, dynamic> toJson() => {
    "Result": result.toJson(),
    "response": response,
  };
}
class Result {
  String vendorid;
  String name;
  String mobno;
  String email;
  String shopaddress;
  String type;
  String accountno;
  String ifsCcode;
  Result({
     required this.vendorid,
    required this.name,
    required this.mobno,
    required this.email,
    required this.shopaddress,
    required this.type,
    required this.accountno,
    required this.ifsCcode,
   });
  factory Result.fromJson(Map<String, dynamic> json) => Result(
    vendorid: json["vendorid"],
    name: json["name"],
    mobno: json["mobno"],
    email: json["email"],
    shopaddress:json["shopaddress"],
    type: json["type"],
    accountno: json["accountno"],
    ifsCcode: json["IFSCcode"],
  );
  Map<String, dynamic> toJson() => {
     "vendorid": vendorid,
    "name": name,
    "mobno": mobno,
    "email": email,
    "shopaddress": shopaddress,
    "type": type,
    "accountno": accountno,
    "IFSCcode": ifsCcode,
   };
}
