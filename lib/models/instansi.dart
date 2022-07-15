// To parse this JSON data, do
//
//     final instansi = instansiFromJson(jsonString);

import 'dart:convert';

Instansi instansiFromJson(String str) => Instansi.fromJson(json.decode(str));

String instansiToJson(Instansi data) => json.encode(data.toJson());

class Instansi {
  Instansi(
      {required this.id, required this.namaInstansi, required this.lantai});

  int id;
  String namaInstansi;
  String lantai;

  factory Instansi.fromJson(Map<String, dynamic> json) => Instansi(
        id: json["id"],
        namaInstansi: json["nama_instansi"],
        lantai: json["lantai"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_instansi": namaInstansi,
        "lantai": lantai,
      };
  @override
  String toString() => namaInstansi;
}
