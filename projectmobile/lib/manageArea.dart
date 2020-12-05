import 'package:flutter/material.dart';

class ManageArea extends StatefulWidget {
  @override
  _ManageAreaState createState() => _ManageAreaState();
}

class _ManageAreaState extends State<ManageArea> {
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
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Text(
                    'Campsite',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        Text(
                          'XXX Campsite',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        ButtonTheme(
                          minWidth: 100,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onPressed: editCampInfo,
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
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    'Rental',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 100,
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      children: [
                        Text(
                          'XXX Rental',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Spacer(),
                        ButtonTheme(
                          minWidth: 100,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onPressed: editRentInfo,
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
              ),
              Spacer(),
              ButtonTheme(
                minWidth: 150,
                height: 50,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/addCamp');
                                },
                  child: Text(
                    'Add New Campsite',
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
                  onPressed: () {
                                  Navigator.pushReplacementNamed(context, '/addRent');
                                },
                  child: Text(
                    'Add New Rental',
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
      ),
    );
  }
}
