import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../models/buku_tamu.dart';

import '../../../services/apiBukuTamu.dart';
import '../../../services/user_service.dart';
import '../../../shared/shared.dart';
import '../../../shared/style_shared.dart';
import '../../home.dart';
import '../BukuTamu/editBukuTamu.dart';
import 'detailtokenSaya.dart';

class PercobaanPage extends StatefulWidget {
  const PercobaanPage({Key? key}) : super(key: key);

  @override
  _PercobaanPageState createState() => _PercobaanPageState();
}

class _PercobaanPageState extends State<PercobaanPage> {
  final String url = 'https://web.bukutamu.tif18.xyz/api/getBukuTamu';

  Future<List<BukuTamu>> getData() async {
    String token = await getToken();
    int user = await getUserId();
    var response = await http.get(
        Uri.parse(
            'https://web.bukutamu.tif18.xyz/api/getBukuTamuUserById/$user'),
        headers: {
          'Accept': 'application/json',
          'Authorization': 'Bearer $token'
        });
    var json = jsonDecode(response.body);
    final parsed = json['data'].cast<Map<String, dynamic>>();
    print(response.body);
    return parsed.map<BukuTamu>((json) => BukuTamu.fromJson(json)).toList();
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          elevation: 0,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Home()));
            },
          ),
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
          Container(
              child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text('Token Saya', style: ThemeStyles.arrivalTextStyle),
                      Image.asset(
                        'assets/images/images.png',
                        width: 150,
                        height: 100,
                      )
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            FutureBuilder<List<BukuTamu>>(
                future: getData(),
                builder: (context, AsyncSnapshot snapshot) {
                  if (snapshot.hasData) {
                    // return Text('data OKE');
                    List<BukuTamu> listBukuTamu = snapshot.data!;
                    return Expanded(
                        child: ListView.builder(
                            physics: const ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: listBukuTamu.length,
                            itemBuilder: (context, index) {
                              return
                                  // Text(snapshot.data['data'][index]['nama_tamu']);
                                  SizedBox(
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Stack(
                                      children: <Widget>[
                                        Padding(
                                          padding: const EdgeInsets.only(
                                              left: 20.0,
                                              right: 20.0,
                                              bottom: 20.0),
                                          child: Stack(
                                            children: <Widget>[
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50.0),
                                                    color: Colors.white,
                                                    boxShadow: [
                                                      BoxShadow(
                                                        color: Colors.grey
                                                            .withOpacity(0.4),
                                                        spreadRadius: 1,
                                                        blurRadius: 10,
                                                        offset: Offset(0, 1),
                                                      ),
                                                    ]),
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          top: 30.0,
                                                          bottom: 30.0,
                                                          left: 35.0,
                                                          right: 35.0),
                                                  child: Column(
                                                    children: <Widget>[
                                                      Row(
                                                        children: <Widget>[
                                                          Text(
                                                              '${listBukuTamu[index].noToken}',
                                                              style: ThemeStyles
                                                                  .ticketPrice)
                                                        ],
                                                      ),
                                                      SizedBox(height: 15.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                              'Kunjungan Kepada',
                                                              style: ThemeStyles
                                                                  .greyStyle),
                                                          Text(
                                                              'Status Kunjungan',
                                                              style: ThemeStyles
                                                                  .greyStyle),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                              '${listBukuTamu[index].tujuanPegawai}',
                                                              // snapshot.data[
                                                              //             'data']
                                                              //         [index][
                                                              //     'tujuan_pegawai'],
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                              )),
                                                          Container(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    8),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Color
                                                                  .fromARGB(
                                                                      255,
                                                                      85,
                                                                      161,
                                                                      125),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Text(
                                                              '${listBukuTamu[index].status}',
                                                              // snapshot.data[
                                                              //             'data']
                                                              //         [index]
                                                              //     ['status'],
                                                              style: TextStyle(
                                                                  fontSize: 18,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 8.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                              'Tanggal Kunjungan',
                                                              style: ThemeStyles
                                                                  .greyStyle),
                                                          Text('Jam Kunjungan',
                                                              style: ThemeStyles
                                                                  .greyStyle),
                                                        ],
                                                      ),
                                                      SizedBox(height: 10.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          Text(
                                                              '${listBukuTamu[index].tanggalKunjungan}',
                                                              // snapshot.data[
                                                              //             'data']
                                                              //         [index][
                                                              //     'tanggal_kunjungan'],
                                                              style: TextStyle(
                                                                fontSize: 18,
                                                              )),
                                                          Text(
                                                            '${listBukuTamu[index].sunrise}',
                                                            // snapshot.data[
                                                            //             'data']
                                                            //         [index]
                                                            //     ['sunrise'],
                                                            style: TextStyle(
                                                              fontSize: 18,
                                                            ),
                                                          )
                                                        ],
                                                      ),
                                                      SizedBox(height: 30.0),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .spaceBetween,
                                                        children: <Widget>[
                                                          GestureDetector(
                                                            child: Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .grey,
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              30),
                                                                ),
                                                                height: 50.0,
                                                                width: 150.0,
                                                                child: Center(
                                                                  child: Text(
                                                                    'Details Token',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          20.0,
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                  ),
                                                                )),
                                                            onTap: () {
                                                              Navigator.push(
                                                                  context,
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          DetailTokenSayaPage(
                                                                            buku_tamu:
                                                                                listBukuTamu[index],
                                                                          )));
                                                            },
                                                          ),
                                                          // SizedBox(
                                                          //   width: 20,
                                                          // ),
                                                          GestureDetector(
                                                              child: Container(
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .grey,
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            30),
                                                                  ),
                                                                  height: 50.0,
                                                                  width: 150.0,
                                                                  child: Center(
                                                                    child: Text(
                                                                      'Reschedule',
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            20.0,
                                                                        color: Colors
                                                                            .white,
                                                                      ),
                                                                    ),
                                                                  )),
                                                              onTap: () {
                                                                Navigator.push(
                                                                    context,
                                                                    MaterialPageRoute(
                                                                        builder:
                                                                            (context) =>
                                                                                EditBukuTamu(bukutamu: listBukuTamu[index])));
                                                              })
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              Align(
                                                alignment: Alignment.topRight,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: secondaryColor,
                                                    borderRadius: BorderRadius
                                                        .only(
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    50.0),
                                                            topRight:
                                                                Radius.circular(
                                                                    50.0)),
                                                  ),
                                                  height: 70.0,
                                                  width: 100.0,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              );
                            }));
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          ]))
        ]));
  }
}
