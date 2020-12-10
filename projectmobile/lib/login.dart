import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String _urlLogin = 'http://10.0.2.2:3000/login';
  List dataID;

  String loginStatus = '';

  TextEditingController _username = TextEditingController();
  TextEditingController _password = TextEditingController();

  Future connectLogin() async {
    http.Response response = await http.post(
      _urlLogin,
      body: {'username': _username.text, 'password': _password.text},
    );
    if (response.statusCode == 200) {
      //OK
      // print(response.body.toString());
      // setState(() {
      //   // _message = response.body.toString();
      // });
      dataID = json.decode(response.body);
      print(dataID);
      saveUserData();
      setState(() {
        Navigator.pushNamedAndRemoveUntil(
            context, '/mainpage', (route) => false);
      });
    } else {
      // print('server error');
      print(response.body.toString());
      setState(() {
        loginStatus = response.body.toString();
      });
    }
  }

  void saveUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String jsonUserData = jsonEncode(dataID);
    pref.setString('userData', jsonUserData);
  }

  void checkLogin() {
    setState(() {
      connectLogin();
    });
  }

  void createNewAccount() {
    setState(() {
      Navigator.pushNamed(context, '/register');
    });
  }

  // Future<void> loadUserData()async{
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String jsonUserData = pref.getString('userData');
  // }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Title'),
      // ),
      body: Container(
        color: Color.fromRGBO(255, 248, 220, 0.5),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/camp.png',
                width: 200,
              ),
              Text(
                'Simple Camp',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 40,
              ),
              TextFormField(
                controller: _username,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Username'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                obscureText: true,
                controller: _password,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Password'),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    loginStatus,
                    style: TextStyle(fontSize: 15, color: Colors.red),
                  ),
                ],
              ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.end,
              //   children: [
              //     Text(
              //       'Forgot your password ?',
              //       style: TextStyle(
              //           fontSize: 15,
              //           fontWeight: FontWeight.bold,
              //           color: Colors.blue),
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 150,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: checkLogin,
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  color: Color.fromRGBO(0, 128, 129, 1),
                  textColor: Colors.white,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Or',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 20,
              ),
              ButtonTheme(
                minWidth: 150,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: createNewAccount,
                  child: Text(
                    'Create an account',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  color: Colors.white,
                  textColor: Color.fromRGBO(0, 128, 129, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
