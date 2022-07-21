import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';
import '';
import '../../widgets/themes.dart';

class CatalogHeader extends StatelessWidget {
  const CatalogHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catalog App".text.bold.xl4.color(MyTheme.darkBluish).make(),
        "MyShopify Scam Sale!!".text.xl.make(),

      ],
    );
  }
}