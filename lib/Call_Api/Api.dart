import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlinedkhovendor/Call_Api/App_Constant.dart';

class CallApi {

  postData(data, finalurl) async {
    var fullurl = appConstant.BaseURL+ finalurl;
    final uri = Uri.parse(fullurl);
    return await http.post(uri, body: jsonEncode(data), headers: _setHeaders(),

    );
  }
  _setHeaders() =>
      {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Access-Control-Allow-Origin':'*',
        "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
        "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Access-Control-Allow-Origin": 'http://localhost:64290'

      };

  getData(data, finalurl) async {
    var fullurl = appConstant.BaseURL + finalurl+"/"+data;
    final uri = Uri.parse(fullurl);
    return await http.get(uri, headers: _setHeaders(),
    );
  }

  putData(data, finalurl) async {


    var fullurl = appConstant.BaseURL+ finalurl;
    final uri = Uri.parse(fullurl);
    return await http.put(uri, body: jsonEncode(data), headers: _setHeaders(),

    /*    var fullurl = appConstant.BaseURL + finalurl+"/"+data;
    final uri = Uri.parse(fullurl);
    return await http.get(uri, headers: _setHeaders(),
*/
    );
  }
}
