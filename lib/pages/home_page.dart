import 'package:catalog_app/utils/routes.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_header.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_list.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/drawer.dart';
import '../widgets/item_widgets.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // final int day = 10;
  @override
  void initState() {
    super.initState();
    loadData();
  }
  loadData() async {
    await Future.delayed(Duration(seconds: 2));
    var catalogJson =  await rootBundle.loadString("assets/files/items.json");
   // print(catalogJson);
    var decodedData = jsonDecode(catalogJson);
    var productsData = decodedData["products"];
    CatalogueModel.items =
       List.from(productsData).map<Item>((item) => Item.fromMap(item)).toList();
      setState(() {});
  }
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
       // backgroundColor: MyTheme.creamColor,
        backgroundColor: Theme.of(context).cardColor,
       // backgroundColor: context.cardColor,
        floatingActionButton: FloatingActionButton(
          onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoute),
          child: Icon(CupertinoIcons.cart),
          backgroundColor: MyTheme.darkBluish,
        ).badge(
          color: Colors.red,
          size: 20,
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          )
        ),
      body:   SafeArea(
        child: Container(
            padding: Vx.m32,
           child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CatalogHeader(),

                if(CatalogueModel != null && CatalogueModel.items.isNotEmpty)
                    CatalogList().py16().expand()
                else
                    CircularProgressIndicator().centered().expand(),
              ],
            ),
        ),
      )

    );
  }
}



