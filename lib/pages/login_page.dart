import 'package:catlog_app/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // _ private
// state extend stateful wideget (LoginPage)
  String name = "";
  bool cButton = false;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            children: [
              Image.asset(
                "assets/images/login.png",
                fit: BoxFit.cover,
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Welcome $name",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20.0,
              ),
              Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 16.0, horizontal: 40.0),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: " Enter Email ",
                          labelText: "Email",
                        ),
                        onChanged: (val) {
                          name = val;
                          setState(() {});
                        },
                      ),
                      TextFormField(
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: " Enter Password ",
                          labelText: "Password",
                        ),
                      ),
                      SizedBox(
                        height: 40.0,
                      ),
                      Material(
                        color: Colors.deepPurple,
                        borderRadius:
                            BorderRadius.circular(cButton ? 50.0 : 9.0),
                        child: InkWell(
                          onTap: () async {
                            setState(() {
                              cButton = true;
                            });
                            await Future.delayed(
                              Duration(seconds: 1),
                            );
                            await Navigator.pushNamed(
                                context, MyRoutes.homeRoutes);
                            setState(() {
                              cButton = false;
                            });
                          },
                          child: AnimatedContainer(
                            duration: Duration(seconds: 1),
                            width: cButton ? 50 : 150,
                            height: 50,
                            alignment: Alignment.center,
                            child: cButton
                                ? Icon(
                                    Icons.done,
                                    color: Colors.white,
                                  )
                                : Text(
                                    "Log In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                          ),
                        ),
                      ),
                      /*ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, MyRoutes.homeRoutes);
                        },
                        child: Text("Login"),
                        style: TextButton.styleFrom(
                          minimumSize: Size(150, 40),
                        ),
                      )*/
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
