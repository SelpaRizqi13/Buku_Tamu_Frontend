// ignore_for_file: unused_local_variable

import 'dart:convert';

import 'package:blogapp/models/buku_tamu.dart';

import 'package:blogapp/services/user_service.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ApiBukuTamu {
  //static final host='http://192.168.43.189/webtani/public';
  static final host = 'http://192.168.43.147:8000/api';

  Future<SharedPreferences> preferences = SharedPreferences.getInstance();
  static Future<void> getPref() async {
    Future<SharedPreferences> preferences = SharedPreferences.getInstance();
    final SharedPreferences prefs = await preferences;
  }

  static getHost() {
    return host;
  }

  static Future<List<BukuTamu>> getData() async {
    try {
      getPref();

      String token = await getToken();
      int user = await getUserId();
      final response = await http.get(
          Uri.parse('http://192.168.43.147:8000/api/getBukuTamuUserById/$user'),
          headers: {
            'Accept': 'application/json',
            'Authorization': 'Bearer $token'
          });
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        final parsed = json['data'].cast<Map<String, dynamic>>();
        return parsed.map<BukuTamu>((json) => BukuTamu.fromJson(json)).toList();
      } else {
        return [];
      }
    } catch (e) {
      return [];
    }
  }
}