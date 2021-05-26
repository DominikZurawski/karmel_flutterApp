import 'package:flutter/material.dart';
import 'package:karmel_app/home.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate
      ],
      supportedLocales: [
        const Locale('en'),
        const Locale('pl')
      ],
      locale : const Locale("pl","PL"),
      debugShowCheckedModeBanner: false,
      //home: LandingPage(),
      home: Home(),
    );
  }
}