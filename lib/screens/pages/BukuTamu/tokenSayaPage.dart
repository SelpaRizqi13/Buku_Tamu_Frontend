import 'package:blogapp/screens/home.dart';
import 'package:blogapp/screens/pages/BukuTamu/editBukuTamu.dart';
import 'package:blogapp/screens/pages/TokenSaya/detailtokenSaya.dart';
import 'package:blogapp/shared/shared.dart';
import 'package:flutter/material.dart';

import '../../../models/buku_tamu.dart';
import '../../../services/apiBukuTamu.dart';
import '../../../shared/style_shared.dart';

class TokenSayaPage extends StatefulWidget {
  const TokenSayaPage({Key? key}) : super(key: key);

  @override
  _TokenSayaPageState createState() => _TokenSayaPageState();
}

class _TokenSayaPageState extends State<TokenSayaPage> {
  @override
  Widget build(BuildContext context) {
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
      body: Stack(
        children: [
          Container(
            height: 300.0,
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(45.0),
                    bottomRight: Radius.circular(45.0))),
          ),
          Container(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text('Token Saya',
                              style: ThemeStyles.arrivalTextStyle),
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
                    future: ApiBukuTamu.getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<BukuTamu> listBukuTamu = snapshot.data!;
                        return Expanded(
                            child: ListView.builder(
                                physics: const ClampingScrollPhysics(),
                                shrinkWrap: true,
                                itemCount: listBukuTamu.length,
                                itemBuilder: (BuildContext context,
                                        int index) =>
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
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
                                                              BorderRadius
                                                                  .circular(
                                                                      50.0),
                                                          color: Colors.white,
                                                          boxShadow: [
                                                            BoxShadow(
                                                              color: Colors.grey
                                                                  .withOpacity(
                                                                      0.4),
                                                              spreadRadius: 1,
                                                              blurRadius: 10,
                                                              offset:
                                                                  Offset(0, 1),
                                                            ),
                                                          ]),
                                                      child: Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                    .only(
                                                                top: 30.0,
                                                                bottom: 30.0,
                                                                left: 35.0,
                                                                right: 35.0),
                                                        child: Column(
                                                          children: <Widget>[
                                                            Row(
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    '${listBukuTamu[index].noToken}',
                                                                    style: ThemeStyles
                                                                        .ticketPrice)
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 15.0),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
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
                                                            SizedBox(
                                                                height: 10.0),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    '${listBukuTamu[index].tujuanPegawai}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                    )),
                                                                Text(
                                                                  '${listBukuTamu[index].status}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 8.0),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    'Tanggal Kunjungan',
                                                                    style: ThemeStyles
                                                                        .greyStyle),
                                                                Text(
                                                                    'Jam Kunjungan',
                                                                    style: ThemeStyles
                                                                        .greyStyle),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 10.0),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                Text(
                                                                    '${listBukuTamu[index].tanggalKunjungan}',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          18,
                                                                    )),
                                                                Text(
                                                                  '${listBukuTamu[index].sunrise}',
                                                                  style:
                                                                      TextStyle(
                                                                    fontSize:
                                                                        18,
                                                                  ),
                                                                )
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 30.0),
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              children: <
                                                                  Widget>[
                                                                GestureDetector(
                                                                  child: Container(
                                                                      decoration: BoxDecoration(
                                                                        color: Colors
                                                                            .grey,
                                                                        borderRadius:
                                                                            BorderRadius.circular(30),
                                                                      ),
                                                                      height: 50.0,
                                                                      width: 150.0,
                                                                      child: Center(
                                                                        child:
                                                                            Text(
                                                                          'Details Token',
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                20.0,
                                                                            color:
                                                                                Colors.white,
                                                                          ),
                                                                        ),
                                                                      )),
                                                                  onTap: () {
                                                                    Navigator.push(
                                                                        context,
                                                                        MaterialPageRoute(
                                                                            builder: (context) => DetailTokenSayaPage(
                                                                                  buku_tamu: listBukuTamu[index],
                                                                                )));
                                                                  },
                                                                ),
                                                                // SizedBox(
                                                                //   width: 20,
                                                                // ),
                                                                GestureDetector(
                                                                    child: Container(
                                                                        decoration: BoxDecoration(
                                                                          color:
                                                                              Colors.grey,
                                                                          borderRadius:
                                                                              BorderRadius.circular(30),
                                                                        ),
                                                                        height: 50.0,
                                                                        width: 150.0,
                                                                        child: Center(
                                                                          child:
                                                                              Text(
                                                                            'Reschedule',
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 20.0,
                                                                              color: Colors.white,
                                                                            ),
                                                                          ),
                                                                        )),
                                                                    onTap: () {
                                                                      Navigator.push(
                                                                          context,
                                                                          MaterialPageRoute(
                                                                              builder: (context) => EditBukuTamu(bukutamu: listBukuTamu[index])));
                                                                    })
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Align(
                                                      alignment:
                                                          Alignment.topRight,
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          color: secondaryColor,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                                  bottomLeft:
                                                                      Radius.circular(
                                                                          50.0),
                                                                  topRight: Radius
                                                                      .circular(
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
                                    )));
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    })
              ],
            ),
          )
        ],
      ),
    );
  }
}
