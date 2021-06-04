import 'package:flutter/material.dart';
import 'package:karmel_app/home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:karmel_app/theme/Styles.dart';

void main() {
  initializeDateFormatting().then((_) => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
      theme: Styles.themeData(false, context),
    );
  }
}