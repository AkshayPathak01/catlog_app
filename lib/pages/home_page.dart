import 'dart:convert';

import 'package:catlog_app/utils/routes.dart';
import 'package:catlog_app/widgets/home_widget/Catlog_List.dart';
import 'package:catlog_app/widgets/home_widget/catalog_Header.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:velocity_x/velocity_x.dart';

import 'package:catlog_app/Model/catlog.dart';

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
      backgroundColor: context.canvasColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.pushNamed(context, MyRoutes.cartRoutes),
        child: Icon(
          CupertinoIcons.cart,
          color: Colors.white,
        ),
        backgroundColor: context.theme.buttonColor,
      ),
      body: SafeArea(
        // battary notification below

        child: Container(
          padding: Vx.m32, //all side 32 padding add
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CatlogHeader(),
              if (CatalogModel.items != null && CatalogModel.items!.isNotEmpty)
                CatlogList().py16().expand()
              else
                CircularProgressIndicator().centered().expand(),
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
