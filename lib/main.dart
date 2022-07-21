import 'package:catalog_app/core/store.dart';
import 'package:catalog_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/pages/login_page.dart';
import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:velocity_x/velocity_x.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';

void main()
{
  runApp(VxState(store: MyStore() , child: Myapp()));
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
      initialRoute: MyRoutes.homeRoute,
      routes: {
        "/" : (context) => HomePage(),
        MyRoutes.loginRoute : (context) => LoginPage(),
        MyRoutes.homeRoute : (context) => HomePage(),
        MyRoutes.cartRoute : (context) => CartPage()
      },
      // darkTheme: ThemeData(
      //   brightness: Brightness.dark,
      // ),
    );
  }
}