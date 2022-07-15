// ignore_for_file: unnecessary_new

import 'package:blogapp/screens/home.dart';
import 'package:blogapp/screens/pages/BukuTamu/tokenSayaPage.dart';

import 'package:blogapp/screens/pages/BukuTamu/bukuTamu.dart';

import 'package:blogapp/screens/pages/info/info.dart';

import 'package:blogapp/screens/pages/profile/profile.dart';
import 'package:flutter/material.dart';

import '../constant.dart';
import '../models/api_response.dart';
import '../models/user.dart';
import '../services/user_service.dart';
import '../shared/shared.dart';
import '../shared/style_shared.dart';
import 'login.dart';

class DrawerPage extends StatefulWidget {
  const DrawerPage({Key? key}) : super(key: key);

  @override
  _DrawerPageState createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {
  User? user;
  bool loading = true;

  void getUser() async {
    ApiResponse response = await getUserDetail();
    if (response.error == null) {
      setState(() {
        user = response.data as User;
        loading = false;
      });
    } else if (response.error == unauthorized) {
      logout().then((value) => {
            Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(builder: (context) => Login()),
                (route) => false)
          });
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('${response.error}')));
    }
  }

  @override
  void initState() {
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: primaryColor,
        //jarak posisi avatar dan tulisan dari atas layar
        padding: const EdgeInsets.only(top: 130, bottom: 70, left: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(children: [
              CircleAvatar(
                  // p
                  ),
              //jarak antar avatar dan text
              const SizedBox(
                width: 10,
              ),
              Column(
                children: [
                  Text(
                    '',
                    style: mDrawerStyle,
                  ),
                  Text(
                    'Mahasiswa',
                    style: mSubDrawerStyle,
                  )
                ],
              )
            ]),
            Column(children: [
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.home),
                title: Text("Dashboard", style: mDrawerStyle),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => Home()));
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.people_outline_rounded),
                title: Text("Profile", style: mDrawerStyle),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => const ProfilePage()));
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.menu_book_outlined),
                title: Text("Buku Tamu", style: mDrawerStyle),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => const BukuTamuPage()));
                },
              ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.library_books),
                title: Text("Token Saya", style: mDrawerStyle),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) =>
                          const TokenSayaPage()));
                },
              ),
              // ListTile(
              //   iconColor: Colors.white,
              //   textColor: Colors.white,
              //   leading: const Icon(Icons.list_alt_outlined),
              //   title: Text("Survei IKM", style: mDrawerStyle),
              //   onTap: () {},
              // ),
              ListTile(
                iconColor: Colors.white,
                textColor: Colors.white,
                leading: const Icon(Icons.info_outline_rounded),
                title: Text("Info", style: mDrawerStyle),
                onTap: () {
                  Navigator.of(context).push(new MaterialPageRoute(
                      builder: (BuildContext context) => const InfoHalaman()));
                },
              ),
            ]
                // drawerItems
                //     .map((element) => Padding(
                //           padding: const EdgeInsets.all(8.0),
                //           child: Row(
                //             children: [
                //               Icon(
                //                 element['icon'],
                //                 color: Colors.white,
                //                 size: 30,
                //               ),
                //               const SizedBox(
                //                 width: 10,
                //               ),
                //               Text(
                //                 element['title'],
                //                 style: mDrawerStyle,
                //               )
                //             ],
                //           ),
                //         ))
                //     .toList(),
                ),
            Row(
              children: [
                const Icon(Icons.logout_rounded, color: Colors.white),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  width: 2,
                  height: 20,
                  color: whiteColor,
                ),
                const SizedBox(
                  width: 10,
                ),
                InkWell(
                  onTap: () {
                    logout().then((value) => {
                          Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => Login()),
                              (route) => false)
                        });
                  },
                  child: Text(
                    'Log Out',
                    style: mDrawerStyle,
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
