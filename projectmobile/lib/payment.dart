import 'package:flutter/material.dart';

class Payment extends StatefulWidget {
  @override
  _PaymentState createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  void cancelAdd() {
    Navigator.pop(context);
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
          child: Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Payment',
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Container(
                      width: 450,
                      child: Card(
                        child: Column(
                          children: [
                            Text(
                              'Scan Here',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Image.asset(
                              'assets/images/qr.png',
                              width: 300,
                            ),
                            Text(
                              'Bank account number',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'xxxxxxxxxx',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              width: 350,
                              height: 250,
                              child: Center(
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'Check-In Date',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(
                                          '10/10/2020',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Check-Out Date',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(
                                          '13/10/2020',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Zone',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(
                                          'Mountain',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'No.Place',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(
                                          '2',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Row(
                                      children: [
                                        Text(
                                          'Total',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                        Spacer(),
                                        Text(
                                          '1200 baht',
                                          style: TextStyle(fontSize: 18),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
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
                        onPressed: cancelAdd,
                        child: Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.red,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
