//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:karmel_app/bottom_navigation_placeholder/placeholder.dart';
import 'package:karmel_app/constants/constants.dart';
import 'package:karmel_app/calendar.dart';

//import 'package:flutter_firebase/landing.dart';
class Home extends StatefulWidget {
  //for getting the user data from the LoginPage
  /*const Home({
    Key key,
    this.user
  }) : super(key: key);

  final FirebaseUser user;*/
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
  /*final List<Widget> _selectedItem = [
    PlaceholderWidget(Colors.greenAccent),
    PlaceholderWidget(Colors.blue),
  ];*/

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightBlueAccent,
        body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
            top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Hello',
                style: TextStyle(
                color: Colors.white,
                fontSize: 50.0,
                fontWeight: FontWeight.w700,
                ),
            ),
            ],
            ),
          ),
            Expanded(
              child: Container(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
              ),
              ),
              ),
              ),
              ],
              ),


        /*
        appBar: AppBar(
          backgroundColor: Color(0xFFBD3E07),
          title: Text('Wody Karmelu'),
          actions: <Widget>[
            IconButton(
              onPressed: (){
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
              child: Text("Save"),
              shape: CircleBorder(side: BorderSide(color: Colors.transparent)),
            ),
            IconButton(
              onPressed: (){
                // seachSnackbar(context);
              },
              icon: Icon(Icons.arrow_forward_ios,color: Colors.white,),
            ),

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
*/

        //setting the placeHolder Widget
        //body: _selectedItem[_choice],


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
        //
        ///
        ///
        ///
        ///
        // Logout from Account
        ///
        ///
        ///
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
          ///
          ///
          ///
          ///
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