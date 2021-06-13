import 'package:catlog_app/pages/cart_pages.dart';
import 'package:catlog_app/pages/home_page.dart';
import 'package:catlog_app/pages/login_page.dart';
import 'package:catlog_app/utils/routes.dart';
import 'package:catlog_app/widgets/themes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

void main() {
  runApp(VxState(
    child: MyApp(),
    store: null,
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // buildcontext create a tree
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: MyTheme.lightTheme(context),
      // use system ,dark ,light
      darkTheme: MyTheme.darkTheme(context),
      initialRoute: MyRoutes.loginRoutes,
      routes: {
        "/": (context) => new LoginPage(), // "/" by default screen of app
        MyRoutes.loginRoutes: (context) =>
            new LoginPage(), // create object of class with new keyword not complusary
        MyRoutes.homeRoutes: (context) =>
            new HomePage(), // create object of class with new keyword not complusary
        MyRoutes.cartRoutes: (context) => new CartPages(),
      },
    );
  }
}
