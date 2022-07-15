// ignore_for_file: file_names, unused_field, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../shared/shared.dart';

class InfoPage extends StatefulWidget {
  const InfoPage({Key? key}) : super(key: key);

  @override
  _InfoPageState createState() => _InfoPageState();
}

class _InfoPageState extends State<InfoPage> {
  bool _hasCallSupport = false;
  Future<void>? _launched;
  String _phone = '4234892';

  @override
  void initState() {
    super.initState();
    // Check for phone call support.
    canLaunchUrl(Uri(scheme: 'tel', path: '123')).then((bool result) {
      setState(() {
        _hasCallSupport = result;
      });
    });
  }

  Future<void> _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  String email = "diskominfo@bandung.go.id";
  _launchEmail() async {
    if (await canLaunch("mailto:$email")) {
      await launch("mailto:$email");
    } else {
      throw 'Could not launch';
    }
  }

  final Uri _youtube =
      Uri.parse('https://www.youtube.com/channel/UCh0SF-m9gHK-LOfxvNLkT2A');

  Future<void> _launchUrlyt() async {
    if (!await launchUrl(_youtube)) {
      throw 'Could not launch $_youtube';
    }
  }

  final Uri _web = Uri.parse('https://diskominfo.bandung.go.id/');

  Future<void> _launchUrlweb() async {
    if (!await launchUrl(_web)) {
      throw 'Could not launch $_web';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: primaryColor,
          title: const Text("Info DISKOMINFO"),
        ),
        body: Stack(
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 50, top: 20),
              // ignore: unnecessary_const
              child: const Text(
                "Info DISKOMINFO Kota Bandung",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
                  margin: const EdgeInsets.all(60),
                  width: 300,
                  height: 200,
                  alignment: Alignment.topCenter,
                  decoration: const BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.white,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/half-profile-image-handsome-young-caucasian-man-with-good-skin-brown-eyes-black-stylish-hair-stubble-posing-isolated-against-blank-wall-looking-front-him-smiling_343059-4560.jpg?w=2000'))),
                ),
                Container(
                  alignment: Alignment.centerLeft,
                  padding: const EdgeInsets.only(left: 30),
                  child: Column(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Text(
                        "Kontak Kami",
                        style: TextStyle(fontSize: 30),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.call,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                          child: const Text("4234892"),
                          onTap: () => setState(() {
                                _launched = _makePhoneCall(_phone);
                              })),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.attach_email,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: const Text("diskominfo@bandung.go.id"),
                        onTap: _launchEmail,
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.smart_display,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: const Text("Youtube Diskominfo"),
                        onTap: _launchUrlyt,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 30, top: 20),
                  child: Row(
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      const Icon(
                        Icons.public,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      GestureDetector(
                        child: const Text(
                          "https://diskominfo.bandung.go.id/",
                          style: TextStyle(color: Colors.blue),
                        ),
                        onTap: _launchUrlweb,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}
