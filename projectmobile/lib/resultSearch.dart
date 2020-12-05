import 'package:flutter/material.dart';

class ResultSearch extends StatefulWidget {
  @override
  _ResultSearchState createState() => _ResultSearchState();
}

class _ResultSearchState extends State<ResultSearch> {
   void searchResult() {
    setState(() {
      Navigator.pushReplacementNamed(context, '/resOfSearch');
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
                            suffixIcon: IconButton(icon: Icon(Icons.search), onPressed: searchResult),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(30.0))),
                              labelText: 'Chiang Rai'),
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(
                        children: [
                          InkWell(
                            onTap: () {
                        Navigator.pushReplacementNamed(context, '/rentInfo');
                      },
                                                      child: Container(
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(30.0),
                                  child: Image.asset('assets/images/08.jpg',
                                      width: 230)),
                            ),
                          ),
                          Text(
                            'Result 1',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset('assets/images/03.jpg',
                                  width: 230)),
                          Text(
                            'Result 3',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset('assets/images/02.jpg',
                                  width: 230)),
                          Text(
                            'Result 5',
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
                              child: Image.asset('assets/images/38.jpg',
                                  width: 230)),
                          Text(
                            'Result 2',
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
                            'Result 4',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          ClipRRect(
                              borderRadius: BorderRadius.circular(30.0),
                              child: Image.asset('assets/images/39.jpg',
                                  width: 230)),
                          Text(
                            'Result 6',
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),),);
  }
}
