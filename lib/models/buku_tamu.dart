class BukuTamu {
  BukuTamu({
    required this.id,
    required this.noToken,
    required this.jumlahTamu,
    required this.namaTamu,
    required this.alamat,
    required this.namaInstansi,
    required this.tanggalKunjungan,
    required this.sunrise,
    required this.tujuanPegawai,
    required this.tujuanKunjungan,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.instansi_id,
  });

  int id;
  String noToken;
  String jumlahTamu;
  String namaTamu;
  String alamat;
  String namaInstansi;
  String tanggalKunjungan;
  String sunrise;
  String tujuanPegawai;
  String tujuanKunjungan;
  String status;
  String createdAt;
  String updatedAt;
  int instansi_id;

  factory BukuTamu.fromJson(Map<String, dynamic> json) => BukuTamu(
        id: json["id"],
        noToken: json["no_token"].toString(),
        jumlahTamu: json["jumlah_tamu"].toString(),
        namaTamu: json["nama_tamu"].toString(),
        alamat: json["alamat"].toString(),
        namaInstansi: json["nama_instansi"].toString(),
        tanggalKunjungan: json["tanggal_kunjungan"].toString(),
        sunrise: json["sunrise"].toString(),
        tujuanPegawai: json["tujuan_pegawai"].toString(),
        tujuanKunjungan: json["tujuan_kunjungan"].toString(),
        status: json["status"].toString(),
        createdAt: json["created_at"].toString(),
        updatedAt: json["updated_at"].toString(),
        instansi_id: json["instansi_id"],
      );

  // Map<String, dynamic> toJson() => {
  //       "id": id,
  //       "no_token": noToken,
  //       "jumlah_tamu": jumlahTamu,
  //       "nama_tamu": namaTamu,
  //       "alamat": alamat,
  //       "nama_instansi": namaInstansi,
  //       "tanggal_kunjungan":
  //           "${tanggalKunjungan.year.toString().padLeft(4, '0')}-${tanggalKunjungan.month.toString().padLeft(2, '0')}-${tanggalKunjungan.day.toString().padLeft(2, '0')}",
  //       "sunrise": sunrise,
  //       "tujuan_pegawai": tujuanPegawai,
  //       "tujuan_kunjungan": tujuanKunjungan,
  //       "status": status,
  //       "created_at": createdAt.toIso8601String(),
  //       "updated_at": updatedAt.toIso8601String(),
  //       "id_instansi": id_instansi,
  //     };
  // @override
  // String toString() {
  //   return 'BukuTamu{id: $id, no_token: $noToken, jumlah_tamu: $jumlahTamu, nama_tamu: $namaTamu, alamat:$alamat, nama_instansi: $namaInstansi, tanggal_kunjungan:$tujuanKunjungan, sunrise:$sunrise, tujuan_pegawai:$tujuanPegawai, tujuan_kunjungan:$tujuanKunjungan, status:$status, id_instansi:$id_instansi}';
  // }
}

// List<BukuTamu> bukutamuFromJson(String jsonData) {
//   final data = json.decode(jsonData);
//   return List<BukuTamu>.from(data.map((item) => BukuTamu.fromJson(item)));
// }

// String bukutamuToJson(BukuTamu data) {
//   final jsonData = data.toJson();
//   return json.encode(jsonData);
// }
