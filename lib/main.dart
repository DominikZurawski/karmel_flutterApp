import 'package:flutter/material.dart';
import 'package:karmel_app/globals.dart' as globals;
import 'package:karmel_app/home.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:karmel_app/theme/Styles.dart';

import 'package:karmel_app/GraphQL/karmel_model.dart';
import 'package:karmel_app/theme/color_loader_2.dart';
import 'package:karmel_app/GraphQL/constants.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'dart:ui';
import 'dart:developer';

import 'dart:convert';



void main() {
  globals.focusedDay = DateTime.now();
  globals.selectedDay = globals.focusedDay;
  initializeDateFormatting().then((_) => runApp(MyApp()));

}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink = HttpLink(
      kParseApiUrl,
      defaultHeaders: {
        "X-Parse-Application-Id": kParseApplicationId,
        'X-Parse-Client-Key': kParseClientKey,
        'X-Parse-REST-API-Key': kParseRestApiKey
      }, //getheaders()
    );

    ValueNotifier<GraphQLClient> client = ValueNotifier(
      GraphQLClient(
        cache: GraphQLCache(),//InMemoryCache(),
        link: httpLink,
      ),
    );


    return MaterialApp(
      theme: Styles.themeData(false, context),
      debugShowCheckedModeBanner: false,
      home: GraphQLProvider(
        child: CacheProvider(
          child: Home(),
        ),
        client: client,
      ),
    );
  }
}
