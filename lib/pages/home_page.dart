import 'package:catlog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
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
      body: Center(
        child: Container(
          child: Text("Welcome "),
        ),
      ),
      bottomNavigationBar: BottomAppBar(),
      drawer: MyDrawer(),
    );
  }
}
