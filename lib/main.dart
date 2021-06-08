import 'package:catlog_app/pages/home_page.dart';
import 'package:catlog_app/pages/login_page.dart';
import 'package:catlog_app/utils/routes.dart';
import 'package:catlog_app/widgets/themes.dart';
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
      themeMode: ThemeMode.light, 
      theme: MyTheme.lightTheme(context),
      // use system ,dark ,light
      darkTheme: MyTheme.darkTheme(context),
     /* theme: ThemeData(
        // when u use light theme then theme use
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
          textTheme: Theme.of(context).textTheme,
        )
      ),
      darkTheme: ThemeData(
        // when u use dark theme then darktheme use
        brightness: Brightness.dark,
      ),*/
      initialRoute: MyRoutes.homeRoutes,
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
