import 'package:flutter/material.dart';
import 'package:karmel_app/constants/constants.dart';
import 'package:karmel_app/globals.dart' as globals;

//When we select any Popup Menu
void onMenuSelected(String choice) {
  if (choice == Constants.aboutUs) {
    //print("O nas");
  } else if (choice == Constants.settings) {
    //print('Ustawienia');
  }
}

// ignore: non_constant_identifier_names
Widget popup_menu(BuildContext context) {
  return PopupMenuButton<String>(
      onSelected: onMenuSelected,
      itemBuilder: (context) {
        // returning the list of item
        return Constants.select.map((String choice) {
          //passing the value
          onMenuSelected(choice);
          return PopupMenuItem<String>(
            value: choice,
            child: Text(choice),
          );
        }).toList();
      });
}