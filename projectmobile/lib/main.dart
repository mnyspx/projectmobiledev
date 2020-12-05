import 'package:flutter/material.dart';
import 'package:projectmobile/AddNewRental.dart';
import 'package:projectmobile/account.dart';
import 'package:projectmobile/addNewCamp.dart';
import 'package:projectmobile/campsiteInfo.dart';
import 'package:projectmobile/customercancelReservation.dart';
import 'package:projectmobile/createAccount.dart';
import 'package:projectmobile/editAccount.dart';
import 'package:projectmobile/editCampsiteInfo.dart';
import 'package:projectmobile/editRentalInfo.dart';
import 'package:projectmobile/login.dart';
import 'package:projectmobile/mainpage.dart';
import 'package:projectmobile/manageArea.dart';
import 'package:projectmobile/manageReservation.dart';
import 'package:projectmobile/notification.dart';
import 'package:projectmobile/openNewArea.dart';
import 'package:projectmobile/ownercancelReservation.dart';
import 'package:projectmobile/ownerconfirmReservation.dart';
import 'package:projectmobile/payment.dart';
import 'package:projectmobile/rentalTentInfo.dart';
import 'package:projectmobile/resultSearch.dart';
import 'package:projectmobile/search.dart';

import 'transaction.dart';

void main() {
  runApp(
    MaterialApp(
      theme: ThemeData(fontFamily: 'Montserrat'),
      initialRoute: '/login',
      routes: {
        '/login': (context) => Login(),
        '/register': (context) => CreateAccount(),
        '/mainpage': (context) => MainPage(),
        '/search': (context) => SearchPage(),
        '/resOfSearch': (context) => ResultSearch(),
        '/campInfo': (context) => CampsiteInfo(),
        '/rentInfo': (context) => RentalInfo(),
        '/payment': (context) => Payment(),
        '/history': (context) => History(),
        '/noti': (context) => Notifications(),
        '/accPage': (context) => Account(),
        '/manageArea': (context) => ManageArea(),
        '/addCamp': (context) => AddNewCampsite(),
        '/addRent': (context) => AddNewRental(),
        '/opennewArea': (context) => OpenNewArea(),
        '/editCamp': (context) => EditCampInfo(),
        '/editRent': (context) => EditRentInfo(),
        '/editAccount': (context) => EditAccount(),
        '/cancelReservation': (context) => CancelReservation(),
        '/ownerCancelReserv': (context) => OwnerCancelReservation(),
        '/ownerConfirmReserv': (context) => OwnerConfirmReserv(),
        '/manageReserv': (context) => ManageReservation(),
      },
    ),
  );
}
