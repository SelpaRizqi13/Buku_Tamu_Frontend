// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors_in_immutables, file_names, use_key_in_widget_constructors, avoid_unnecessary_containers

import 'package:blogapp/services/apiJadwal.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';
import '../models/jadwal.dart';

class DetailJadwalPage extends StatefulWidget {
  DetailJadwalPage({
    required this.jadwal,
  });
  final Jadwal jadwal;

  @override
  _DetailJadwalPageState createState() => _DetailJadwalPageState();
}

class _DetailJadwalPageState extends State<DetailJadwalPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: SafeArea(
          minimum: EdgeInsets.symmetric(horizontal: 16),
          child: Padding(
              padding: EdgeInsets.only(top: 20),
              child: ListView(shrinkWrap: true, children: [
                Text(
                  widget.jadwal.namaKegiatan,
                  style: TextStyle(color: Colors.black, fontSize: 32),
                ),
                SizedBox(
                  height: 16,
                ),
                Wrap(
                  alignment: WrapAlignment.start,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  spacing: 16,
                  children: [
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      spacing: 4,
                      children: [
                        Icon(
                          Icons.calendar_month,
                          color: Colors.grey,
                          size: 18,
                        ),
                        Text(widget.jadwal.tanggalKegiatan.toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 15,
                              fontWeight: FontWeight.w100,
                            )),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Container(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.network(ApiService.host + widget.jadwal.image),
                    // child: Image(
                    //   image: AssetImage('assets/images/seminar.jpg'),
                    // ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Html(
                  data: widget.jadwal.deskripsi,
                )
              ]))),
    );
  }
}
