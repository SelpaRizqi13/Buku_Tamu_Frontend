import 'dart:convert';

import 'package:blogapp/models/buku_tamu.dart';
import 'package:blogapp/screens/pages/BukuTamu/tokenSayaPage.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import '../../../models/instansi.dart';
import '../../../models/pegawai.dart';
import '../../../services/user_service.dart';
import '../../../shared/shared.dart';

class EditBukuTamu extends StatefulWidget {
  // const EditBukuTamu({Key? key}) : super(key: key);

  EditBukuTamu({required this.bukutamu});

  final BukuTamu bukutamu;

  @override
  _EditBukuTamuState createState() => _EditBukuTamuState();
}

class _EditBukuTamuState extends State<EditBukuTamu> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController _date = TextEditingController();
  TextEditingController _time = TextEditingController();
  TextEditingController _jumlahTamu = TextEditingController();
  TextEditingController _namaTamu = TextEditingController();
  TextEditingController _alamat = TextEditingController();
  TextEditingController _namaInstansi = TextEditingController();
  TextEditingController _status = TextEditingController();

  TextEditingController _tujuanKunjungan = TextEditingController();

  int? IdInstansi;
  String? IdPegawai;

  String status = "In progress";
  //Update Data

  Future updateData() async {
    String token = await getToken();
    final response = await http.patch(
      Uri.parse('https://web.bukutamu.tif18.xyz/api/getBukuTamu/' +
          widget.bukutamu.id.toString()),
      headers: {'Accept': 'application/json', 'Authorization': 'Bearer $token'},
      body: {
        // "no_token": widget.bukutamu.noToken.toString(),
        // "jumlah_tamu": _jumlahTamu.text.toString(),
        // "nama_tamu": _namaTamu.text.toString(),
        // "alamat": _alamat.text.toString(),
        // "nama_instansi": _namaInstansi.text.toString(),
        "tanggal_kunjungan": _date.text.toString(),
        "sunrise": _time.text.toString(),
        "status": "In progress",
        // "tujuan_pegawai": IdPegawai.toString(),
        // "tujuan_kunjungan": _tujuanKunjungan.text.toString(),
        // "instansi_id": IdInstansi.toString(),
      },
    );

    print(response.body);
    return json.decode(response.body);
  }

  @override
  void initState() {
    _date.text =
        widget.bukutamu.tanggalKunjungan; //set the initial value of text field
    _time.text = widget.bukutamu.sunrise;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text("Reschedule Pendaftaran Buku Tamu"),
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Center(
              child: Text(
                "Reschedule Pendaftaran Buku Tamu",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
              ),
            ),
            Padding(padding: EdgeInsets.only(top: 30)),
            // Container(
            //   child: Text("Jumlah Tamu Yang Akan Berkunjung"),
            // ),
            // TextFormField(
            //   controller: _jumlahTamu
            //     ..text = widget.bukutamu.jumlahTamu.toString(),
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return "Please enter Jumlah Tamu";
            //     }
            //     return null;
            //   },
            //   decoration: InputDecoration(
            //       prefixIcon: Align(
            //         widthFactor: 1.0,
            //         heightFactor: 1.0,
            //         child: Icon(
            //           Icons.groups,
            //         ),
            //       ),
            //       hintText: "Jumlah Tamu",
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(5))),
            // ),
            // Padding(padding: EdgeInsets.only(top: 20)),
            // Container(
            //   child: Text("Nama Tamu"),
            // ),
            // TextFormField(
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return "Please enter Nama Tamu";
            //     }
            //     return null;
            //   },
            //   controller: _namaTamu..text = widget.bukutamu.namaTamu,
            //   decoration: InputDecoration(
            //       prefixIcon: Align(
            //         widthFactor: 1.0,
            //         heightFactor: 1.0,
            //         child: Icon(
            //           Icons.person,
            //         ),
            //       ),
            //       hintText: "Nama Tamu",
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(5))),
            // ),
            // Padding(padding: EdgeInsets.only(top: 20)),
            // Container(
            //   child: Text("Asal Instansi"),
            // ),
            // TextFormField(
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return "Please enter Asal Instansi";
            //     }
            //     return null;
            //   },
            //   controller: _namaInstansi..text = widget.bukutamu.namaInstansi,
            //   decoration: InputDecoration(
            //       prefixIcon: Align(
            //         widthFactor: 1.0,
            //         heightFactor: 1.0,
            //         child: Icon(
            //           Icons.business,
            //         ),
            //       ),
            //       hintText: "Asal Instansi",
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(5))),
            // ),
            // Padding(padding: EdgeInsets.only(top: 20)),
            // Container(
            //   child: Text("Alamat"),
            // ),
            // TextFormField(
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return "Please enter Alamat";
            //     }
            //     return null;
            //   },
            //   controller: _alamat..text = widget.bukutamu.alamat,
            //   decoration: InputDecoration(
            //       prefixIcon: Align(
            //         widthFactor: 1.0,
            //         heightFactor: 1.0,
            //         child: Icon(
            //           Icons.home,
            //         ),
            //       ),
            //       hintText: "Alamat",
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(5))),
            // ),
            // Padding(padding: EdgeInsets.only(top: 20)),
            // Container(
            //   child: Text("Tujuan Instansi yang akan Dikunjungi"),
            // ),
            // DropdownSearch<Instansi>(
            //   validator: (value) {
            //     if (value == null) {
            //       return "Please enter Tujuan Instansi";
            //     }
            //     return null;
            //   },
            //   dropdownBuilder: (context, selectedItem) => Text(
            //       selectedItem?.namaInstansi ?? "---  Pilih Instansi  ---"),
            //   popupProps: PopupProps.menu(
            //     showSearchBox: true,
            //     itemBuilder: (context, item, isSelected) => ListTile(
            //       title: Text(item.namaInstansi),
            //     ),
            //   ),
            //   onChanged: (value) => IdInstansi = value?.id as int,
            //   asyncItems: ((text) async {
            //     String token = await getToken();
            //     var respon = await http.get(
            //         Uri.parse("https://web.bukutamu.tif18.xyz/api/getInstansi"),
            //         headers: {
            //           'Accept': 'application/json',
            //           'Authorization': 'Bearer $token'
            //         });

            //     var json = jsonDecode(respon.body);
            //     final parsed = json['data'].cast<Map<String, dynamic>>();
            //     return parsed
            //         .map<Instansi>((json) => Instansi.fromJson(json))
            //         .toList();
            //   }),
            // ),
            // Padding(padding: EdgeInsets.only(top: 20)),
            // Container(
            //   child: Text("Tujuan Pegawai yang akan Dikunjungi"),
            // ),
            // DropdownSearch<Pegawai>(
            //   validator: (value) {
            //     if (value == null) {
            //       return "Please enter Tujuan Pegawai";
            //     }
            //     return null;
            //   },
            //   dropdownBuilder: (context, selectedItem) =>
            //       Text(selectedItem?.namaPegawai ?? "---  Pilih Pegawai  ---"),
            //   popupProps: PopupProps.menu(
            //     showSearchBox: true,
            //     itemBuilder: (context, item, isSelected) => ListTile(
            //       title: Text(item.namaPegawai),
            //     ),
            //   ),
            //   onChanged: (value) => IdPegawai = '${value?.namaPegawai}',
            //   asyncItems: ((text) async {
            //     print("Check id Instansi");
            //     print(IdInstansi);
            //     print("Check id Pegawai");
            //     print(IdPegawai);
            //     String token = await getToken();
            //     var respon = await http.get(
            //         Uri.parse(
            //             "https://web.bukutamu.tif18.xyz/api/getPegawaiInstansiById/$IdInstansi"),
            //         headers: {
            //           'Accept': 'application/json',
            //           'Authorization': 'Bearer $token'
            //         });

            //     var json = jsonDecode(respon.body);
            //     final parsed = json['data'].cast<Map<String, dynamic>>();
            //     return parsed
            //         .map<Pegawai>((json) => Pegawai.fromJson(json))
            //         .toList();
            //   }),
            // ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: Text("Tanggal Berkunjung"),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter Tanggal Berkunjung";
                }
                return null;
              },
              keyboardType: TextInputType.none,
              controller: _date,
              decoration: InputDecoration(
                  prefixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.calendar_month,
                    ),
                  ),
                  hintText: "Tanggal Berkunjung",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2102));
                if (pickeddate != null) {
                  setState(() {
                    _date.text = DateFormat('yyyy-MM-dd').format(pickeddate);
                  });
                }
              },
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            Container(
              child: Text("Jam Berkunjung"),
            ),
            TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return "Please enter Jam Berkunjung";
                }
                return null;
              },
              keyboardType: TextInputType.none,
              controller: _time,
              decoration: InputDecoration(
                  prefixIcon: Align(
                    widthFactor: 1.0,
                    heightFactor: 1.0,
                    child: Icon(
                      Icons.alarm,
                    ),
                  ),
                  hintText: "Jam Berkunjung",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5))),
              onTap: () async {
                TimeOfDay? pickedtime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                    builder: (context, child) {
                      return MediaQuery(
                          data: MediaQuery.of(context)
                              .copyWith(alwaysUse24HourFormat: false),
                          child: child!);
                    });
                if (pickedtime != null) {
                  setState(() {
                    // _time.text = "${pickedtime.hour}:${pickedtime.minute}";
                    _time.text = pickedtime.format(context);
                  });
                }
              },
            ),
            Padding(padding: EdgeInsets.only(top: 20)),
            // Container(
            //   child: Text("Tujuan Berkunjung"),
            // ),
            // TextFormField(
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return "Please enter Tujuan berkunjung";
            //     }
            //     return null;
            //   },
            //   controller: _tujuanKunjungan
            //     ..text = widget.bukutamu.tujuanKunjungan,
            //   maxLines: 6,
            //   textAlign: TextAlign.justify,
            //   decoration: InputDecoration(
            //       hintText: "Tujuan Berkunjung",
            //       border: OutlineInputBorder(
            //           borderRadius: BorderRadius.circular(5))),
            // ),
            Row(mainAxisAlignment: MainAxisAlignment.end, children: [
              Padding(padding: EdgeInsets.only(top: 80)),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    updateData().then((value) => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TokenSayaPage())));
                    print("berhasil");
                  }
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(120, 40),
                    primary: secondaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                child: Text('Reschedule',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: whiteColor,
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(120, 40),
                    primary: whiteColor,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: secondaryColor, width: 2),
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                child: Text('Cancel',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: secondaryColor,
                    )),
              ),
            ])
          ],
        ),
      ),
    );
  }
}
