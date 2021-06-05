import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
        //color: Colors.white,
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
          "Welcome",
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 20.0,
        ),
        Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 40.0),
            child: Column(
              children: [
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: " Enter Email ",
                    labelText: "Email",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                TextFormField(
                  style: TextStyle(color: Colors.white),
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: " Enter Password ",
                    labelText: "Password",
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(color: Colors.black38, width: 1.5),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                ElevatedButton(
                    onPressed: () {
                      print("Hiii");
                    },
                    child: Text("Login"),
                    style: TextButton.styleFrom())
              ],
            ))
      ],
    ));
  }
}
