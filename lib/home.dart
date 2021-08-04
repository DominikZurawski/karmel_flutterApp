import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:karmel_app/constants/constants.dart';
import 'package:karmel_app/calendar.dart';
import 'package:karmel_app/theme/Styles.dart';
import 'package:karmel_app/globals.dart' as globals;
import 'package:intl/intl.dart';
import 'package:karmel_app/theme/color_loader_2.dart';
import 'package:karmel_app/widget/flexible_sliver.dart';
import 'package:karmel_app/widget/popup_menu.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'GraphQL/SharedPreferencesHelper.dart';
import 'GraphQL/karmel_model.dart';
//import 'GraphQL/query.dart';
import 'page_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:karmel_app/bottomNavigation.dart';
import 'package:karmel_app/userDrawer.dart';
import 'package:karmel_app/GraphQL/SharedPreferencesHelper.dart';


class Home  extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String name;
  late String saveFormat;
  late String objectId;
  late SharedPreferences sharedPrefs;

  int _choice = 0; //for saving the index value of selected bottomNavigatinItem
  void selectedTab(index) {
    setState(() {
      _choice = index;
    });
  }


  Future<void> _getPrefs() async {
    sharedPrefs = await SharedPreferences.getInstance();
  }

  @override
  void initState() {
    super.initState();

    globals.pageManager = PageManager();

    globals.controller = YoutubePlayerController(
      initialVideoId: (YoutubePlayer.convertUrlToId(
          globals.videoUrl))!, //globals.ids.first,
      flags: const YoutubePlayerFlags(
        mute: false,
        autoPlay: true,
        disableDragSeek: false,
        loop: false,
        isLive: false,
        forceHD: false,
        enableCaption: true,
      ),
    )
      ..addListener(listener);
    globals.idController = TextEditingController();
    globals.seekToController = TextEditingController();
    globals.videoMetaData = const YoutubeMetaData();
    globals.playerState = PlayerState.unknown;
  }

  void listener() {
    if (globals.isPlayerReady &&
        mounted &&
        !globals.controller!.value.isFullScreen) {
      setState(() {
        globals.playerState = globals.controller!.value.playerState;
        globals.videoMetaData = globals.controller!.metadata;
      });
    }
  }

  @override
  void deactivate() {
    // Pauses video while navigating to next page.
    globals.controller!.pause();
    super.deactivate();
  }

  @override
  void dispose() {
    globals.pageManager!.dispose();
    globals.controller!.dispose();
    globals.idController!.dispose();
    globals.seekToController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    dynamic query = '''
        query  {
        karmel_apps(
          where: {
            Date: { equalTo: "''' +
        DateFormat('yyyy-MM-dd').format(globals.selectedDay!) +
        '''" } 
          },
          order: Date_ASC
        ) {
          count
          edges {
            cursor
            node {
                id
                Date
                Sentencja
                kolatka_obraz

            }
          }
        }
      }
        ''';

    /*return MaterialApp(
      theme: Styles.themeData(false, context),
      debugShowCheckedModeBanner: false,
      home: Scaffold(*/
    return FutureBuilder<Karmel_appList?>(
        future: SharedPreferencesHelper.getCache(),
        builder: (prefs, snapshot) {
          final offlineData = snapshot.data;
          if (!snapshot.hasError) {
            return SafeArea(
              child: Scaffold(
                  drawer: Container(
                    width: 270,
                    child: new Drawer(
                      child: userDrawer(context),
                    ),
                  ),
                  bottomNavigationBar:
                  onBottomNavigation(context), //Bottom Navigation bar

                  body: Query(


                      options: QueryOptions(
                        document: gql(query),
                      ),
                      builder: (QueryResult result, {
                        FetchMore? fetchMore,
                        Refetch? refetch,
                      }) {
                        final data = result.data == null
                        //globals.data = result.data == null
                            ? offlineData
                            : karmel_appListFromJson(jsonEncode(result.data));
                        if (data == null) {
                          return Center(child: ColorLoader2());
                        } else {
                          // ignore: unnecessary_statements
                          SharedPreferencesHelper.setCache(data);
                          if (result.data == null) {

                            return Center(child: ColorLoader2());
                          } else {

                          }


                          return CustomScrollView(
                            slivers: <Widget>[
                              // Add the app bar to the CustomScrollView.
                              SliverAppBar(
                                flexibleSpace: flexible_bar(context),
                                floating: true,
                                expandedHeight: 240,
                                pinned: true,
                                brightness: Brightness.dark,
                                backgroundColor: Color(0xFF9C2909),
                                iconTheme: IconThemeData(
                                  color: Colors.white,
                                ),
                                bottom: AppBar(
                                  automaticallyImplyLeading: false,
                                  leading: IconButton(
                                    onPressed: () {
                                      globals.selectedDay = globals
                                          .selectedDay
                                          ?.subtract(new Duration(days: 1));
                                      print(DateFormat('yyyy-MM-dd')
                                          .format(globals.selectedDay!));
                                      setState(() {
                                        //print(data);
                                      });
                                    },
                                    alignment: Alignment.centerLeft,
                                    icon: Icon(
                                      Icons.arrow_back_ios,
                                      //color: Colors.white,
                                    ),
                                  ),
                                  //backgroundColor: Colors.red,
                                  toolbarHeight: 64.0,
                                  centerTitle: true,
                                  title: FlatButton(
                                    //textColor: Colors.white,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Calendar()),
                                      ).then((value) => setState(() => {}));
                                    },
                                    child: Text(DateFormat.d('pl_PL')
                                        .format(globals.selectedDay!)
                                        .toString() +
                                        ' ' +
                                        DateFormat.MMMM('pl_PL')
                                            .format(globals.selectedDay!)
                                            .toString()),
                                    shape: CircleBorder(
                                        side: BorderSide(
                                            color: Colors.transparent)),
                                  ),
                                  actions: <Widget>[
                                    IconButton(
                                      onPressed: () {
                                        globals.selectedDay = globals
                                            .selectedDay
                                            ?.add(const Duration(days: 1));
                                        print(DateFormat('yyyy-MM-dd')
                                            .format(globals.selectedDay!));
                                        setState(() {

                                        });
                                        // seachSnackbar(context);
                                      },
                                      alignment: Alignment.centerRight,
                                      icon: Icon(
                                        Icons.arrow_forward_ios,
                                        //color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                                actions: <Widget>[
                                  //for Search Button
                                  popup_menu(context),
                                ],
                              ),

                              SliverList(
                                //delegate: _pages.elementAt(_choice),
                                // Use a delegate to build items as they're scrolled on screen.
                                delegate: SliverChildBuilderDelegate(
                                  // The builder function returns a ListTile with a title that
                                  // displays the index of the current item.
                                  //(context, index) => ListTile(title: Text('Item #$index')),
                                      (context, index) =>
                                      pages(_choice),
                                  //.elementAt(_choice),

                                  // Builds 1000 ListTiles
                                  childCount: 1,
                                ),

                              ),
                            ],

                            restorationId: queryToGlobals(result),
                          );
                        }
                      }
                  )),
            );
          }
          return Center(
            child: ColorLoader2(),
          );
        });
  }

  //for bottom navigationbar
  Widget onBottomNavigation(BuildContext context) {
    return BottomNavigationBar(
      //current index will manage wchich element need to be selected
      currentIndex: _choice,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark, color: Color(0xFF842203)),
            title: new Text('Kołatka', style: TextStyle(color: Colors.blue))),
        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book, color: Color(0xFF842203)),
            title: new Text(
              'Codziennik',
              style: TextStyle(color: Colors.blue),
            )),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle, color: Color(0xFF842203)),
            title: new Text(
              'Studnia',
              style: TextStyle(color: Colors.blue),
            )),
      ],
      onTap: (index) {
        selectedTab(index);
      },
    );
  }

  queryToGlobals(QueryResult result) {
    print("result.data: ");
    print(result.data); //karmel_apps.edges);

    int index =
        result.data!["karmel_apps"]["edges"].length;
    //print ("index: ");
    //print (index);

    //print("Sentencja: ");
    if (index > 0) {
      globals.kolatkaSentence = result.data!["karmel_apps"]["edges"][index - 1]["node"]['Sentencja'];
      print(result.data!["karmel_apps"]["edges"][index - 1]["node"]['image_kolatka']);
    } else {
      globals.kolatkaSentence = "n/d";
    }
    print(globals.kolatkaSentence);
  }

}
