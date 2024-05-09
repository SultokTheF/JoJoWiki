import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/stuff.dart';

class StuffController {
  Future<List<Stuff>> fetchStuffList() async {
    final response = await http.get(Uri.parse('http://localhost:8080/stuffs'));

    if (response.statusCode == 200) {
      List<dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse.map((json) => Stuff.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load stuff list');
    }
  }
}
