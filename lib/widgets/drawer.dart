import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final imageUrl =
        "https://pbs.twimg.com/profile_images/1298193390723452928/Mz8JN76p_400x400.jpg";
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            margin: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              decoration: BoxDecoration(color: Colors.deepPurple),
              currentAccountPicture: CircleAvatar(
                //backgroundColor: Colors.white,
                backgroundImage: NetworkImage(imageUrl),
              ),
              margin: EdgeInsets.zero,
              accountName: Text("Akshay Pathak"),
              accountEmail: Text(
                "akshay@gmail.com",
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.home,
              color: Colors.black,
            ),
            title: Text(
              "Home",
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.profile_circled,
              color: Colors.black,
            ),
            title: Text(
              "Profile",
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            leading: Icon(
              CupertinoIcons.mail,
              color: Colors.black,
            ),
            title: Text(
              "Mail Me",
              textScaleFactor: 1.3,
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
