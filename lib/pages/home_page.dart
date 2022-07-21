import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:flutter_one/models/catalog.dart';
import 'package:flutter_one/widgets/drawer.dart';

import '../widgets/item_widgets.dart';

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
      appBar: AppBar(
        // backgroundColor: Colors.white,  //we did this in main.dart for keeping it clean here.
        // elevation: 0.0,
        // iconTheme: IconThemeData(color: Colors.black),
        title: Text('Catalogue App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogueModel.items != null && CatalogueModel.items.isNotEmpty)?
        //      ListView.builder(
        //     itemCount: CatalogueModel.items.length,
        //     itemBuilder: (context,index){
        //       return ItemWidget(
        //         item: CatalogueModel.items[index],
        //       );
        //     },
        // ) 
        
          GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16
                ),

              itemBuilder: (context,index){
                final item = CatalogueModel.items[index];
                  return  Card(
                    clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: GridTile(
                          header: Container(child:
                          Text(
                            item.name,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                           padding: const EdgeInsets.all(12),
                           color: Colors.black38,

                      ),
                          child: Image.network(item.image),
                          footer: //Text("\$${item.price.toString()}"),
                                    Text(item.price.toString(),)
                      )
                  );
              },
              itemCount: CatalogueModel.items.length,
          )
            : Center(
            child: CircularProgressIndicator()
        ) ,
      ),
      drawer: MyDrawer(),
    );
  }
}
