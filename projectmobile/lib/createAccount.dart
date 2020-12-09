import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  String _url_register = 'http://10.0.2.2:3000/register';

  TextEditingController _username = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonenum = TextEditingController();
  TextEditingController _password = TextEditingController();

  void connect_register() async {
    http.Response response = await http.post(
      _url_register,
      body: {'username': _username.text, 'fullname': _fullname.text, 'email': _email.text, 'phone': _phonenum.text, 'password': _password.text},
    );
    if (response.statusCode == 200) {
      //OK
      // print(response.body.toString());
      // setState(() {
      //   // _message = response.body.toString();
      // });
      print(response.body.toString());
      print('success');
      setState(() {
        // Navigator.pushReplacementNamed(context, '/mainpage');
      });
    } else {
      // print('server error');
      print(response.body.toString());
      print('error');
    }
  }

  void newAccount() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Title'),
      // ),
      body: Container(
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
                'Create an account',
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
                controller: _fullname,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Full name'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _email,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Email'),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: _phonenum,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(30.0))),
                    labelText: 'Phone number'),
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
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ButtonTheme(
                    minWidth: 150,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: connect_register,
                      child: Text(
                        'Create',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      color: Color.fromRGBO(0, 128, 129, 1),
                      textColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  ButtonTheme(
                    minWidth: 150,
                    height: 50,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      ),
                      onPressed: newAccount,
                      child: Text(
                        'Cancel',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      color: Colors.red,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
