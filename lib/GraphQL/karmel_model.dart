// To parse this JSON data, do
//
//     final karmel_appList = karmel_appListFromJson(jsonString);

import 'dart:convert';

import 'dart:html';

// ignore: non_constant_identifier_names
Karmel_appList karmel_appListFromJson(String str) =>
    Karmel_appList.fromJson(json.decode(str));


// ignore: non_constant_identifier_names
String karmel_appListToJson(Karmel_appList data) =>
    json.encode(data.toJson());


// ignore: camel_case_types
class Karmel_appList {
  Karmel_appList({

    // ignore: non_constant_identifier_names
    required this.karmel_apps,
  });


  // ignore: non_constant_identifier_names
  Karmel_apps karmel_apps;

  factory Karmel_appList.fromJson(Map<String, dynamic> json) =>
      Karmel_appList(
        karmel_apps:
        Karmel_apps.fromJson(json["karmel_apps"]),
      );

  Map<String, dynamic> toJson() => {
    "karmel_apps": karmel_apps.toJson(),
  };
}

// ignore: camel_case_types
class Karmel_apps {
  Karmel_apps({
    required this.edges,
  });

  List<Edge> edges;

  factory Karmel_apps.fromJson(Map<String, dynamic> json) =>
      Karmel_apps(
        edges: List<Edge>.from(json["edges"].map((x) => Edge.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
    "edges": List<dynamic>.from(edges.map((x) => x.toJson())),
  };
}

class Edge {
  Edge({
    required this.node,
  });

  Node node;

  factory Edge.fromJson(Map<String, dynamic> json) => Edge(
    node: Node.fromJson(json["node"]),
  );

  Map<String, dynamic> toJson() => {
    "node": node.toJson(),
  };
}

class Node {
  Node({
    required this.id,
    // ignore: non_constant_identifier_names
    required this.Date,
    // ignore: non_constant_identifier_names
    required this.Sentencja,
    // ignore: non_constant_identifier_names
    required this.image_kolatka,
  });
//w bazie zrobić z małych liter
  String id;
  // ignore: non_constant_identifier_names
  String Date;  //Datetime !!!!!
  // ignore: non_constant_identifier_names
  String Sentencja;
  // ignore: non_constant_identifier_names
  String image_kolatka;
  //String message;

  factory Node.fromJson(Map<String, dynamic> json) => Node(
    id: json["id"],
    Date: json["Date"],
    Sentencja: json["Sentencja"],
    image_kolatka: json['image_kolatka'],
    //message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "Date": Date,
    "Sentencja": Sentencja,
    "image_kolatka": image_kolatka,
    //"message" : message,
  };
}
