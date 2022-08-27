// ignore_for_file: import_of_legacy_library_into_null_safe

import 'dart:convert';

import 'package:blogapp/services/apiJadwal.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:http/http.dart' as http;
import '../models/carousel_model.dart';
import '../models/jadwal.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../shared/shared.dart';

import 'detailJadwal.dart';
import 'drawer_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var body;
  bool load = false;

  bool loading = true;
  double xOffset = 0;
  double yOffset = 0;
  double scaleFactor = 1;

  bool isDrawerOpen = false;
  int _current = 0;

  List<T> map<T>(List list, Function handler) {
    List<T> result = [];
    for (var i = 0; i < list.length; i++) {
      result.add(handler(i, list[i]));
    }
    return result;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      const DrawerPage(),
      AnimatedContainer(
          transform: Matrix4.translationValues(xOffset, yOffset, 0)
            ..scale(scaleFactor)
            ..rotateY(isDrawerOpen ? -0.5 : 0),
          duration: const Duration(microseconds: 250),
          decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(isDrawerOpen ? 40 : 0.0)),
          child: ListView(physics: const ClampingScrollPhysics(), children: [
            Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                Container(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 10,
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        isDrawerOpen
                            ? IconButton(
                                icon: const Icon(Icons.arrow_back_ios),
                                onPressed: () {
                                  setState(() {
                                    xOffset = 0;
                                    yOffset = 0;
                                    scaleFactor = 1;

                                    isDrawerOpen = false;
                                  });
                                },
                              )
                            : IconButton(
                                onPressed: () {
                                  setState(() {
                                    xOffset = 230;
                                    yOffset = 150;
                                    scaleFactor = 0.6;
                                    isDrawerOpen = true;
                                  });
                                },
                                icon: const Icon(Icons.menu)),
                        // Column(
                        //   children: const [
                        //     CircleAvatar(),
                        //   ],
                        // )
                      ]),
                ),
              ],
            ),

            Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                padding: const EdgeInsets.only(left: 16, bottom: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang',
                      style: GoogleFonts.inter(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                          color: blackColor),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text("")
                  ],
                )),

            Container(
              alignment: Alignment.centerLeft,
              margin: const EdgeInsets.only(left: 16, right: 16),
              width: MediaQuery.of(context).size.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  // ignore: sized_box_for_whitespace
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 190,
                    child: Swiper(
                      onIndexChanged: (index) {
                        setState(() {
                          _current = index;
                        });
                      },
                      autoplay: true,
                      layout: SwiperLayout.DEFAULT,
                      itemCount: carousels.length,
                      itemBuilder: (BuildContext context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: AssetImage(
                                  carousels[index].image,
                                ),
                                fit: BoxFit.cover),
                          ),
                        );
                      },
                    ),
                  ),

                  //titik titik bergerak
                  const SizedBox(
                    height: 12,
                  ),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: map(
                          carousels,
                          (index, image) {
                            return Container(
                              alignment: Alignment.center,
                              height: 6,
                              width: 6,
                              margin: const EdgeInsets.only(right: 8),
                              decoration: BoxDecoration(
                                  shape: BoxShape.rectangle,
                                  color: _current == index
                                      ? primaryColor
                                      : Colors.grey),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding:
            //       const EdgeInsets.only(left: 16, top: 24, bottom: 30),
            //   child: Text(
            //     'Jadwal Kegiatan',
            //     style: mTitleStyle,
            //   ),
            // ),
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 16, top: 20),
                    child: Text(
                      'Jadwal Kegiatan',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.left,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  FutureBuilder<List<Jadwal>>(
                    future: ApiService.getData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<Jadwal> listJadwal = snapshot.data!;
                        return ListView.separated(
                          physics: const ClampingScrollPhysics(),
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(left: 16, right: 16),
                          itemCount: listJadwal.length,
                          itemBuilder: (BuildContext context, int index) =>
                              InkWell(
                            onTap: () {
                              // ignore: unnecessary_new
                              Navigator.of(context).push(new MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      DetailJadwalPage(
                                        jadwal: listJadwal[index],
                                      )));
                            },
                            child: Container(
                              child: Row(
                                children: [
                                  Container(
                                    width: 120,
                                    height: 75,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: Image.network(
                                        ApiService.host +
                                            listJadwal[index].image,
                                        fit: BoxFit.cover,
                                      ),
                                      // child: Image(
                                      //   image: AssetImage(
                                      //       'assets/images/seminar.jpg'),
                                      // ),
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        listJadwal[index].namaKegiatan,
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Html(
                                        data: listJadwal[index].deskripsi,
                                        style: {
                                          '#': Style(
                                              height: 50,
                                              fontSize: FontSize(12)),
                                        },
                                      ),
                                    ],
                                  )),
                                ],
                              ),
                            ),
                          ),
                          separatorBuilder: (context, index) => Divider(),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    },
                  )
                ])
          ]))
    ]));
  }
}
