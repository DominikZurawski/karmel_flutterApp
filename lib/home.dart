import 'dart:html';

import 'package:flutter/material.dart';
import 'package:karmel_app/constants/constants.dart';
import 'package:karmel_app/calendar.dart';
import 'package:karmel_app/theme/Styles.dart';
import 'package:karmel_app/globals.dart' as globals;
import 'package:intl/intl.dart';

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

    Icon(
      Icons.call,
      size: 150,
    ),
    Container(
      padding: const EdgeInsets.all(8),
      //height: 50,
     // color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
    ),
    Container(
      height: 50,
      color: Colors.amber[100],
      child: const Center(child: Text('Entry C')),
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
                      //style: TextStyle(color: Colors.white, fontSize: 26.0),
                    ),
                  ),
                ),
              ),

              floating: true,
              expandedHeight: 300,
              pinned: true,
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
            color: Color(0xFF8E220B),
          ),
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            title: new Text('Strona Karmelu',style: new TextStyle(color:Color(0xFF842203))),
            leading: new Icon(Icons.home,color: Colors.lightBlue,),
          ),
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            title: new Text('Powołania',style: new TextStyle(color:Color(0xFF842203))),
            leading: new Icon(Icons.account_circle,color:Colors.lightBlue ,),
          ),
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            title: new Text('KiD',style: new TextStyle(color:Color(0xFF842203))),
            leading: new Icon(Icons.shopping_basket,color: Colors.lightBlue,),
          ),
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            onTap:(){} ,
            title: new Text('Święci',style: new TextStyle(color:Colors.deepOrange)),
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
            title: new Text('Kalendarz',style: new TextStyle(color:Colors.deepOrange)),
            leading: new Icon(Icons.favorite,color: Colors.lightBlue,),

          ),
        ),

        //
        //Divider of drawer
        //

        new Divider(
          color: Colors.red,
          height: 4.0,
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            title: new Text('Ustawienia',style: new TextStyle(color:Colors.deepOrange)),
            leading: new Icon(Icons.settings,color: Colors.lightBlue,),
          ),
        ),
        new InkWell(
          onTap: (){},
          child: new ListTile(
            title: new Text('Księgarnia',style: new TextStyle(color:Colors.deepOrange),),
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
            title: new Text('Sign out',style: new TextStyle(color:Colors.deepOrange),),
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