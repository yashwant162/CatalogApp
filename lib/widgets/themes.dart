import 'package:flutter/material.dart';
import 'package:flutter/src/material/theme_data.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme{
  static ThemeData lighttheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    // primaryTextTheme: GoogleFonts.latoTextTheme()
    cardColor: Colors.white,
    canvasColor: creamColor,
    // floatingActionButtonTheme:
    // FloatingActionButtonThemeData(
    //   backgroundColor: darkBluish,
    // ),
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
      titleTextStyle: Theme.of(context).textTheme.headline5,
    ),

  );

  static ThemeData darktheme(BuildContext context) => ThemeData(
      //brightness: Brightness.dark,
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    // primaryTextTheme: GoogleFonts.latoTextTheme()
    cardColor: Colors.black,
    canvasColor: darkCreme,

      // floatingActionButtonTheme:
      //  FloatingActionButtonThemeData(
      //    backgroundColor: lightBluish,
      // ),
    appBarTheme: AppBarTheme(
      color: Colors.black,
      elevation: 0.0,
      iconTheme: IconThemeData(color: Colors.black),
      toolbarTextStyle: Theme.of(context).textTheme.bodyText2,
      titleTextStyle: Theme.of(context).textTheme.headline5,
    ),

  );

  static Color creamColor = Color(0xfff5f5f5);
  static Color darkBluish = Color(0xff403b58);
  static Color darkCreme = Vx.gray900;
  static Color lightBluish = Vx.purple400;

}