import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class EditCampInfo extends StatefulWidget {
  @override
  _EditCampInfoState createState() => _EditCampInfoState();
}

class _EditCampInfoState extends State<EditCampInfo> {
  String _urlUpdate = 'http://10.0.2.2:3000/updatService';
  List campInfo;

  TextEditingController _name = TextEditingController();
  TextEditingController _desc = TextEditingController();
  TextEditingController _loca = TextEditingController();
  TextEditingController _cont = TextEditingController();
  TextEditingController _pric = TextEditingController();

  void updateData() async {
    try {
      http.Response responseShow = await http.put(
        _urlUpdate,
        body: {
          'name': _name.text,
          'desc': _desc.text,
          'location': _loca.text,
          'contact': _cont.text,
          'price': _pric.text,
          'cid': campInfo[0]['CampID'].toString()
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

  void editCampsite() {
    setState(() {
      updateData();
      Navigator.pop(context);
      Navigator.pushReplacementNamed(context, '/manageArea');
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
    Future.delayed(Duration.zero, () {
      setState(() {
        _name.text = campInfo[0]['Name'].toString();
        _desc.text = campInfo[0]['Description'].toString();
        _loca.text = campInfo[0]['location'].toString();
        _cont.text = campInfo[0]['contact'].toString();
        _pric.text = campInfo[0]['price'].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    campInfo = ModalRoute.of(context).settings.arguments;
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
                SizedBox(
                  height: 30,
                ),
                Text(
                  'Edit ${campInfo[0]['Name']} information',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 30,
                ),
                TextFormField(
                  controller: _name,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius:
                              BorderRadius.all(Radius.circular(30.0))),
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
                onPressed: editCampsite,
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
    );
  }
}
