import 'dart:async';
import 'dart:convert';
// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class ManageReservation extends StatefulWidget {
  @override
  _ManageReservationState createState() => _ManageReservationState();
}

class _ManageReservationState extends State<ManageReservation> {
  String _urlTranStatus = 'http://10.0.2.2:3000/updateResStatus';
  String _urlReq = 'http://10.0.2.2:3000/reserveReq';

  List dataID;
  var transac;
  List campInfo;

  int campLength = 0;
  int tentLength = 0;

  int start = 0;

  bool isTent = false;
  String tranStatus = 'Camp';

  int cid = 0;
  int resID = 0;
  int clickStatus = 0;

  int cancelStatus = 0;
  int comfirmStatus = 0;

  void loadUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    String jsonUserData = pref.getString('userData');
    if (jsonUserData != null) {
      dataID = jsonDecode(jsonUserData);
      print(
          "this user id : ${dataID[0]['UserID']} \n username : ${dataID[0]['username']}");
    }
  }

  void connectReserveReq() async {
    try {
      http.Response responseShow = await http.post(
        _urlReq,
        body: {
          "uid": dataID[0]['UserID'].toString(),
        },
      ).timeout(Duration(seconds: 10));
      if (responseShow.statusCode == 200) {
        setState(
          () {
            transac = json.decode(responseShow.body);
            campLength = transac.length;
            print('${campLength} /// ${transac.length}');
            // tentLength = transac['tent'].length;
            // print(transac['camp'][0]);
            // print('camp count : $campLength \n tent count : $tentLength');
          },
        );
      }
    } on TimeoutException catch (e) {
      print('Timeout: ' + e.toString());
    } catch (e) {
      print('Error: $e');
    }
  }

  Future selectStatus() async {
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Notification'),
          content: comfirmStatus == 0
              ? Text('Are you sure to cancel this reservation ?')
              : Text('Are you sure to comfirm this reservation ?'),
          actions: [
            FlatButton(
              onPressed: () {
                changeTransac();
                Navigator.of(context).pop();
                refresh();
                // Navigator.pushReplacementNamed(context, '/ownerCancelReserv');
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

  void changeTransac() async {
    try {
      http.Response response = await http.put(
        _urlTranStatus,
        body: {'resID': resID.toString(), 'status': comfirmStatus.toString()},
      ).timeout(Duration(seconds: 10));
      if (response.statusCode == 200) {
        setState(() {
          refresh();
        });
      }
    } on TimeoutException catch (e) {
      print('Timeout: ' + e.toString());
    } catch (e) {
      print('Error: $e');
    }
  }

  void cancelInfo(int value) {
    setState(() {
      resID = transac[value]['Camp_res_ID'];
      clickStatus = transac[value]['status'];
      comfirmStatus = 0;
      // print('camp res id is : $resID \nstatus is : $clickStatus \nrequestor is : ${transac[value]['username']} \n comfirm status : $comfirmStatus');
      selectStatus();
    });
  }

  void confirmInfo(int value) {
    setState(() {
      resID = transac[value]['Camp_res_ID'];
      clickStatus = transac[value]['status'];
      comfirmStatus = 2;
      // print('camp res id is : $resID \nstatus is : $clickStatus \nrequestor is : ${transac[value]['username']} \n comfirm status : $comfirmStatus');
      selectStatus();
    });
  }

  Future<void> refresh() async {
    await Future.delayed(Duration.zero, () {
      setState(() {
        connectReserveReq();
      });
    });
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
  void initState() {
    // TODO: implement initState
    super.initState();
    loadUserData();
    Future.delayed(Duration.zero, () {
      // setState(() {
        connectReserveReq();
      // });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Color.fromRGBO(255, 248, 220, 0.5),
        child: buildServCard(),
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(255, 248, 220, 0.5),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                    'Back',
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

  Widget box() {
    return Container(
      color: Colors.red,
      height: 20,
    );
  }

  Widget headPage() {
    return Container(
      padding: EdgeInsets.all(40),
      width: MediaQuery.of(context).size.width,
      child: Column(
        children: [
          Text(
            'Reservations',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
        ],
      ),
    );
  }

  Widget txtStatus(status) {
    if (status == 0) {
      return Text(
        'Cancel',
        style: TextStyle(
            fontSize: 18, color: Colors.red, fontWeight: FontWeight.bold),
      );
    } else if (status == 1) {
      return Text(
        'Pending',
        style: TextStyle(
            fontSize: 18, color: Colors.orange, fontWeight: FontWeight.bold),
      );
    } else if (status == 2) {
      return Text(
        'Complete',
        style: TextStyle(
            fontSize: 18, color: Colors.green, fontWeight: FontWeight.bold),
      );
    }
  }

  Widget isNoIndex() {
    return start == 0 ? headPage() : box();
  }

  Widget isIndex(int index) {
    return start == index ? headPage() : box();
  }

  Widget recipt(int index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  '${transac[index]['reserveTime']} Status : ',
                  style: TextStyle(fontSize: 18),
                ),
                txtStatus(transac[index]['status']),
              ],
            ),
            Row(
              children: [
                Text(
                  'Requestor : ${transac[index]['username']}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                Expanded(
                  flex: 5,
                  child: Container(
                    child: Text(
                      '${transac[index]['statusService'] == 1 ? 'Tent' : 'Campsite'} : ${transac[index]['Name']}',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  child: Text(
                    '${transac[index]['price']} baht/night',
                    style: TextStyle(fontSize: 18),
                  ),
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
                  '${transac[index]['firstDate']}',
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
                  '${transac[index]['lastDate']}',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Day',
                  style: TextStyle(fontSize: 18),
                ),
                Spacer(),
                Text(
                  '${transac[index]['Day']} day(s)',
                  style: TextStyle(fontSize: 18),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              thickness: 3,
            ),
            // Row(
            //   children: [
            //     Column(
            //       children: [],
            //     ),
            //     Text(
            //       'Contact(for pay cancel etc.)',
            //       style: TextStyle(
            //         fontSize: 18,
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   ],
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: [
            //     Text(
            //       '${transac[index]['contact']}',
            //       style: TextStyle(fontSize: 18),
            //     ),
            //   ],
            // ),
            SizedBox(
              height: 5,
            ),
            // Divider(),
            Row(
              children: [
                Text(
                  'Total',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Spacer(),
                Text(
                  '${transac[index]['price'] * transac[index]['Day']} baht',
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
                    onPressed: transac[index]['status'] == 1
                        ? () => confirmInfo(index)
                        : null,
                    child: Text(
                      'Confirm',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
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
                    onPressed: transac[index]['status'] == 1
                        ? () => cancelInfo(index)
                        : null,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget buildServCard() {
    return campLength == 0 ? headPage() : Container(
      padding: EdgeInsets.all(20),
      child: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          itemCount: campLength,
          itemBuilder: (context, index) {
            return Column(
              children: [
                index == 0 ? headPage():recipt(index),
                SizedBox(
                  height: 20,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
