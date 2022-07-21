import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailsPage extends StatelessWidget {
  final Item catalog;
  const HomeDetailsPage({Key? key, required this.catalog}) :
                    assert(catalog != null),
                    super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: MyTheme.creamColor,
       // title: catalog.name.text.bold.xl2.color(MyTheme.darkBluish).make().p(10),
      ),
        backgroundColor: MyTheme.creamColor,
        bottomNavigationBar: Container(
            color: Colors.white,
          child: ButtonBar(
            alignment: MainAxisAlignment.spaceBetween,
            buttonPadding: EdgeInsets.zero,
            children: [
              "\$${catalog.price}".text.bold.xl4.color(MyTheme.darkBluish).make(),
              AddToCart(catalog: catalog).wh(100, 50),

            ],
          ).p16(),
        ),
          body:  SafeArea(
            //bottom: false,

            child: Column(
              children: [
                Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image)
                ).h40(context),
                Expanded(
                  child: VxArc(
                      height: 30,
                      arcType: VxArcType.CONVEY,
                      edge: VxEdge.TOP,
                    child: Container(
                      color: Colors.white,
                      width: context.screenWidth,
                      child: Column(
                          children: [
                            catalog.name.text.bold.xl4.color(MyTheme.darkBluish).make(),
                            catalog.desc.text.textStyle(context.captionStyle).size(15).make(),
                            15.heightBox,
                            "Innovation distinguishes between a leader and a follower,\nYour time is limited, so don’t waste it living someone else’s life."
                            .text
                            .textStyle(context.captionStyle).size(15)
                            .make().pOnly(right: 15,top: 10)
                          ],
                      ).p(50),
                    ),
                  ),
                )
              ],
            ),
          ),
    );
  }
}

