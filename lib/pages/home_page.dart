import 'package:catlog_app/widgets/drawer.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Catlog App" ),
        
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
