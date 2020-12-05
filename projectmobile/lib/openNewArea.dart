import 'package:flutter/material.dart';

class OpenNewArea extends StatefulWidget {
  @override
  _OpenNewAreaState createState() => _OpenNewAreaState();
}

class _OpenNewAreaState extends State<OpenNewArea> {
  void addNewArea() {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Title'),
      // ),
      body: Container(
        color: Color.fromRGBO(255,248,220, 0.5),
        child: Padding(
          padding: const EdgeInsets.all(40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Management',
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
              Spacer(),
              ButtonTheme(
                minWidth: 150,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: addNewArea,
                  child: Text(
                    'Add',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  color: Color.fromRGBO(0, 128, 129, 1),
                  textColor: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
