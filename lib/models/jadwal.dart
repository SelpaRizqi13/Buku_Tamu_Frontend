import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  Welcome({
    required this.meta,
    required this.data,
  });

  Meta meta;
  List<Jadwal> data;

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        meta: Meta.fromJson(json["meta"]),
        data: List<Jadwal>.from(json["data"].map((x) => Jadwal.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "meta": meta.toJson(),
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
      };
}

class Jadwal {
  Jadwal({
    required this.id,
    required this.namaKegiatan,
    required this.tanggalKegiatan,
    required this.image,
    required this.deskripsi,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String namaKegiatan;
  DateTime tanggalKegiatan;
  dynamic image;
  String deskripsi;
  DateTime createdAt;
  DateTime updatedAt;

  factory Jadwal.fromJson(Map<String, dynamic> json) => Jadwal(
        id: json["id"],
        namaKegiatan: json["nama_kegiatan"],
        tanggalKegiatan: DateTime.parse(json["tanggal_kegiatan"]),
        image: json["image"],
        deskripsi: json["deskripsi"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nama_kegiatan": namaKegiatan,
        "tanggal_kegiatan":
            "${tanggalKegiatan.year.toString().padLeft(4, '0')}-${tanggalKegiatan.month.toString().padLeft(2, '0')}-${tanggalKegiatan.day.toString().padLeft(2, '0')}",
        "image": image,
        "deskripsi": deskripsi,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Meta {
  Meta({
    required this.code,
    required this.status,
    required this.message,
  });

  int code;
  String status;
  String message;

  factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        code: json["code"],
        status: json["status"],
        message: json["message"],
      );

  Map<String, dynamic> toJson() => {
        "code": code,
        "status": status,
        "message": message,
      };
}
