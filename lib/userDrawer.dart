import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:karmel_app/calendar.dart';

// Navigation Drawer
Widget userDrawer(BuildContext context) {
  return ListView(
    children: <Widget>[
      //
      /*new UserAccountsDrawerHeader(
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
        ),*/
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
        onTap: () {
          _launchURL('https://www.karmel.pl/powolania/');
        },
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
        onTap: () {
          _launchURL('https://www.karmel.pl/instytucje/karmelitanski-instytut-duchowosci/');
        },
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

_launchURL(String s) async {
  var url = s;
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}