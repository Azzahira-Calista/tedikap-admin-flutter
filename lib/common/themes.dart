import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

figmaFontsize(int fontSize) {
  return fontSize * 0.95;
}

//color
const Color backgroundColor = Color.fromARGB(255, 253, 247, 242);

const Color primaryColor = Color.fromARGB(255, 252, 198, 72);
const Color secondaryColor = Color.fromARGB(255, 63, 61, 86);

const Color primaryTextColor = Color.fromARGB(255, 63, 61, 86);

const Color offColor = Color.fromARGB(255, 199, 199, 199);
const Color activeColor = Color.fromARGB(255, 252, 198, 72);

const Color red = Color.fromARGB(255, 255,69,69);
const Color white = Color.fromARGB(255, 255, 255, 255);
const Color black = Color.fromARGB(200, 0, 0, 0);
const Color cream = Color.fromARGB(255, 254, 242, 214);
const Color darkGrey = Color.fromARGB(255, 126, 123, 123);
const Color lightGrey = Color.fromARGB(255, 239, 235, 233);
const Color shadowBlack = Color.fromARGB(25, 0, 0, 0);

//shadow
const BoxShadow shadow = BoxShadow(
  color: shadowBlack,
  blurRadius: 10,
  offset: Offset(0, 0),
);

//text
TextStyle appBarText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w700,
        fontSize: figmaFontsize(14)));

TextStyle subTitle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(14)));

TextStyle hint = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: offColor,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(14)));

TextStyle headline = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w700,
        fontSize: figmaFontsize(40)));

TextStyle normalText = GoogleFonts.poppins(
    textStyle: TextStyle(
  color: primaryTextColor,
  fontWeight: FontWeight.w400,
  fontSize: figmaFontsize(14),
));

TextStyle normalTextPrimary = GoogleFonts.poppins(
    textStyle: TextStyle(
  color: primaryColor,
  fontWeight: FontWeight.w500,
  fontSize: figmaFontsize(14),
));

TextStyle smallText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w400,
        fontSize: figmaFontsize(10)));

TextStyle smallTextWhite = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: figmaFontsize(10)));

TextStyle button = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: white,
        fontWeight: FontWeight.w500,
        fontSize: figmaFontsize(18)));

TextStyle cardTitle = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(12)));

TextStyle cardText = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w600,
        fontSize: figmaFontsize(18)));

TextStyle button2 = GoogleFonts.poppins(
    textStyle: TextStyle(
        color: primaryTextColor,
        fontWeight: FontWeight.w500,
        fontSize: figmaFontsize(14)));

//image

