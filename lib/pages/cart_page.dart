import 'package:catalog_app/models/cart.dart';
import 'package:catalog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: MyTheme.creamColor,
      appBar: AppBar(
        //backgroundColor: MyTheme.creamColor,
        backgroundColor: Colors.transparent,
        title: "Cart".text.make(),
      ),

      body: Column(
        children: [
          _CartList(

          ).p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),


    );
  }
}

class _CartTotal extends StatelessWidget {
  const _CartTotal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _cart = CartModel();
    return SizedBox(
          height: 200,
          child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                "\$${_cart.totalPrice}".text.bold.xl4.color(MyTheme.darkBluish).make(),
                30.widthBox,
                ElevatedButton(
                    onPressed: ()  {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: "Buying not Supported yet.".text.make(),));
                    },
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(MyTheme.darkBluish),
                    ),
                    child: "Buy".text.bold.color(MyTheme.creamColor).make()).wh(120, 50)
              ],
          ),
    );
  }
}

class _CartList  extends StatefulWidget {
  const _CartList ({Key? key}) : super(key: key);

  @override
  State<_CartList> createState() => _CartListState();
}

class _CartListState extends State<_CartList> {
  final _cart = CartModel();
  @override
  Widget build(BuildContext context) {
    return _cart.items.isEmpty ? "Nothing to show in Cart".text.xl3.makeCentered() :
            ListView.builder(
        itemCount: _cart.items.length,
        itemBuilder: (context,index) => ListTile(
          leading: Icon(Icons.done),
          trailing: IconButton(
            icon: Icon(Icons.remove_circle_outline),
            onPressed: () { 
              _cart.remove(_cart.items[index]);
              setState(() {});
            },

          ),
          title: _cart.items[index].name.text.make(),
        )
    );
  }
}


