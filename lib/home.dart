import 'package:flutter/material.dart';
import 'package:karmel_app/constants/constants.dart';
import 'package:karmel_app/calendar.dart';
import 'package:karmel_app/theme/Styles.dart';
import 'package:karmel_app/globals.dart' as globals;
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
//import 'package:just_audio/just_audio.dart';

class Home extends StatefulWidget {


  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
DateTime dats = DateTime.now();
  int _choice = 0;
  //for saving the index value of selected bottomNavigatinItem
  void selectedTab(index) {
    setState(() {
      _choice = index;
    });
  }

  static  List<Widget> _pages = <Widget>[
    Container(
      padding: const EdgeInsets.all(8),
      //height: 50,
     // color: Colors.amber[100],
      child: const Center(child:
            Text("Temu kto ma Boga,\n" +
                 "nie brakuje niczego.\n" +
                 "Jedyny Bóg wystarcza.")
      ),
    ),
    Icon(
      Icons.call,
      size: 150,
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
    /*Icon(
      Icons.chat,
      size: 150,
    ),*/
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
              expandedHeight: 300,
              pinned: true,

              brightness: Brightness.light,
              backgroundColor: Colors.transparent,
              iconTheme: IconThemeData(
                color: Colors.white,
              ),
              //forceElevated: innerBoxIsScrolled,

              bottom: AppBar(
                automaticallyImplyLeading: false,
                leading: IconButton(
                  onPressed: (){
                    globals.selectedDay = globals.selectedDay.subtract(new Duration(days: 1));
                    setState(() {    });
                    // seachSnackbar(context);
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
                  child: Text(DateFormat.d('pl_PL').format(globals.selectedDay).toString() +' '+ DateFormat.MMMM('pl_PL').format(globals.selectedDay).toString()),
                  shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                ),
                actions: <Widget>[
                  //for Search Button


                  IconButton(
                    onPressed: (){
                      globals.selectedDay = globals.selectedDay.add(const Duration(days: 1));
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
        drawer: new Drawer(
          child: userDrawer(),
        ),
        //Bottom Navigation bar
        bottomNavigationBar: onBottomNavigation(context),

      ),
    );
  }

  // Navigation Drawer
  Widget userDrawer(){
    return ListView(
      children: <Widget>[
        new UserAccountsDrawerHeader(

          accountName: new Text('Karmelici Bosi'),
          //accountEmail: new Text(widget.user.email),
          currentAccountPicture: new GestureDetector(
            child: new CircleAvatar(
              backgroundColor: Colors.lightBlue,
              child: new Icon(Icons.person,
                color: Colors.white,
              ),
            ),
          ),

          decoration: new BoxDecoration(
            //color: Color(0xFF8E220B),
          ),
        ),
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
          onTap: (){},
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

        //
        //Divider of drawer
        //

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
            Navigator.push(
                context,
                MaterialPageRoute(
                  //builder: (context)=>LandingPage(),
                )
            );
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