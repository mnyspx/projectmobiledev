import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';

class ManageArea extends StatefulWidget {
  @override
  _ManageAreaState createState() => _ManageAreaState();
}

class _ManageAreaState extends State<ManageArea> {
  String _urlViewService = 'http://10.0.2.2:3000/viewService';
  String _urlCampInfo = 'http://10.0.2.2:3000/campInfo';
  List campInfo;
  List service;
  List dataID;
  int serviceLength = 0;
  int cid = 0;

  void showService() async {
    try {
      http.Response responseShow = await http.post(
        _urlViewService,
        body: {
          'uid': dataID[0]['UserID'].toString(),
        },
      ).timeout(Duration(seconds: 10));
      if (responseShow.statusCode == 200) {
        setState(() {
          service = json.decode(responseShow.body);
          serviceLength = service.length;
        });
      }
    } on TimeoutException catch (e) {
      print('Timeout: ' + e.toString());
    } catch (e) {
      print('Error: $e');
    }
  }

  void goSelectService() async {
    try {
      http.Response responseShow = await http.post(
        _urlCampInfo,
        body: {
          'campID': cid.toString(),
        },
      ).timeout(Duration(seconds: 10));
      if (responseShow.statusCode == 200) {
        setState(() {
          campInfo = json.decode(responseShow.body);
          Navigator.pushNamed(context, '/editCamp', arguments: campInfo);
        });
      }
    } on TimeoutException catch (e) {
      print('Timeout: ' + e.toString());
    } catch (e) {
      print('Error: $e');
    }
  }

  void loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String jsonUserData = pref.getString('userData');
    if (jsonUserData != null) {
      dataID = jsonDecode(jsonUserData);
      print("this user id : ${dataID[0]['UserID']} \n username : ${dataID[0]['username']}");
    }
  }

  void cancelAdd() {
    setState(() {
      Navigator.pop(context);
    });
  }

  void editCampInfo() {
    Navigator.pushNamed(context, '/editCamp');
  }

  void editRentInfo() {
    Navigator.pushNamed(context, '/editRent');
  }

  void campIDvalue(int value) {
    setState(() {
      cid = service[value]['CampID'];
      print('campid is : $cid');
    });
    goSelectService();
    // print(dataID);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
    Future.delayed(Duration.zero, () {
      setState(() {
        // loadUserData();
        showService();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 248, 220, 0.5),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Management',
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Row(
                      children: [
                        Text(
                          'Your service',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Container(
                  child: yourList(),
                ),
              ),
            ],
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
                onPressed: () {
                  Navigator.pushNamed(context, '/addCamp');
                },
                child: Text(
                  'Add New service',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                color: Color.fromRGBO(0, 128, 129, 1),
                textColor: Colors.white,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            // ButtonTheme(
            //   minWidth: 150,
            //   height: 50,
            //   child: RaisedButton(
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(30.0),
            //     ),
            //     onPressed: () {
            //       Navigator.pushReplacementNamed(context, '/addRent');
            //     },
            //     child: Text(
            //       'Add New Rental',
            //       style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            //     ),
            //     color: Color.fromRGBO(0, 128, 129, 1),
            //     textColor: Colors.white,
            //   ),
            // ),
            // SizedBox(
            //   height: 20,
            // ),
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

  Widget yourList() {
    return Container(
      child: ListView.builder(
        itemCount: serviceLength,
        itemBuilder: (context, index) {
          return Container(
            height: 100,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Row(
                  children: [
                    Text(
                      '${service[index]['Name']}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    ButtonTheme(
                      minWidth: 100,
                      height: 50,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        onPressed: () => campIDvalue(index),
                        child: Text(
                          'Edit',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.red,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
