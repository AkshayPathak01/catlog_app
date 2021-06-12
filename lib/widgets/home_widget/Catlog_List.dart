import 'package:catlog_app/pages/home_det_pages.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:catlog_app/Model/catlog.dart';
import 'package:catlog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'Catlog_Image.dart';

class CatlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return InkWell(
          onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomeDetailPages(catalog: catalog),
            ),
          ),
          child: CatlogItem(catlog: catalog),
        );
      },
    );
  }
}

class CatlogItem extends StatelessWidget {
  final Item catlog;

  const CatlogItem({Key? key, required this.catlog})
      : assert(catlog != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return VxBox(
      child: Row(
        children: [
          Hero(tag: Key(catlog.id.toString()),
          child: CatlogImage(image: catlog.image)),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catlog.name.text.lg.color(MyTheme.darkBlue).bold.make(),
                catlog.desc.text.textStyle(context.captionStyle).make(),
                10.heightBox,
                ButtonBar(
                  alignment: MainAxisAlignment.spaceBetween,
                  buttonPadding: EdgeInsets.zero,
                  children: [
                    "\$${catlog.price}".text.bold.xl.make(),
                    ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(MyTheme.darkBlue),
                        shape: MaterialStateProperty.all(
                          StadiumBorder(),
                        ),
                      ),
                      onPressed: () {},
                      child: "Buy".text.make(),
                    )
                  ],
                ).pOnly(right: 8.0)
              ],
            ),
          )
        ],
      ),
    ).white.rounded.square(150).make().py16();
  }
}