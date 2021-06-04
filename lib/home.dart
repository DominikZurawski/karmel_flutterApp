import 'package:flutter/material.dart';
import 'package:karmel_app/constants/constants.dart';
import 'package:karmel_app/calendar.dart';

class Home extends StatefulWidget {
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  int _choice = 0;
  //for saving the index value of selected bottomNavigatinItem
  void selectedTab(index) {
    setState(() {
      _choice = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: CustomScrollView(
          slivers: <Widget>[
            // Add the app bar to the CustomScrollView.
            SliverAppBar(
              // Provide a standard title.
              title: Text('Wody Karmelu'),
              // Allows the user to reveal the app bar if they begin scrolling
              // back up the list of items.
              floating: true,
              // Display a placeholder widget to visualize the shrinking size.
              flexibleSpace: Placeholder(),
              // Make the initial height of the SliverAppBar larger than normal.
              expandedHeight: 200,

              bottom: AppBar(
                backgroundColor: Colors.red,
                toolbarHeight: 64.0,
                actions: <Widget>[
                  //for Search Button
                  IconButton(
                  onPressed: (){
                    // seachSnackbar(context);
                  },
                    icon: Icon(Icons.arrow_back_ios,color: Colors.white,),
                  ),
                  FlatButton(
                    textColor: Colors.white,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Calendar()),
                      );
                    },
                    child: Text("data"),
                    shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
                  ),
                  IconButton(
                    onPressed: (){
                      // seachSnackbar(context);
                    },
                    icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
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

            /*SliverList(
              // Use a delegate to build items as they're scrolled on screen.
              delegate: SliverChildBuilderDelegate(
                // The builder function returns a ListTile with a title that
                // displays the index of the current item.
                    (context, index) => ListTile(title: Text('Item #$index')),
                // Builds 1000 ListTiles
                childCount: 100,
              ),
            ),*/

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
              child: new Icon(Icons.person,color: Colors.white,),
            ),
          ),

          decoration: new BoxDecoration(
            color: Color(0xFF842203),
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