import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/pages/home_detail_page.dart';
import 'package:catalog_app/widgets/home_widgets/add_to_cart.dart';
import 'package:catalog_app/widgets/home_widgets/catalog_image.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:velocity_x/velocity_x.dart';

class CatalogList extends StatelessWidget {
  const CatalogList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemCount: CatalogueModel.items.length,
        itemBuilder: (context,index){
         final catalog = CatalogueModel.items[index];
          //  final catalog = CatalogueModel.getByPosition(index);
          return InkWell(
              onTap: () => Navigator.push(context,
                  MaterialPageRoute(
                    //  builder:(context) => HomeDetailsPage(catalog: CatalogueModel.getById(2),)  )),
                      builder:(context) => HomeDetailsPage(catalog: catalog,)  )),
              child: CatalogItem(catalog: catalog));
        }
    );
  }
}

class CatalogItem extends StatelessWidget {

  final Item catalog;
  const CatalogItem({Key? key, required this.catalog}) :
        assert(catalog != null), super(key : key);

  @override
  Widget build(BuildContext context) {
    return VxBox(
        child: Row(
          children: [

            Hero(
              tag: Key(catalog.id.toString()),
              child: CatalogImage(
                // Image.network(image).box.p8.color(MyTheme.creamColor).roundedLg.make(),
                // Image.network(image).w40(context),
                image: catalog.image,
              ),
            ),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catalog.name.text.bold.xl.color(MyTheme.darkBluish).make(),
                catalog.desc.text.textStyle(context.captionStyle).make(),
                15.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catalog.price}".text.bold.xl.make(),
                    AddToCart(catalog: catalog)
                  ],
                ).pOnly(right: 6)
              ],
            ))
          ],
        )
    ).white.roundedLg.square(150).p3.make().py(10);
  }
}

