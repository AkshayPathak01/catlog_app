import 'package:catlog_app/Model/catlog.dart';
import 'package:catlog_app/widgets/home_widget/add_to_cart.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeDetailPages extends StatelessWidget {
  final Item catalog;

  const HomeDetailPages({Key? key, required this.catalog})
      : assert(catalog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: context.canvasColor,
      bottomNavigationBar: Container(
        color: context.cardColor,
        child: ButtonBar(
          alignment: MainAxisAlignment.spaceBetween,
          buttonPadding: EdgeInsets.zero,
          children: [
            "\$${catalog.price}".text.bold.xl4.red800.make(),
            AddToCart(catalog: catalog).wh(120, 50)
          ],
        ).p32(),
      ),
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            Hero(
                    tag: Key(catalog.id.toString()),
                    child: Image.network(catalog.image))
                .h32(context),
            Expanded(
                child: VxArc(
                    arcType: VxArcType.CONVEY,
                    height: 30.0,
                    edge: VxEdge.TOP,
                    child: Container(
                      width: context.screenWidth,
                      child: Column(
                        children: [
                          catalog.name.text.xl4
                              .color(context.accentColor)
                              .bold
                              .make(),
                          catalog.desc.text
                              .textStyle(context.captionStyle)
                              .xl
                              .make(),
                          10.heightBox,
                          " Use textStyle to provide custom or any theme style.If the style's 'inherit' property is true, the style will be merged with the closest enclosing [DefaultTextStyle]. Otherwise, the style will replace the closest enclosing DefaultTextStyle."
                              .text
                              .textStyle(context.captionStyle)
                              .make()
                        ],
                      ).py64(),
                      color: context.cardColor,
                    )))
          ],
        ),
      ),
    );
  }
}
