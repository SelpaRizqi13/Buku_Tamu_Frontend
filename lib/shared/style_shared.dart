import 'package:blogapp/shared/shared.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

//style untuk judul

var mTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w600, color: blackColor, fontSize: 16);

var mMoreDiscountStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w700, color: primaryColor, fontSize: 12);

var mServiceTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, color: blackColor, fontSize: 12);
var mServiceSubtitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w400, color: blackColor, fontSize: 10);

var mPopularDestinationTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w700, color: blackColor, fontSize: 16);
var mPopularDestinationSubtitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, color: blackColor, fontSize: 10);

var mTravelogTitleStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w900, color: blackColor, fontSize: 14);
var mTravelogContentStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, color: blackColor, fontSize: 10);
var mTravelogPlaceStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, color: blackColor, fontSize: 10);

var mDrawerStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, color: whiteColor, fontSize: 18);
var mSubDrawerStyle = GoogleFonts.inter(
    fontWeight: FontWeight.w500, color: whiteColor, fontSize: 12);

var mSplashScreen = GoogleFonts.abrilFatface(
    fontWeight: FontWeight.bold, color: primaryColor, fontSize: 30);

var mDetailProd = GoogleFonts.abrilFatface(
    fontWeight: FontWeight.bold, color: blackColor, fontSize: 14);

var judul = GoogleFonts.abrilFatface(color: Colors.white);

class ThemeStyles {
  static TextStyle departureTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25.0,
  );
  static TextStyle arrivalTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 40.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle travelDateTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 25.0,
    fontWeight: FontWeight.w100,
  );
  static TextStyle dropDownTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 15.0,
  );
  static TextStyle ticketPrice = TextStyle(
    color: ThemeColors.orange,
    fontSize: 35.0,
    fontWeight: FontWeight.w900,
  );
  static TextStyle greyStyle = TextStyle(
    color: Colors.grey,
    fontSize: 15.0,
  );
  static TextStyle mainBlackTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 30.0,
  );
  static TextStyle subBlackTextStyle = TextStyle(
    color: Colors.black,
    fontSize: 15.0,
  );
}
