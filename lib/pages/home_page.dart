import 'dart:convert';

import 'package:catlog_app/Model/catlog.dart';
import 'package:catlog_app/widgets/ItemWidget.dart';
import 'package:catlog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
      appBar: AppBar(
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
    );
  }
}
