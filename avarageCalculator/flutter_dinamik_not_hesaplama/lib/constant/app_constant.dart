import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Sabitler {
  static const MaterialColor anaRenk = Colors.teal;
  static const String baslikText = "Ortalama Hesaplama";
  static final TextStyle baslikStyle = GoogleFonts.quicksand(
      fontSize: 24, fontWeight: FontWeight.w900, color: anaRenk);
  static BorderRadius borderRadius = BorderRadius.circular(36);
  static final TextStyle ortalamaGosterBodyStyle = GoogleFonts.quicksand(
      fontSize: 15, fontWeight: FontWeight.w600, color: Colors.black);
  static final TextStyle ortalamaStyle = GoogleFonts.quicksand(
      fontSize: 48, fontWeight: FontWeight.w500, color: anaRenk);
  static final EdgeInsets dropDownPadding =
      EdgeInsets.symmetric(horizontal: 18, vertical: 8);
}
