import 'dart:math';

import 'package:flutter/material.dart';
import 'package:projectmobile/account.dart';
import 'package:projectmobile/notification.dart';
import 'package:projectmobile/search.dart';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List dataID;
  String _urlCampList = 'http://10.0.2.2:3000/campList';
  String _urlCampInfo = 'http://10.0.2.2:3000/campInfo';
  List data;
  int dataLength = 0;
  int start = 0;

  int cid = 0;
  List campInfo;

  List dataIDstore;

  int randNum = 0;

  void showCamp() async {
    try {
      http.Response responseShow = await http
          .get(
            _urlCampList,
          )
          .timeout(Duration(seconds: 10));
      if (responseShow.statusCode == 200) {
        setState(() {
          data = json.decode(responseShow.body);
          dataLength = data.length;
          randNum = Random().nextInt(dataLength);
          print('num camp${data.length}');
        });
      }
    } on TimeoutException catch (e) {
      print('Timeout: ' + e.toString());
    } catch (e) {
      print('Error: $e');
    }
  }

  void goCampInfo() async {
    try {
      http.Response response = await http.post(
        _urlCampInfo,
        body: {'campID': cid.toString()},
      ).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        setState(() {
          campInfo = json.decode(response.body);
          // print(campInfo);
          Navigator.pushNamed(context, '/campInfo', arguments: campInfo);
        });
      }
    } on TimeoutException catch (e) {
      print('Timeout: ' + e.toString());
    } catch (e) {
      print('Error: $e');
    }
  }

  void campIDvalue(int value) {
    setState(() {
      cid = data[value]['CampID'];
      print('campid is : $cid');
    });
    goCampInfo();
    // saveUserData();
    // print(dataID);
  }

  // void saveUserData() async {
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String jsonUserData = jsonEncode(dataID);
  //   pref.setString('userData', jsonUserData);
  // }

  Future<void> refresh() async {
    await Future.delayed(Duration.zero, () {
      setState(() {
        // loadUserData();
        showCamp();
      });
    });
  }

  void loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String jsonUserData = pref.getString('userData');
    if (jsonUserData != null) {
      dataID = jsonDecode(jsonUserData);
      print(
          "this user id : ${dataID[0]['UserID']} \n username : ${dataID[0]['username']}");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
    // Future.delayed(Duration(seconds: 1), () {
    showCamp();
    // });
  }

  @override
  Widget build(BuildContext context) {
    // dataID = ModalRoute.of(context).settings.arguments;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        // appBar: AppBar(
        //   title: Text('Tab Demo'),
        // ),
        bottomNavigationBar: Container(
          height: 60,
          color: Colors.grey[200],
          child: TabBar(tabs: [
            Tab(
              icon: Icon(
                Icons.home,
                color: Colors.grey,
                size: 45,
              ),
            ),
            // Tab(
            //   icon: Icon(Icons.notifications, color: Colors.grey, size: 45),
            // ),
            Tab(
              icon: Icon(Icons.search, color: Colors.grey, size: 45),
            ),
            Tab(
              icon: Icon(Icons.person, color: Colors.grey, size: 45),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            // 1 Tab Content
            Container(
              // color: Color.fromRGBO(255, 248, 220, 0.5),
              child: data == null ? loading() : showPage(),
            ),
            // 2 Tab Content
            // Container(
            //   child: Notifications(),
            //   // color: Colors.blue,
            // ),
            // 3 Tab Content
            Container(
              child: SearchPage(),
              // color: Colors.yellow,
            ),
            // 4 Tab Content
            Container(
              child: Account(),
              // color: Colors.red,
            ),
          ],
        ),
      ),
    );
  }

  Widget sugimg() {
    return Container(
      child: Column(
        children: [
          // Row(
          //   children: [
          //     Text(
          //       'Campsite',
          //       style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          //     ),
          //   ],
          // ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 0, 0),
            child: Row(
              children: [
                Text(
                  'Places you may like . . .',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              cid = data[randNum]['CampID'];
              goCampInfo();
              // Navigator.pushNamed(context, '/campInfo');
            },
            //TODO:
            child: Container(
              // color: Colors.red,
              width: 500,
              height: 250,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(15.0),
                child: Image.asset(
                  'assets/images/${data[randNum]['image']}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Text(
            '${data[randNum]['Name']}',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget box() {
    return Container(
      height: 20,
    );
  }

  Widget loading() {
    return Scaffold(
      body: Container(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget showPage() {
    return Container(
      // color: Color.fromRGBO(255, 248, 220, 0.5),
      child: Container(
        color: Color.fromRGBO(255, 248, 220, 0.5),
        padding: EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            Expanded(
              flex: 3,
              child: sugimg(),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  Text(
                    'Other place(s)',
                    style: TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 5,
              child: campGrid(),
            ),
          ],
        ),
      ),
    );
  }

  Widget camp() {
    return Container(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          itemCount: dataLength,
          itemBuilder: (context, index) {
            return Column(
              children: [
                // dataLength == 0 ? sugimg() : null,
                start == index ? sugimg() : box(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          GestureDetector(
                            onTap: () => campIDvalue(index),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15.0),
                              child: Image.asset(
                                'assets/images/${data[index]['image']}',
                                width: 400,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                          Text(
                            data[index]['Name'],
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget txtTent() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Text(
              'Tent',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget txtCamp() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(30)),
            child: Text(
              'Campsite',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget campGrid() {
    return Container(
      padding: EdgeInsets.all(16),
      child: RefreshIndicator(
        onRefresh: refresh,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          itemCount: dataLength,
          itemBuilder: (context, index) {
            return Card(
              shadowColor: Colors.black,
              child: new GridTile(
                header:
                    data[index]['statusService'] == 1 ? txtTent() : txtCamp(),
                footer: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(15, 5, 15, 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: Column(
                          children: [
                            Container(
                              child: Text(
                                data[index]['Name'],
                                style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              child: Text(
                                '${data[index]['price']} /night',
                                style: TextStyle(
                                  fontSize: 18,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                child: GestureDetector(
                  onTap: () => campIDvalue(index),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15.0),
                    child: Image.asset(
                      'assets/images/${data[index]['image']}',
                      width: 230,
                      fit: data[index]['statusService'] == 1
                          ? BoxFit.contain
                          : BoxFit.cover,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
