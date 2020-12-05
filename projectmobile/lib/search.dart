import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  void searchResult() {
    setState(() {
      Navigator.pushNamed(context, '/resOfSearch');
    });
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
          children: [
            Text(
              'Search',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              children: [
                Expanded(
                  flex: 9,
                  child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(30.0))),
                        labelText: 'Search',
                        suffixIcon: IconButton(
                            icon: Icon(Icons.search), onPressed: searchResult)),
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
                  'History',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/30.jpg'),
                  radius: 50,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text('Campsite 1',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('4.8/5'),
                      ],
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
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/38.jpg'),
                  radius: 50,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text('Campsite 2',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('4.5/5'),
                      ],
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
                CircleAvatar(
                  backgroundImage: AssetImage('assets/images/34.jpg'),
                  radius: 50,
                ),
                SizedBox(
                  width: 30,
                ),
                Column(
                  children: [
                    Text('Campsite 3',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.yellow,
                        ),
                        Text('4.0/5'),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
