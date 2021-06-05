import 'package:catlog_app/pages/home_page.dart';
import 'package:catlog_app/pages/login_page.dart';
import 'package:catlog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // buildcontext create a tree
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.light, // use system ,dark ,light
      theme: ThemeData(
        // when u use light theme then theme use
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
      darkTheme: ThemeData(
        // when u use dark theme then darktheme use
        brightness: Brightness.dark,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => new LoginPage(), // "/" by default screen of app
        MyRoutes.loginRoutes: (context) =>
            new LoginPage(), // create object of class with new keyword not complusary
        MyRoutes.homeRoutes: (context) =>
            new HomePage(), // create object of class with new keyword not complusary
      },
    );
  }
}
