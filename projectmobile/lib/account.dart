import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
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
              'Account',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            CircleAvatar(
              backgroundImage: AssetImage('assets/images/profile.jpg'),
              radius: 130,
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'You made me sad',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Container(
                      width: 240,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.attach_money),
                                iconSize: 80,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/history');
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Transactions',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 128, 129, 1)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 240,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.person_add),
                                iconSize: 80,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/manageReserv');
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Reservations',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 128, 129, 1)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  children: [
                    Container(
                      width: 240,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit_location),
                                iconSize: 80,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/manageArea');
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Manage Area',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 128, 129, 1)))
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 240,
                      child: Card(
                        child: Padding(
                          padding: const EdgeInsets.all(30.0),
                          child: Column(
                            children: [
                              IconButton(
                                icon: Icon(Icons.settings),
                                iconSize: 80,
                                onPressed: () {
                                  Navigator.pushNamed(context, '/editAccount');
                                },
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text('Settings',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(0, 128, 129, 1)))
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
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
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
                child: Text(
                  'Logout',
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
