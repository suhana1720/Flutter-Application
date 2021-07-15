import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cart_details extends StatefulWidget {
  @override
  _Cart_detailsState createState() => _Cart_detailsState();
}

class _Cart_detailsState extends State<Cart_details> {
  var products_on_the_cart = [ // key nd map used for helping in firebase
  {
  "name": "Blazer",
  "picture": "images/products/blazer1.jpeg",
  "price": 85,
  "size": "M",
  "color": "Black",
  "quantity":1
},
{
"name": "Shoes",
"picture": "images/products/hills1.jpeg",
"price": 50,
"size": "7",
"color": "Red",
"quantity": 1,
},
{
"name": "Blazer",
"picture": "images/products/blazer1.jpeg",
"price": 85,
"size": "M",
"color": "Black",
"quantity": 1,
},
{
"name": "Shoes",
"picture": "images/products/hills1.jpeg",
"price": 50,
"size": "7",
"color": "Red",
"quantity": 1,
},
];

@override
Widget build(BuildContext context) {
  return ListView.builder(
      itemCount: products_on_the_cart.length,
      itemBuilder: (context, index) {
        return new Single_Cart_Product(
          cart_prod_name: products_on_the_cart[index]["name"],
          cart_prod_picture: products_on_the_cart[index]["picture"],
          cart_prod_color: products_on_the_cart[index]["color"],
          cart_prod_price: products_on_the_cart[index]["price"],
          cart_prod_size: products_on_the_cart[index]["size"],
          cart_prod_qty: products_on_the_cart[index]["quantity"],
        );
      });
}}

class Single_Cart_Product extends StatelessWidget {
  final cart_prod_name;
  final cart_prod_picture;
  final cart_prod_size;
  final cart_prod_color;
  final cart_prod_price;
  final cart_prod_qty;

  Single_Cart_Product({
    this.cart_prod_name,
    this.cart_prod_picture,
    this.cart_prod_size,
    this.cart_prod_color,
    this.cart_prod_price,
    this.cart_prod_qty,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        // ===========leading section
        leading: new Image.asset(cart_prod_picture, width: 80.0,
          height: 80.0,),

        //=============title section
        title: new Text(cart_prod_name),

        //============subtitle section
        subtitle: new Column(
          children: <Widget>[
            // ROW INSIDE COLUMN
            new Row(
              children: <Widget>[
                // this sec is for the size of product
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text("Size:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    cart_prod_size, style: TextStyle(color: Colors.red),),
                ),

                //-----------this sec is for color
                new Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 8.0, 8.0, 8.0),
                  child: new Text("Color:"),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: new Text(
                    cart_prod_color, style: TextStyle(color: Colors.red),),
                ),
              ],
            ),

            //---------this sec for prod price
            new Container(
              alignment: Alignment.topLeft,
              child: new Text("\$${cart_prod_price}",
                style: TextStyle(
                  fontSize: 17.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),),

            ),
          ],
        ),
        trailing: new Column(
          children: <Widget>[
            new IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_up)),
            new Text("$cart_prod_qty"),
            // here text is for integer therefore for including int we use $
            new IconButton(onPressed: () {}, icon: Icon(Icons.arrow_drop_down)),
          ],
        ),
      ),
    );
  }
}

