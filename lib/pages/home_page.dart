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
    var catlogJson = await rootBundle.loadString("assets/files/catloJson.json");
    print(catlogJson);
  }

  @override
  Widget build(BuildContext context) {
    final dummyList = List.generate(5, (index) => CatalogModel.items[0]);

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
        child: ListView.builder(
          itemCount: dummyList.length,
          itemBuilder: (context, index) {
            return ItemWidget(
              item: dummyList[index],
            );
          },
        ),
      ),
      // bottomNavigationBar: BottomAppBar(),
      drawer: MyDrawer(),
    );
  }
}
