import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'login.dart';

class Auth extends StatefulWidget {
  const Auth({Key? key}) : super(key: key);

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _loadTaskPref('email');
  }

  void _loadTaskPref(String nama) async{
    // ignore: unused_local_variable
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    if(_prefs.getString(nama) != null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Home()));
    }else{
      Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (BuildContext context) => Login()));
    };
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
  }
}
