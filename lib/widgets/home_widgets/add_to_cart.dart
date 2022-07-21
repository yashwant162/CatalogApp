import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/models/catalog.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class AddToCart extends StatefulWidget {
  final Item catalog;
  const AddToCart({Key? key, required this.catalog, }) : assert(catalog != null), super(key: key);

  @override
  State<AddToCart> createState() => _AddToCartState();
}

class _AddToCartState extends State<AddToCart> {
  // bool isInCart = false;
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    bool isInCart = _cart.items.contains(widget.catalog) ? true : false;
    return ElevatedButton(onPressed: () {

      if(!isInCart) {
        isInCart = isInCart.toggle();
        final _catalog = CatalogueModel();
        _cart.catalog = _catalog;
        _cart.add(widget.catalog);

        setState(() {});
      }

    },
      style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
          shape: MaterialStateProperty.all(StadiumBorder(),)
      ),
      child: isInCart ? Icon(Icons.done) : Icon(CupertinoIcons.cart_badge_plus),

    );
  }
}
