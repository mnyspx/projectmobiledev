import 'package:flutter/material.dart';

class CampsiteInfo extends StatefulWidget {
  @override
  _CampsiteInfoState createState() => _CampsiteInfoState();
}

class _CampsiteInfoState extends State<CampsiteInfo> {
  int _value = 1;
  Future reserveCampsite() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Reservation',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          content: Container(
            height: 450,
            width: 350,
            child: Column(
              children: [
                Container(
                  //width: 200,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Check-In Date',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        value: 1,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  //width: 200,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Check-Out Date',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        value: 1,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  //width: 200,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'Zone',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        value: 1,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Container(
                  //width: 200,
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    value: _value,
                    items: [
                      DropdownMenuItem(
                        child: Text(
                          'No.Place',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        value: 1,
                      ),
                    ],
                    onChanged: (value) {
                      setState(() {
                        _value = value;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          '200x3 days',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          '600',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'No.Place',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          '2',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(),
                SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      children: [
                        Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Spacer(),
                    Column(
                      children: [
                        Text(
                          '1200',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/history');
              },
              child: Text('OK'),
            ),
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        );
      },
    );
  }

  void closePage() {
    setState(() {
      Navigator.pop(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //   appBar: AppBar(
        //     title: Text('Title'),
        //   ),
        body: Container(
          color: Color.fromRGBO(255,248,220, 0.5),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Text(
                  'Campsite',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Sabaidee Homestay',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/images/30.jpg',
                          ),
                        ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/images/37.jpg',
                            width: 150,
                          ),
                        ),
                    SizedBox(
                      height: 10,
                    ),
                    ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/images/39.jpg',
                            width: 150,
                          ),
                        ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              children: [
                Text(
                  'Information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            Container(
              width: 550,
              height: 200,
              child: Column(
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean quis dui at velit luctus varius. Curabitur aliquam cursus venenatis. Aenean scelerisque ex commodo metus ultricies, eu finibus risus feugiat. Sed eget arcu in augue fringilla egestas eget ut urna. Fusce velit sem, elementum vel porta eu, lacinia vitae odio.",
                    style: TextStyle(fontSize: 18),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Text(
                  'Facilities',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      '- xxxxxxxxxxxxxxxxxx',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '- xxxxxxxxxxxxxxxxxx',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text(
                      '- xxxxxxxxxxxxxxxxxx',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      '- xxxxxxxxxxxxxxxxxx',
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(
              color: Colors.grey,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  'Comments',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.png'),
                      radius: 25,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'Good place!',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
                SizedBox(
                  width: 100,
                ),
                Column(
                  children: [
                    CircleAvatar(
                      backgroundImage: AssetImage('assets/images/person.png'),
                      radius: 25,
                      backgroundColor: Colors.white,
                    ),
                  ],
                ),
                SizedBox(
                  width: 10,
                ),
                Column(
                  children: [
                    Text(
                      'Wonderful!',
                      style: TextStyle(fontSize: 18),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Column(
              children: [
                ButtonTheme(
                  minWidth: 150,
                  height: 50,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    onPressed: reserveCampsite,
                    child: Text(
                      'Reserve',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    onPressed: closePage,
                    child: Text(
                      'Cancel',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    color: Colors.red,
                    textColor: Colors.white,
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
