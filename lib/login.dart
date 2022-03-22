import 'package:flutter/material.dart';
import 'package:online_shop/constant.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  FocusNode _emailfocusNode = new FocusNode();
  FocusNode _passfocusNode = new FocusNode();
  bool _passwordValid = true;
  bool _emailValid = true;
  bool _obs = true;
  bool daftar = false;

  @override
  void dispose() {
    _emailfocusNode.dispose();
    _passfocusNode.dispose();
    super.dispose();
  }

  void _emailrequestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_emailfocusNode);
    });
  }

  void _passrequestFocus() {
    setState(() {
      FocusScope.of(context).requestFocus(_passfocusNode);
    });
  }

  late String _emailPrefs;
  late String _passPrefs;

  void coba() async {
    if (!await _checkPref('pass', _passPrefs)) {
      
    }
  }

  void _loadTaskPref(String nama) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    print(_prefs.getString(nama) ?? 'null');
  }

  Future<bool> _checkPref(String nama, String prefs) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    return Future<bool>.value(_prefs.getString(nama) == prefs);
  }

  Future<Null> _setPref(String prefs, String nama) async {
    SharedPreferences _prefs = await SharedPreferences.getInstance();
    await _prefs.setString(prefs, nama);
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.all(20),
                  alignment: Alignment.centerLeft,
                  child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => Home()));
                      },
                      child: Icon(Icons.clear))),
              Image.asset(
                'images/logo.png',
                height: 130,
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.all(20),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Masuk ke Akun Anda',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                          focusNode: _emailfocusNode,
                          onTap: _emailrequestFocus,
                          onChanged: (val) {
                            setState(() => _emailPrefs = val);
                          },
                          validator: (val) {
                            if (val!.isEmpty) {
                              setState(() {
                                _emailValid = false;
                              });
                              return 'Email diperlukan';
                            } else {
                              setState(() {
                                _emailValid = true;
                              });
                              return null;
                            }
                          },
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                                color: (_emailfocusNode.hasFocus)
                                    ? Constant.maroon
                                    : Constant.grey),
                            suffixIcon: Icon(Icons.person,
                                color: (_emailValid)
                                    ? Constant.grey
                                    : Constant.maroon),
                          )),
                      SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        focusNode: _passfocusNode,
                        onTap: _passrequestFocus,
                        onChanged: (val) {
                          setState(() => _passPrefs = val);
                        },
                        validator: (val) {
                          if (val!.length < 8) {
                            if (val.length == 0) {
                              setState(() {
                                _passwordValid = false;
                              });
                              return 'Kata sandi diperlukan';
                            } else {
                              setState(() {
                                _passwordValid = false;
                              });
                              return 'Kata sandi setidaknya 8 karakter';
                            }
                          } else if(!daftar){
                            coba();
                          }else{
                            setState(() {
                              _passwordValid = true;
                            });
                            return null;
                          }
                        },
                        decoration: InputDecoration(
                          labelText: 'Kata Sandi',
                          labelStyle: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w400,
                              color: (_passfocusNode.hasFocus)
                                  ? Constant.maroon
                                  : Constant.grey),
                          suffixIcon: IconButton(
                              icon: Icon(
                                  (_obs)
                                      ? Icons.visibility_off
                                      : Icons.visibility,
                                  color: (_passwordValid)
                                      ? Constant.grey
                                      : Constant.maroon),
                              onPressed: () {
                                setState(() {
                                  _obs = !_obs;
                                });
                              }),
                        ),
                        obscureText: _obs,
                      ),
                      (daftar)
                          ? SizedBox(
                              height: 20,
                            )
                          : Container(
                              alignment: Alignment.centerRight,
                              padding: EdgeInsets.symmetric(vertical: 20),
                              child: GestureDetector(
                                  onTap: () {},
                                  child: Text(
                                    'Lupa kata sandi',
                                    style: TextStyle(
                                        color: Constant.maroon, fontSize: 12),
                                  )),
                            ),
                      GestureDetector(
                        onTap: () async {
                          if (daftar) {
                            if (_formKey.currentState!.validate()) {
                              _setPref('email', _emailPrefs);
                              _setPref('pass', _passPrefs);
                              Navigator.push(
                                  context,
                                  new MaterialPageRoute(
                                      builder: (context) => Home()));
                            }
                          } else {
                            if (_formKey.currentState!.validate()) {
                              if (!await _checkPref('email', _emailPrefs)) {
                              } else {}
                            }
                          }
                        },
                        child: Container(
                          width: width,
                          child: Text(
                            (daftar) ? 'Daftar' : 'Masuk',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          padding: EdgeInsets.symmetric(vertical: 10),
                          decoration: BoxDecoration(
                              color: Constant.maroon,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text('Belum punya akun ?',
                                style: TextStyle(
                                    color: Constant.grey, fontSize: 12)),
                            GestureDetector(
                                onTap: () {
                                  setState(() {
                                    daftar = !daftar;
                                  });
                                },
                                child: Text((daftar) ? ' Masuk' : ' Daftar',
                                    style: TextStyle(
                                        color: Constant.maroon,
                                        fontSize: 12,
                                        fontWeight: FontWeight.w600))),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
