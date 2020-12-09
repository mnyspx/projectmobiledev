import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class AddNewCampsite extends StatefulWidget {
  @override
  _AddNewCampsiteState createState() => _AddNewCampsiteState();
}

class _AddNewCampsiteState extends State<AddNewCampsite> {
  String _urlAdd = 'http://10.0.2.2:3000/addServ';
  List dataID;
  TextEditingController _name = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _loca = TextEditingController();
  TextEditingController _cont = TextEditingController();
  TextEditingController _pric = TextEditingController();

  int _gValue = 0;

  String pic = '02.jpg';

  int ranNum = 0;

  void addData() async {
    try {
      http.Response responseShow = await http.post(
        _urlAdd,
        body: {
          'name': _name.text,
          'img': pic,
          'desc': _desc.text,
          'location': _loca.text,
          'contact': _cont.text,
          'price': _pric.text,
          'statusService' : _gValue.toString(),
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

  //rand pic
  void change(int value) {
    setState(() {
      _gValue = value;
      if (_gValue == 1) {
        ranNum = Random().nextInt(3);
        if (ranNum == 0) {
          pic = '02.jpg';
        } else if (ranNum == 1) {
          pic = '03.jpg';
        } else if (ranNum == 2) {
          pic = '08.jpg';
        }
        print(pic);
        // print(_gValue);
      } else {
        ranNum = Random().nextInt(3);
        if (ranNum == 0) {
          pic = '30.jpg';
        } else if (ranNum == 1) {
          pic = '33.jpg';
        } else if (ranNum == 2) {
          pic = '34.jpg';
        }
        print(pic);
      }
    });
  }

  void loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String jsonUserData = pref.getString('userData');
    if (jsonUserData != null) {
      dataID = jsonDecode(jsonUserData);
      print("this user id : ${dataID[0]['UserID']} \n username : ${dataID[0]['username']}");
    }
  }

  void addCampsite() {
    setState(() {
      addData();
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/manageArea');
    });
  }

  void cancelAdd() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Title'),
      // ),
      body: SingleChildScrollView(
        child: Container(
          color: Color.fromRGBO(255, 248, 220, 0.5),
          child: Padding(
            padding: const EdgeInsets.all(40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Add new Service',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                Row(
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                              value: 0, groupValue: _gValue, onChanged: change),
                          Text(
                            'Campsite',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Radio(
                              value: 1, groupValue: _gValue, onChanged: change),
                          Text(
                            'Tent',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      labelText: 'Name'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _desc,
                  maxLines: 5,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    labelText: 'Information',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _loca,
                  maxLines: 3,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(30.0),
                        ),
                      ),
                      labelText: 'Location'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _cont,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      labelText: 'Contact'),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: _pric,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
                      labelText: 'Price'),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Text('Picture/Video',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
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
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(255, 248, 220, 0.5),
        padding: EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ButtonTheme(
              minWidth: 150,
              height: 50,
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                onPressed: addCampsite,
                child: Text(
                  'Add',
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
                onPressed: cancelAdd,
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
    );
  }
}
