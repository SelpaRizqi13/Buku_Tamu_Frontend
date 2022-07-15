class Pegawai {
  Pegawai({
    required this.id,
    required this.namaPegawai,
    required this.jabatan,
    required this.instansi_id,
  });

  int id;
  String namaPegawai;
  String jabatan;
  int instansi_id;

  factory Pegawai.fromJson(Map<String, dynamic> json) => Pegawai(
        id: json["id_pegawai"] as int,
        namaPegawai: json["nama_pegawai"],
        jabatan: json["jabatan"],
        instansi_id: json["id_instansi"] as int,
      );

  @override
  String toString() => namaPegawai;
}
