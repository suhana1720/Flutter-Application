import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fashion_shop/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

class _ProductsState extends State<Products> {
  var product_list = [ // key nd map used for helping in firebase
    {
      "name": "Blazer",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Hills",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "Women Blazer",
      "picture": "images/products/blazer2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red hills",
      "picture": "images/products/hills2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Pant",
      "picture": "images/products/pants1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Jeans",
      "picture": "images/products/pants2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Shoes",
      "picture": "images/products/shoe1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Flowery Skit",
      "picture": "images/products/skt1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Skit",
      "picture": "images/products/skt2.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Red dress",
      "picture": "images/products/dress1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Pant",
      "picture": "images/products/pants1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "Pant",
      "picture": "images/products/pants2.jpeg",
      "old_price": 120,
      "price": 85,
    },


  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: Single_prod(
              prod_name: product_list[index]['name'],
              prod_picture: product_list[index]['picture'],
              prod_old_price: product_list[index]['old_price'],
              prod_price: product_list[index]['price'],
            ),
          );
        });
  }
}

class Single_prod extends StatelessWidget {
  // variables used in this class
  final prod_name;
  final prod_picture;
  final prod_old_price;
  final prod_price;

  Single_prod({
    this.prod_name,
    this.prod_picture,
    this.prod_old_price,
    this.prod_price
  });

  @override
  Widget build(BuildContext context) {
    return Card(
          child: Material(
            child: InkWell(onTap: () =>
                Navigator.of(context).push(
                    new MaterialPageRoute(builder: (context) =>
                    new ProductDetails(
                      product_detail_name: prod_name,
                      product_detail_old_price: prod_old_price,
                      product_detail_new_price: prod_price,
                      product_detail_picture: prod_picture,
                    ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white,
                    child:ListTile(
                      title:Text(
                      prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  trailing: Text("\$${prod_price}",
                    style: TextStyle(
                      color: Colors.deepOrange, fontSize: 20, fontWeight: FontWeight.w800),),
                  ),
              ),
                  child: Image.asset(
                    prod_picture,
                    fit: BoxFit.cover,)),

            ),
          ),
    );
  }
}
