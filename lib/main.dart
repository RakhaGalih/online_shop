import 'package:flutter/material.dart';
import 'package:online_shop/constant.dart';
import 'package:online_shop/home.dart';

import 'auth.dart';
import 'login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Poppins',
          primaryColor: Constant.maroon,
          inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: Constant.grey),
            focusedBorder: UnderlineInputBorder(
                borderSide:
                    BorderSide(color: Constant.maroon)),
          )),
      home: Auth(),
    );
  }
}
