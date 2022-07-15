import 'package:flutter/material.dart';

Color primaryGreen = const Color(0xff416d6d);
List<BoxShadow> shadowList = [
  const BoxShadow(color: Colors.grey, blurRadius: 30, offset: Offset(0, 10))
];

List<Map> drawerItems = [
  {'icon': Icons.home, 'title': 'Dashboard'},
  {'icon': Icons.people_outline_rounded, 'title': 'Profile'},
  {'icon': Icons.menu_book_outlined, 'title': 'Buku Tamu'},
  {'icon': Icons.library_books, 'title': 'Token Saya'},
  {'icon': Icons.list_alt_outlined, 'title': 'Survei IKM'},
  {'icon': Icons.info_outline_rounded, 'title': 'Info'},
];
