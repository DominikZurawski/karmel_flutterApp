import 'package:flutter/material.dart';
import 'package:karmel_app/globals.dart' as globals;
import 'package:karmel_app/home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:karmel_app/theme/Styles.dart';

void main() {
  globals.focusedDay = DateTime.now();
  globals.selectedDay = globals.focusedDay;
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.themeData(false, context),
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
