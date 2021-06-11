import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catlog_app/Model/catlog.dart';
import 'package:catlog_app/widgets/ItemWidget.dart';
import 'package:catlog_app/widgets/drawer.dart';
import 'package:catlog_app/widgets/themes.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 1));
    final catlogJson =
        await rootBundle.loadString("assets/files/catloJson.json");
    final decodeData = jsonDecode(catlogJson);
    var productData = decodeData["products"]; // value in map

    CatalogModel.items =
        List.from(productData).map<Item>((item) => Item.fromMap(item)).toList();
    setState(() {});
    //print(decodeData);
    //print(catlogJson);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyTheme.creamColor,
      body: SafeArea(
        // battary notification below
        child: Container(
          padding: Vx.m32, //all side 32 padding add
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatlogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatlogList().expand()
              else
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          ),
        ),
      ),
      /* appBar: AppBar(
        // backgroundColor: Colors.white,
        title: Text(
          "Catlog App",
          //style: TextStyle(color: Colors.black),
        ),
        /* elevation: 0.0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),*/
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
            ? ListView.builder(
              
                itemCount: CatalogModel.items!.length,
                itemBuilder: (context, index) => ItemWidget(
                  item: CatalogModel.items![index],
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      // bottomNavigationBar: BottomAppBar(),
      drawer: MyDrawer(),
      */
    );
  }
}

class CatlogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        "Catlog App"
            .text
            .xl5
            .bold
            .color(MyTheme.darkBlue)
            .make(), //xl5 size of text
        "Trending products".text.xl2.make(),
      ],
    );
  }
}

class CatlogList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: CatalogModel.items!.length,
      itemBuilder: (context, index) {
        final catalog = CatalogModel.items![index];
        return CatlogItem(catlog: catalog);
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
          CaatlogImage(image: catlog.image),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                catlog.name.text.lg.color(MyTheme.creamColor).bold.make(),
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

class CaatlogImage extends StatelessWidget {
  final String image;
  const CaatlogImage({
    Key? key,
    required this.image,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Image.network(image)
        .box
        .rounded
        .p8
        .color(MyTheme.creamColor)
        .make()
        .p16()
        .w40(context);
  }
}
