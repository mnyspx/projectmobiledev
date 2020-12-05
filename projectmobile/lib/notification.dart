import 'package:flutter/material.dart';

class Notifications extends StatefulWidget {
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color.fromRGBO(255,248,220, 0.5),
      child: Padding(
        padding: const EdgeInsets.all(40.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Notifications',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'John reserved your campsite',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Card(
                      color: Colors.yellow[500],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'New',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'John reserved your campsite',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Card(
                      color: Colors.yellow[500],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'New',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'John reserved your campsite',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                    Spacer(),
                    Card(
                      color: Colors.yellow[500],
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'New',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'John reserved your campsite',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'John reserved your campsite',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'John reserved your campsite',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Icon(
                      Icons.person,
                      size: 60,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'John reserved your campsite',
                      style: TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
