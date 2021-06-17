import 'package:flutter/material.dart';
import 'package:karmel_app/constants/constants.dart';
import 'package:karmel_app/calendar.dart';
import 'package:karmel_app/theme/Styles.dart';
import 'package:karmel_app/globals.dart' as globals;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'notifiers/play_button_notifier.dart';
import 'notifiers/progress_notifier.dart';
import 'notifiers/repeat_button_notifier.dart';
import 'page_manager.dart';
import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

late final PageManager _pageManager;

class _HomeState extends State<Home> {
  int _choice = 0;
  //for saving the index value of selected bottomNavigatinItem
  void selectedTab(index) {
    setState(() {
      _choice = index;
    });
  }

  @override
  void initState() {
    super.initState();
    _pageManager = PageManager();
  }

  @override
  void dispose() {
    _pageManager.dispose();
    super.dispose();
  }

  static  List<Widget> _pages = <Widget>[
    Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Image.asset(
            '/2qOa.gif',
            height: 448,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
          Container(
            height: 448.0,
            child: FittedBox(
            fit: BoxFit.none,
              child: Container(
                width: 250.0,
                height: 250.0,
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.white, width: 2.0)
                ),
                  child: Center(
                    child: AutoSizeText(
                      'Temu kto ma Boga,\n' +
                      'nie brakuje niczego.\n' +
                      'Jedyny Bóg wystarcza.',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 6,
                      style: GoogleFonts.getFont(
                          'Lato',
                          fontSize: 24,
                          color: Colors.white),
                    ),
                  ),
        ),
      ),
    ),
    ]
  ),

    Container(
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
              Text("\nZnam dobrze źródło co tryska i płynie, \n"+
                  "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "Wiem gdzie swe wody ma ten zdrój kryniczny,\n"+
              "Ukryty w głębi tajemnic i wieczny,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "Początku jego nie znam, bo go nie ma,\n"+
              "Lecz wiem, że każdy byt swą mocą trzyma,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "Wiem, że nie może być nic piękniejszego,\n"+
              "Że wszelka piękność pochodzi od Niego,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "Wiem, że w Nim nie ma nic z ziemskich istności,\n"+
              "Że nic nie zrówna Jego wszechmocności,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "Blask jego światła nigdy nie zachodzi,\n"+
              "Bo wszelka światłość od Niego pochodzi,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "A tryskające z niego życia wody\n"+
              "Zraszają otchłań, niebiosa, narody,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "Potok istności w tym źródle wezbrany\n"+
              "W potędze swojej jest niepowstrzymany,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "To wieczne źródło znalazło ukrycie,\n"+
              "W Chlebie Żywota, aby dać nam życie,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "A potok, który od tych dwóch pochodzi,\n"+
              "Żadnej istnością swoją nie przechodzi,\n"+
              "Choć się dobywa wśród nocy.\n"+
              "\n"+
              "I stąd podnosi głos, wzywa stworzenia,\n"+
              "By się syciły w zdrojach Utajenia,\n"+
              "Co się spełniły wśród nocy.\n"+
              " \n"+
              "To jest to źródło, którego pożądam,\n"+
              "To jest Chleb Życia, który tu oglądam,\n"+
              "Choć się dobywa wśród nocy.\n"+
              " \n"+
                 " (Znam dobrze źródło, czyli śpiew duszy cieszącej się poznaniem Boga przez wiarę, św. Jan od Krzyża) \n" )
    ]
        ),
    ),
    Container(
      padding: const EdgeInsets.all(8),
      //height: 500,
      //color: Colors.amber[100],
      child: Column(
              //alignment: Alignment.topCenter,
              //clipBehavior: Clip.hardEdge,
              children: <Widget>[
                Text("\n  " +
                  "Z Twojej tu jestem przyczyny:\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "Boże, mądrości przedwieczna –\n" +
                  "nieprzewyższony Majestat,\n" +
                  "dla duszy łasko łask pełna,\n" +
                  "Bóg, możny, On, w łaskawości –\n" +
                  "schyl się ku wielkiej małości,\n" +
                  "gdy woła słowy czułymi:\n" +
                  "Co pragniesz ze mną uczynić?Twojam, Ty stworzyć mnie chciałeś,\n" +
                  "Twoja, Ty mnie odkupiłeś,\n" +
                  "Twoja, znosiłeś cierpliwie,\n" +
                  "Twoja, bo mnie powołałeś,\n" +
                  "Twoja, wszak na mnie czekałeś\n" +
                  "i drogi mnie nie zmyliły –\n" +
                  "Co pragniesz ze mną uczynić?Cóż, miłosierny nasz Panie,\n" +
                  "czynić ma sługa niegodny?\n" +
                  "Jakie ów grzeszny niewolnik\n" +
                  "ma powierzone zadanie?\n" +
                  "Oto, Najmilszy mój, masz mnie,\n" +
                  "oto przed sobą mnie widzisz:\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "Pragnę Ci dać całą siebie,\n" +
                  "serce Twym dłoniom poruczę,\n" +
                  "ciało me, życie i duszę,\n" +
                  "każde uczucie, pragnienie,\n" +
                  "Miły mój, me odkupienie;\n" +
                  "więc jako swoją mnie przyjmij.\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "Życie – lub śmierci daj dopust,\n" +
                  "zdrowie lub niedomaganie,\n" +
                  "w sławie daj żyć lub niesławie,\n" +
                  "wojnę mi daj albo pokój,\n" +
                  "słabość lub hart – sam wyrokuj –\n" +
                  "zgodnam z sądami Twoimi.\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "Moc albo też poniżenie,\n" +
                  "męstwo mi daj lub przelękłość,\n" +
                  "radość lub niepocieszenie,\n" +
                  "niebo daj – albo daj piekło,\n" +
                  "chłód albo słońca zapiekłość\n" +
                  "Twojam, siłami wszystkimi.\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "Chcesz – mogę być rozmodlona,\n" +
                  "lub mogę nieczuła stać się,\n" +
                  "cna i ku Tobie skłoniona,\n" +
                  "a jeśli nie – oschła raczej.\n" +
                  "Najwyższy w swym Majestacie,\n" +
                  "to tylko pokój mi czyni:\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "W miłości swojej daj zatem\n" +
                  "światło – lub w ciemność je zamień;\n" +
                  "chędogie daj bytowanie\n" +
                  "albo daj głód, niedostatek,\n" +
                  "jasność – lub mrok ponad światem,\n" +
                  "szlakiem wiedź tym albo innym –\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "Z miłości czynu zaniechać?\n" +
                  "Zaniecham, jeśli rozkażesz.\n" +
                  "Jeśli pracować mam wszakże,\n" +
                  "to w trudzie moja pociecha:\n" +
                  "gdzie?, kiedy?, jak? – niech nie czekam!\n" +
                  "Rzeknij mi słowo, Jedyny –\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "Daj mi Kalwarię lub Tabor,\n" +
                  "raj lub pustynię jałową,\n" +
                  "daj Hiobem być – poznać słabość,\n" +
                  "Janem – na piersi Twej głową;\n" +
                  "bujny w winnicy dać owoc\n" +
                  "albo też schnąć – jak zamyślisz.\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "Jak Józef skuty w kajdany\n" +
                  "albo w Egipcie gospodarz,\n" +
                  "Dawid boleśnie skarany\n" +
                  "czy Dawid – władca i mocarz,\n" +
                  "Jonasz, gdy tonąć ma w wodach,\n" +
                  "lub zratowany z głębiny.\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "Milczeć lub odkryć się w słowach,\n" +
                  "mniej dawać plonu lub więcej,\n" +
                  "w prawie oglądać swą nędzę\n" +
                  "lub Ewangelii kosztować,\n" +
                  "cierpieć lub kwitnąć gotowam –\n" +
                  "byleś Ty trwał we mnie żywy.\n" +
                  "Co pragniesz ze mną uczynić?\n" +
                  "\n" +
                  "Z Twojej tu jestem przyczyny:\n" +
                  "Co pragniesz ze mną uczynić?" +
                  "\n   "
              ),
                Image.asset('assets/Teresa.jpg'),
              ]
              )
    ),
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
                      image: AssetImage('assets/Wadi-es-Siah.jpg'),
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
              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              bottom: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: (){
                    globals.selectedDay = globals.selectedDay?.subtract(new Duration(days: 1));
                    setState(() {    });
                  },
                  alignment: Alignment.centerLeft,
                  icon: Icon(Icons.arrow_back_ios,
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
                  child: Text(DateFormat.d('pl_PL').format(globals.selectedDay!).toString() +' '+ DateFormat.MMMM('pl_PL').format(globals.selectedDay!).toString()),
                  shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
                actions: <Widget>[
                  IconButton(
                    onPressed: (){
                      globals.selectedDay = globals.selectedDay?.add(const Duration(days: 1));
                      setState(() {       });
                      // seachSnackbar(context);
                    },
                    alignment: Alignment.centerRight,
                    icon: Icon(Icons.arrow_forward_ios,
                      //color: Colors.white,
                    ),
                  ),
                ],
               ),
              actions: <Widget>[
                //for Search Button
                PopupMenuButton<String>(
                    onSelected: onMenuSelected,
                    itemBuilder:(context){
                      // returning the list of item
                      return Constants.select.map((String choice){
                        //passing the value
                        onMenuSelected(choice);
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    }
                ),
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
          child:  new Drawer(
            child: userDrawer(),
          ),
        ),
        bottomNavigationBar: onBottomNavigation(context), //Bottom Navigation bar
      ),
    );
  }

  // Navigation Drawer
  Widget userDrawer(){
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
          onTap: (){
            _launchURL('https://karmel.pl');
          },
          child: new ListTile(
            title: new Text('Strona Karmelu',style: new TextStyle(
                //color:Color(0xFF842203)
            )),
            leading: new Icon(Icons.home,color: Colors.lightBlue,),
          ),
        ),
        new InkWell(
          onTap: (){
          },
          child: new ListTile(
            title: new Text('Powołania',style: new TextStyle(
                //color:Color(0xFF842203)
            )),
            leading: new Icon(Icons.account_circle,color:Colors.lightBlue ,),
          ),
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            title: new Text('KiD',style: new TextStyle(
                //color:Color(0xFF842203)
            )),
            leading: new Icon(Icons.shopping_basket,color: Colors.lightBlue,),
          ),
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            onTap:(){} ,
            title: new Text('Święci',style: new TextStyle(
                //color:Colors.deepOrange
            )
            ),
            leading: new Icon(Icons.shopping_cart,color: Colors.lightBlue,),
          ),
        ),
        new InkWell(
          onTap: (){
            Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => Calendar()),
            );
          },
          child: new ListTile(
            title: new Text('Kalendarz',style: new TextStyle(
                //color:Colors.deepOrange
                )
            ),
            leading: new Icon(Icons.favorite,color: Colors.lightBlue,),
          ),
        ),

        //Divider of drawer
        new Divider(
          color: Colors.brown,
          height: 4.0,

        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            title: new Text('Ustawienia',style: new TextStyle(
                //color:Colors.deepOrange
            ) ),
            leading: new Icon(Icons.settings,color: Colors.lightBlue,),
          ),
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            title: new Text('Księgarnia',style: new TextStyle(
                //color:Colors.deepOrange
            ),),
            leading: new Icon(Icons.help,color: Colors.lightBlue,),
          ),
        ),
        new InkWell(
          onTap: (){
            //FirebaseAuth.instance.signOut();
            //Navigator.push(
                //context,
                //MaterialPageRoute(
                  //builder: (context)=>LandingPage(),
                //)
            //);
          },
          child: new ListTile(
            title: new Text('Sign out',style: new TextStyle(
                //color:Colors.deepOrange
            ),),
            leading: new Icon(Icons.exit_to_app,color: Colors.lightBlue,),
          ),
        ),
      ],
    );
  }

  //When we select any Popup Menu
  void onMenuSelected(String choice){
    if(choice==Constants.aboutUs){
      print("O nas");
    }else if(choice==Constants.settings){
      print('Ustawienia');
    }
  }

  //for bottom navigationbar
  Widget onBottomNavigation(BuildContext context){
    return BottomNavigationBar(
      //current index will manage wchich element need to be selected
      currentIndex: _choice,
      type: BottomNavigationBarType.shifting,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.bookmark,color: Color(0xFF842203)),
            title: new Text('Kołatka',style: TextStyle(color: Colors.blue))
        ),

        BottomNavigationBarItem(
            icon: Icon(Icons.menu_book,color: Color(0xFF842203)),
            title: new Text('Codziennik',style: TextStyle(color: Colors.blue),)
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_circle,color: Color(0xFF842203)),
            title: new Text('Studnia',style: TextStyle(color: Colors.blue),)
        ),
      ],
      onTap: (index){
        selectedTab(index);
      },
   );
  }
}

_launchURL(String  s) async {
  var url = s;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

class AudioProgressBar extends StatelessWidget {
  const AudioProgressBar({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ProgressBarState>(
      valueListenable: _pageManager.progressNotifier,
      builder: (_, value, __) {
        return ProgressBar(
          progress: value.current,
          buffered: value.buffered,
          total: value.total,
          onSeek: _pageManager.seek,
        );
      },
    );
  }
}

class AudioControlButtons extends StatelessWidget {
  const AudioControlButtons({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 90,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          PlayButton(),
          RepeatButton(),
          //PreviousSongButton(),
          //NextSongButton(),
          //ShuffleButton(),
        ],
      ),
    );
  }
}

class RepeatButton extends StatelessWidget {
  const RepeatButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<RepeatState>(
      valueListenable: _pageManager.repeatButtonNotifier,
      builder: (context, value, child) {
        Icon icon;
        switch (value) {
          case RepeatState.off:
            icon = Icon(Icons.repeat, size: 44.0, color: Colors.grey);
            break;
          case RepeatState.repeatSong:
            icon = Icon(Icons.repeat_one, size: 44.0,);
            break;
          case RepeatState.repeatPlaylist:
            icon = Icon(Icons.repeat, size: 44.0,);
            break;
        }
        return IconButton(
          icon: icon,
          onPressed: _pageManager.onRepeatButtonPressed,
        );
      },
    );
  }
}

class PlayButton extends StatelessWidget {
  const PlayButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ButtonState>(
      valueListenable: _pageManager.playButtonNotifier,
      builder: (_, value, __) {
        switch (value) {
          case ButtonState.loading:
            return Container(
              margin: EdgeInsets.all(8.0),
              width: 44.0,
              height: 44.0,
              child: CircularProgressIndicator(),
            );
          case ButtonState.paused:
            return IconButton(
              icon: Icon(Icons.play_arrow),
              iconSize: 44.0,
              onPressed: _pageManager.play,
            );
          case ButtonState.playing:
            return IconButton(
              icon: Icon(Icons.pause),
              iconSize: 44.0,
              onPressed: _pageManager.pause,
            );
        }
      },
    );
  }
}

/*class NextSongButton extends StatelessWidget {
  const NextSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pageManager.isLastSongNotifier,
      builder: (_, isLast, __) {
        return IconButton(
          icon: Icon(Icons.skip_next),
          onPressed: (isLast) ? null : _pageManager.onNextSongButtonPressed,
        );
      },
    );
  }
}*/

/*class ShuffleButton extends StatelessWidget {
  const ShuffleButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pageManager.isShuffleModeEnabledNotifier,
      builder: (context, isEnabled, child) {
        return IconButton(
          icon: (isEnabled)
              ? Icon(Icons.shuffle)
              : Icon(Icons.shuffle, color: Colors.grey),
          onPressed: _pageManager.onShuffleButtonPressed,
        );
      },
    );
  }
}*/
/*class PreviousSongButton extends StatelessWidget {
  const PreviousSongButton({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<bool>(
      valueListenable: _pageManager.isFirstSongNotifier,
      builder: (_, isFirst, __) {
        return IconButton(
          icon: Icon(Icons.skip_previous),
          onPressed:
          (isFirst) ? null : _pageManager.onPreviousSongButtonPressed,
        );
      },
    );
  }
}*/