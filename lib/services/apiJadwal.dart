// ignore_for_file: file_names, prefer_const_declarations

import 'dart:convert';

import 'package:blogapp/services/user_service.dart';
import 'package:http/http.dart' as http;

import '../models/jadwal.dart';

class ApiService {
  static final host = 'http://192.168.43.147:8000/storage/';
  static getHost() {
    return host;
  }

  static Future<List<Jadwal>> getData() async {
    try {
      String token = await getToken();
      final response = await http
          .get(Uri.parse('http://192.168.43.147:8000/api/getJadwal'), headers: {
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<Jadwal>((json) => Jadwal.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}
