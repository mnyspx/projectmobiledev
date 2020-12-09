import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';

class EditAccount extends StatefulWidget {
  @override
  _EditAccountState createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String _urlUpdateAcc = 'http://10.0.2.2:3000/editProf';

  List dataID;

  TextEditingController _username = TextEditingController();
  TextEditingController _fullname = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _phonenum = TextEditingController();
  TextEditingController _pass = TextEditingController();

  void loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String jsonUserData = pref.getString('userData');
    if (jsonUserData != null) {
      setState(() {
        dataID = jsonDecode(jsonUserData);
      });
      print(
          "this user id : ${dataID[0]['UserID']} \n username : ${dataID[0]['username']}");
    }
  }

  void updateData() async {
    try {
      http.Response responseShow = await http.put(
        _urlUpdateAcc,
        body: {
          'username': _username.text,
          'password': _pass.text,
          'email': _email.text,
          'phone': _phonenum.text,
          'fullname': _fullname.text,
          'uid': dataID[0]['UserID'].toString()
        },
      ).timeout(Duration(seconds: 10));
      if (responseShow.statusCode == 200) {
        setState(() {
          // data = json.decode(responseShow.body);
          // dataLength = data.length;
          print(responseShow.body.toString());
        });
      }
    } on TimeoutException catch (e) {
      print('Timeout: ' + e.toString());
    } catch (e) {
      print('Error: $e');
    }
  }

  void editAccountInfo() {
    setState(() {
      updateData();
      Navigator.pop(context);
      // Navigator.pushReplacementNamed(context, '/accPage');
    });
  }

  void cancelEdit() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
    Future.delayed(Duration.zero, () {
      setState(() {
        _username.text = dataID[0]['username'].toString();
        _fullname.text = dataID[0]['FullName'].toString();
        _email.text = dataID[0]['Email'].toString();
        _phonenum.text = dataID[0]['Phone'].toString();
      });
    });
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
            Text(
              'Edit your account',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: _username,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  labelText: 'Username'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _fullname,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  labelText: 'Full name'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _email,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  labelText: 'Email'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _phonenum,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  labelText: 'Phone number'),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              controller: _pass,
              obscureText: true,
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  labelText: 'password'),
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text('Picture/Video',
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: Icon(
                    Icons.image,
                    size: 130,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Card(
                  child: Icon(
                    Icons.image,
                    size: 130,
                    color: Colors.grey,
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                Card(
                  child: Icon(
                    Icons.add_a_photo,
                    size: 130,
                    color: Colors.grey,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 40,
            ),
            ButtonTheme(
              minWidth: 150,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: editAccountInfo,
                child: Text(
                  'Edit',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                color: Color.fromRGBO(0, 128, 129, 1),
                textColor: Colors.white,
              ),
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
                onPressed: cancelEdit,
                child: Text(
                  'Cancel',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                color: Colors.red,
                textColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
