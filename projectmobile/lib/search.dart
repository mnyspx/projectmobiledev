import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  String _urlSrarch = 'http://10.0.2.2:3000/search';
  String _urlCampInfo = 'http://10.0.2.2:3000/campInfo';

  List searchData;
  int cid;
  List campInfo;

  int searchLength = 0;

  TextEditingController _search = TextEditingController();

  void connectSrarch() async {
    http.Response response = await http.post(
      _urlSrarch,
      body: {'keyword': _search.text},
    );
    if (response.statusCode == 200) {
      searchData = json.decode(response.body);
      searchLength = searchData.length;
      // print(searchData);
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
          print(campInfo);
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
      cid = searchData[value]['CampID'];
      print('campid is : $cid');
    });
    goCampInfo();
    // print(dataID);
  }

  void searchResult() {
    setState(() {
      connectSrarch();
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
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        'Search',
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      Row(
                        children: [
                          Expanded(
                            flex: 9,
                            child: TextFormField(
                              controller: _search,
                              onChanged: (_search) {
                                // print(_search);
                                searchResult();
                              },
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(30.0),
                                  ),
                                ),
                                labelText: 'Search',
                                suffixIcon: IconButton(
                                  icon: Icon(Icons.search),
                                  onPressed: searchResult,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 1,
                            child: Icon(
                              Icons.sort,
                              size: 45,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text(
                            'Result',
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
              ),
              Expanded(
                flex: 6,
                child: Container(
                  child: searchList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget searchList() {
    return Container(
      child: ListView.builder(
        itemCount: searchLength,
        itemBuilder: (context, index) {
          return Container(
            child: GestureDetector(
              onTap: () => campIDvalue(index),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                          'assets/images/${searchData[index]['image']}',
                        ),
                        radius: 50,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        children: [
                          Text(
                            searchData[index]['Name'],
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
