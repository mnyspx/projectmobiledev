import 'package:flutter/material.dart';
import 'package:projectmobile/account.dart';
import 'package:projectmobile/notification.dart';
import 'package:projectmobile/search.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
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
            Tab(
              icon: Icon(Icons.notifications, color: Colors.grey, size: 45),
            ),
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
              color: Color.fromRGBO(255,248,220, 0.5),
              child: Padding(
                padding: const EdgeInsets.all(40.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Campsite',
                          style: TextStyle(
                              fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Suggestions',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/campInfo');
                      },
                      child: Container(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30.0),
                          child: Image.asset(
                            'assets/images/30.jpg',
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 35,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Column(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset(
                                'assets/images/33.jpg',
                                width: 230,
                              ),
                            ),
                            Text(
                              'Campsite 1',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset('assets/images/38.jpg',
                                    width: 230)),
                            Text(
                              'Campsite 3',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset('assets/images/34.jpg',
                                    width: 230)),
                            Text(
                              'Campsite 5',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 30,
                        ),
                        Column(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset('assets/images/39.jpg',
                                    width: 230)),
                            Text(
                              'Campsite 2',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset('assets/images/40.jpg',
                                    width: 230)),
                            Text(
                              'Campsite 4',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            ClipRRect(
                                borderRadius: BorderRadius.circular(30.0),
                                child: Image.asset('assets/images/35.jpg',
                                    width: 230)),
                            Text(
                              'Campsite 6',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            // 2 Tab Content
            Container(
              child: Notifications(),
              // color: Colors.blue,
            ),
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
}
