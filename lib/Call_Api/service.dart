import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:onlinedkhovendor/models/dropdownModel.dart';

class ApiService {
  final String apiUrl;

  ApiService(this.apiUrl);

  Future<List<Service>> fetchServices() async {
    final response = await http.get(Uri.parse(apiUrl));

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body)['Result'];
      return data.map((json) => Service.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }
}
