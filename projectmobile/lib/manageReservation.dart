import 'package:flutter/material.dart';

class ManageReservation extends StatefulWidget {
  @override
  _ManageReservationState createState() => _ManageReservationState();
}

class _ManageReservationState extends State<ManageReservation> {
  Future cancel() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: Text('Are you sure to cancel this reservation ?'),
          actions: [
            FlatButton(
              onPressed: () {
                Navigator.of(context).pop();
                Navigator.pushReplacementNamed(context, '/ownerCancelReserv');
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

  void confirmReserv() {
    setState(() {
      Navigator.pushReplacementNamed(context, '/ownerConfirmReserv');
    });
  }

  void closePage() {
    setState(() {
      Navigator.pop(context);
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
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Reservations',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 30,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '15:36 pm. 5/6/2020 Status : ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Pending',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.orange,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Name : ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Mr.Kotchakorn Denduang',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone Number : ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '0843921679',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Campsite : Sabaidee',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          '200 baht/night',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
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
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ButtonTheme(
                          minWidth: 150,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onPressed: confirmReserv,
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            color: Color.fromRGBO(0, 128, 129, 1),
                            textColor: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        ButtonTheme(
                          minWidth: 150,
                          height: 50,
                          child: RaisedButton(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            onPressed: cancel,
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
            SizedBox(
              height: 20,
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          '15:36 pm. 5/6/2020 Status : ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Cancel',
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Name : ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          'Mr.Kotchakorn Denduang',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Phone Number : ',
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          '0843921679',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          'Campsite : Sabaidee',
                          style: TextStyle(fontSize: 18),
                        ),
                        Spacer(),
                        Text(
                          '200 baht/night',
                          style: TextStyle(fontSize: 18),
                        ),
                      ],
                    ),
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
                    ),
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
                onPressed: closePage,
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
    ));
  }
}
