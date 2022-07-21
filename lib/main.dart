import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_one/pages/login_page.dart';
import 'package:flutter_one/utils/routes.dart';
import 'package:flutter_one/widgets/themes.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main()
{
  runApp(Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
     // home: HomePage(),
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light,
      theme: MyTheme.lighttheme(context),
      darkTheme: MyTheme.darktheme(context),
      initialRoute: MyRoutes.loginRoute,
      routes: {
          "/" : (context) => HomePage(),
          MyRoutes.loginRoute : (context) => LoginPage(),
          MyRoutes.homeRoute : (context) => HomePage()
      },
                            // darkTheme: ThemeData(
                            //   brightness: Brightness.dark,
                           // ),
    );
  }
}