//import 'dart:js';

import 'package:flutter/material.dart';
import 'package:karmel_app/audio.dart';

import 'package:karmel_app/video.dart';
import 'package:karmel_app/globals.dart' as globals;
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

//import 'package:html/html.dart' as h; //"h" can change, is just an example
import 'dart:io' as i; //"i" also can be another char or word, is just an example

//https://www.back4app.com/docs/flutter/parse-sdk/flutter-save-file
Widget pages(int choice) {
  return IndexedStack(
      index: choice,
      //alignment: Alignment.topCenter,
      children: <Widget>[
        Stack(
            alignment: Alignment.center,

            children: <Widget>[
          Image.network(
            globals.kolatkaImage,
            //'/2qOa.gif',
            height: 648,//double.minPositive,//648, //448
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            //Strona kołatka
            height: 448.0,
            child: FittedBox(
              fit: BoxFit.none,
              child: Container(
                width: 250.0,
                height: 250.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0)),
                child: Center(
                  child: AutoSizeText(
                    globals.kolatkaSentence,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 6,
                    style: GoogleFonts.getFont('Lato',
                        fontSize: 24, color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ]),
        //]
        //),
        Container(
          //Strona Codziennik
          padding: const EdgeInsets.all(8),
          //height: 500,
          //color: Colors.amber[100],
          child: Column(
              //alignment: Alignment.topCenter,
              //clipBehavior: Clip.hardEdge,
              children: <Widget>[
                Text('\n'),
                AudioProgressBar(),
                AudioControlButtons(),
                Text(globals.codziennikText)
              ]),
        ),

        Container(
            //Strona Studnia
            padding: const EdgeInsets.all(8),
            //height: 500,
            //color: Colors.amber[100],
            child: Column(
                //alignment: Alignment.topCenter,
                //clipBehavior: Clip.hardEdge,
                children: <Widget>[
                  VideoBar(),
                  Text(
                    globals.studniaText,
                  ),
                  Image.asset(globals.studniaImage),
                ]))
      ]);

//];
}
//}
