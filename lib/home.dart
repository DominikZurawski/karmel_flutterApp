import 'package:flutter/material.dart';
import 'package:karmel_app/constants/constants.dart';
import 'package:karmel_app/calendar.dart';
import 'package:karmel_app/theme/Styles.dart';
import 'package:karmel_app/audio.dart';
import 'package:karmel_app/video.dart';
import 'package:karmel_app/globals.dart' as globals;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'page_manager.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
//import 'package:flutter/cupertino.dart';
//import 'package:flutter/rendering.dart';
//import 'package:flutter/services.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _choice = 0; //for saving the index value of selected bottomNavigatinItem
  void selectedTab(index) {
    setState(() {
      _choice = index;
    });
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
    )..addListener(listener);
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

  static List<Widget> _pages = <Widget>[
    Stack(alignment: Alignment.center, children: <Widget>[
      Image.network(
        globals.kolatkaImage,
        //'/2qOa.gif',
        height: 448,
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
            ])),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: Styles.themeData(false, context),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            // Add the app bar to the CustomScrollView.
            SliverAppBar(
              flexibleSpace: FlexibleSpaceBar(
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
              ),
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
                    globals.selectedDay =
                        globals.selectedDay?.subtract(new Duration(days: 1));
                    setState(() {});
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
                      MaterialPageRoute(builder: (context) => Calendar()),
                    ).then((value) => setState(() => {}));
                  },
                  child: Text(DateFormat.d('pl_PL')
                          .format(globals.selectedDay!)
                          .toString() +
                      ' ' +
                      DateFormat.MMMM('pl_PL')
                          .format(globals.selectedDay!)
                          .toString()),
                  shape:
                      CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: () {
                      globals.selectedDay =
                          globals.selectedDay?.add(const Duration(days: 1));
                      setState(() {});
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
                PopupMenuButton<String>(
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
                    }),
              ],
            ),
            SliverList(
              //delegate: _pages.elementAt(_choice),
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                //(context, index) => ListTile(title: Text('Item #$index')),
                (context, index) => _pages.elementAt(_choice),
                // Builds 1000 ListTiles
                childCount: 1,
              ),
            ),
          ],
        ),
        // For Drawer
        drawer: Container(
          width: 270,
          child: new Drawer(
            child: userDrawer(),
          ),
        ),
        bottomNavigationBar:
            onBottomNavigation(context), //Bottom Navigation bar
      ),
    );
  }

  // Navigation Drawer
  Widget userDrawer() {
    return ListView(
      children: <Widget>[
        //
        new UserAccountsDrawerHeader(
          accountName: new Text('Karmelici Bosi'),
          accountEmail: new Text(''),
          currentAccountPicture: new GestureDetector(
            child: new CircleAvatar(
              //backgroundColor: Colors.lightBlue,
              child: new Image.asset(
                'ikona.png',
              ),
            ),
          ),
          decoration: new BoxDecoration(

              //color: Color(0xFF8E220B),
              ),
        ),
        //
        new InkWell(
          onTap: () {
            _launchURL('https://karmel.pl');
          },
          child: new ListTile(
            title: new Text('Strona Karmelu',
                style: new TextStyle(
                    //color:Color(0xFF842203)
                    )),
            leading: new Icon(
              Icons.home,
              color: Colors.lightBlue,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title: new Text('Powołania',
                style: new TextStyle(
                    //color:Color(0xFF842203)
                    )),
            leading: new Icon(
              Icons.account_circle,
              color: Colors.lightBlue,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title: new Text('KiD',
                style: new TextStyle(
                    //color:Color(0xFF842203)
                    )),
            leading: new Icon(
              Icons.shopping_basket,
              color: Colors.lightBlue,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            onTap: () {},
            title: new Text('Święci',
                style: new TextStyle(
                    //color:Colors.deepOrange
                    )),
            leading: new Icon(
              Icons.shopping_cart,
              color: Colors.lightBlue,
            ),
          ),
        ),
        new InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => Calendar()),
            );
          },
          child: new ListTile(
            title: new Text('Kalendarz',
                style: new TextStyle(
                    //color:Colors.deepOrange
                    )),
            leading: new Icon(
              Icons.favorite,
              color: Colors.lightBlue,
            ),
          ),
        ),

        //Divider of drawer
        new Divider(
          color: Colors.brown,
          height: 4.0,
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title: new Text('Ustawienia',
                style: new TextStyle(
                    //color:Colors.deepOrange
                    )),
            leading: new Icon(
              Icons.settings,
              color: Colors.lightBlue,
            ),
          ),
        ),
        new InkWell(
          onTap: () {},
          child: new ListTile(
            title: new Text(
              'Księgarnia',
              style: new TextStyle(
                  //color:Colors.deepOrange
                  ),
            ),
            leading: new Icon(
              Icons.help,
              color: Colors.lightBlue,
            ),
          ),
        ),
        new InkWell(
          onTap: () {
            //FirebaseAuth.instance.signOut();
            //Navigator.push(
            //context,
            //MaterialPageRoute(
            //builder: (context)=>LandingPage(),
            //)
            //);
          },
          child: new ListTile(
            title: new Text(
              'Sign in',
              style: new TextStyle(
                  //color:Colors.deepOrange
                  ),
            ),
            leading: new Icon(
              Icons.exit_to_app,
              color: Colors.lightBlue,
            ),
          ),
        ),
      ],
    );
  }

  //When we select any Popup Menu
  void onMenuSelected(String choice) {
    if (choice == Constants.aboutUs) {
      //print("O nas");
    } else if (choice == Constants.settings) {
      //print('Ustawienia');
    }
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
}

_launchURL(String s) async {
  var url = s;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
