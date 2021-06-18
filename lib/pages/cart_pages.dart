import 'package:catlog_app/Model/cart.dart';
import 'package:catlog_app/core/state.dart';
import 'package:catlog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class CartPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.canvasColor,
        title: "Cart".text.make(),
      ),
      backgroundColor: MyTheme.creamColor,
      body: Column(
        children: [
          _CartList().p32().expand(),
          Divider(),
          _CartTotal(),
        ],
      ),
    );
  }
}

class _CartTotal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final CartModel _cart = (VxState.store as MyStore).cart;

    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          VxConsumer(
            builder: (context, _) {
              return "\$${_cart.totalPrice}"
                  .text
                  .xl5
                  .color(Colors.black)
                  .make();
            },
            mutations: {RemoveMutation},
            notifications: {},
          ),
          30.widthBox,
          ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                content: "Bying Not Suported yet".text.make(),
              ));
            },
            style: ButtonStyle(
              backgroundColor:
                  MaterialStateProperty.all(context.theme.buttonColor),
            ),
            child: "Buy".text.white.make(),
          ).w32(context),
        ],
      ),
      height: 200,
    );
  }
}

class _CartList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    VxState.listen(context, to: [RemoveMutation]);
    final CartModel _cart = (VxState.store as MyStore).cart;

    return _cart.items.isEmpty
        ? "Nothing ToShow".text.xl3.makeCentered()
        : ListView.builder(
            itemCount: _cart.items.length,
            itemBuilder: (context, index) => ListTile(
              title: _cart.items[index].name.text.make(),
              leading: Icon(Icons.done),
              trailing: IconButton(
                  onPressed: () => RemoveMutation(_cart.items[index]),
                  icon: Icon(Icons.remove_circle_outline)),
            ),
          );
  }
}
