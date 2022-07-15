// ignore_for_file: unused_local_variable

import 'package:blogapp/services/user_service.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DropdownProvider extends ChangeNotifier {
  bool loading = true;
  List listInstansi = []; //tambahkan list dropdown
  List listPegawai = [];

  var itemInstansi;
  var itemPegawai;

  DropdownProvider(BuildContext context);

  Future<void> getInstansi(BuildContext context) async {
    loading = true;
    notifyListeners();
    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = await getToken();

    http.Response res = await http.get(
        Uri.parse(
            'http://192.168.43.147:8000/api/getInstansi'), //panggil dari dalam constant
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });

    print(res.body);
    loading = false;
    notifyListeners();

    if (res.statusCode == 200) {
      var dataRiwayat = jsonDecode(res.body);
      listInstansi = dataRiwayat['data'];
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error Get Data')));
    }
  }

  Future<void> getPegawai(BuildContext context) async {
    loading = true;
    notifyListeners();

    SharedPreferences pref = await SharedPreferences.getInstance();
    String token = await getToken();

    http.Response res = await http.get(
        Uri.parse(
            'http://192.168.43.147:8000/api/getPegawai'), //panggil dari dalam constant
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    print(res.body);
    loading = false;
    notifyListeners();

    if (res.statusCode == 200) {
      var dataQori = jsonDecode(res.body);
      listPegawai = dataQori['data'];
      notifyListeners();
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Error Get Data')));
    }
  }
}
