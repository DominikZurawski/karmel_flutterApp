import 'package:flutter/material.dart';
import 'package:karmel_app/globals.dart' as globals;

// ignore: non_constant_identifier_names
Widget flexible_bar(BuildContext context) {
  return FlexibleSpaceBar(
      background: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(globals.silverbarImage),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          padding: EdgeInsets.all(16.0),
          alignment: Alignment.topCenter,
          child: Text(
            'Wody Karmelu',
            style: TextStyle(color: Colors.white, fontSize: 20.0),
          ),
        ),
      ),
    );
}