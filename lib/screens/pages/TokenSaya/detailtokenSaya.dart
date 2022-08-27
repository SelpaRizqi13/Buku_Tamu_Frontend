// ignore_for_file: file_names, unnecessary_const, duplicate_ignore

import 'package:flutter/material.dart';

import '../../../models/buku_tamu.dart';
import '../../../shared/shared.dart';

class DetailTokenSayaPage extends StatefulWidget {
  // const DetailTokenSayaPage({Key? key}) : super(key: key);

  DetailTokenSayaPage({
    required this.buku_tamu,
  });
  final BukuTamu buku_tamu;

  @override
  _DetailTokenSayaPageState createState() => _DetailTokenSayaPageState();
}

class _DetailTokenSayaPageState extends State<DetailTokenSayaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
        ),
        body: Stack(children: [
          Container(
            height: 300.0,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45.0),
                    bottomRight: Radius.circular(45.0))),
          ),
          ListView(
            physics: const ClampingScrollPhysics(),
            shrinkWrap: true,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      padding: EdgeInsets.all(26),
                      margin: EdgeInsets.fromLTRB(26, 26, 26, 12),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(20),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 2,
                            blurRadius: 4,
                          )
                        ],
                      ),
                      child: Column(children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image.asset('assets/images/images.png'),
                            ),
                            Divider(color: Colors.black, height: 4),
                            SizedBox(
                              height: 28,
                            ),
                            Text(
                              widget.buku_tamu.noToken,
                              style: TextStyle(fontSize: 32),
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Status',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text('Status Kunjungan'),
                                  ],
                                ),
                                Spacer(),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        color:
                                            Color.fromARGB(255, 85, 161, 125),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Text(
                                        widget.buku_tamu.status,
                                        style: TextStyle(color: whiteColor),
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Divider(),
                        SizedBox(height: 15),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Kunjungan Kepada',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.buku_tamu.tujuanPegawai,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tanggal Kunjungan',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.buku_tamu.tanggalKunjungan,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Jam Kunjungan',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.buku_tamu.sunrise,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Tujuan Kunjungan',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.buku_tamu.tujuanKunjungan,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Divider(),
                        SizedBox(height: 15),
                        Column(
                          children: [
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Nama Tamu',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.buku_tamu.namaTamu,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Asal Instansi',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.buku_tamu.namaInstansi,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                            SizedBox(
                              height: 15,
                            ),
                            Row(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Alamat',
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      widget.buku_tamu.alamat,
                                      style: TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Spacer(),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    )
                  ],
                ),
              ),
            ],
          ),
        ]));
  }
}
