import 'package:fashion_shop/provider/user_provider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fashion_shop/components/horizontal_listview.dart';
import 'package:fashion_shop/components/products.dart';
import 'package:fashion_shop/pages/Cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:carousel_pro/carousel_pro.dart';
import 'package:provider/provider.dart';

import 'login.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserProvider>(context);
    Widget image_carousel = new Container( // making object for img
      height: 200.0,
      child: new Carousel(


        boxFit: BoxFit.cover,
        images: [ // square means using list of things used
          AssetImage('images/c1.jpg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/m2.jpg'),
          AssetImage('images/w1.jpeg'),
          AssetImage('images/w3.jpeg'),
          AssetImage('images/w4.jpeg'),
        ],
        autoplay: true,
        //  animationCurve: Curves.fastOutSlowIn,
        //  animationDuration: Duration(milliseconds: 1000),
        dotBgColor: Colors.transparent,
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );
    // this the first widget
    return Scaffold(
      appBar: new AppBar(
        iconTheme: IconThemeData(color: Colors.deepOrange),
        elevation: 1.0,
        backgroundColor: Colors.white,
        title: Material(
            borderRadius: BorderRadius.circular(10.0),
            color: Colors.grey[50],
            elevation: 0.0,
            child: TextFormField(
                    controller: _searchController,
                    decoration: InputDecoration(
                        hintText: "Search...",
                        border: InputBorder.none),   // underline not show
                    validator: (value) {
                      if (value.isEmpty) {
                        return "The search field cannot be empty";
                      }
                      return null;
                    }
                ),

          ),

        actions: <Widget>[
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.deepOrange,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              }),
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.deepOrange,
              ),
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              }),
        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Suhana'),
              accountEmail: Text('suhananisha17@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Icon(Icons.person, color: Colors.white)
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.deepOrange
              ),
            ),
            //body

            InkWell( // this widget is used to convert widget into button
              onTap: () {},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home, color: Colors.red),
              ),
            ),

            InkWell( // this widget is used to convert widget into button
              onTap: () {},
              child: ListTile(
                title: Text('My Account'),
                leading: Icon(Icons.person, color: Colors.red),
              ),
            ),

            InkWell( // this widget is used to convert widget into button
              onTap: () {},
              child: ListTile(
                title: Text('My order'),
                leading: Icon(Icons.shopping_basket, color: Colors.red),
              ),
            ),

            InkWell( // this widget is used to convert widget into button
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart, color: Colors.red),
              ),
            ),

            InkWell( // this widget is used to convert widget into button
              onTap: () {},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite, color: Colors.red,),
              ),
            ),

            Divider(),
            InkWell( // this widget is used to convert widget into button
              onTap: () {},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings),
              ),
            ),

            InkWell( // this widget is used to convert widget into button
              onTap: () {},
              child: ListTile(
                title: Text('Account'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),

            InkWell
              (onTap: () async {
            user.signOut();

            },
              child: ListTile(
                title: Text('Log out'),
              ),
            )
          ],
        ),
      ),
      body: Column(
        children: <Widget>[
          //img carousel begins here
          image_carousel,
          //padding widget
          new Padding(padding: const EdgeInsets.all(4.0),
            child: Container(
                alignment: Alignment.centerLeft,
                child: new Text('Categories')),
          ),
          // horizontal listview
          HorizontalList(),
          // padding widget
          Row(
            children:<Widget> [
              new Padding(padding: const EdgeInsets.all(8.0),
                child: Container(
                    alignment: Alignment.centerLeft,
                    child: new Text('Recent Products')),),
            ],
          ),
          // grid view
          Flexible(child: Products(),),

        ],

      ),

    );}
}