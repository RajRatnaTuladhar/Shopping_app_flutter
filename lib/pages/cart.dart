import "package:flutter/material.dart";
import "package:shopping/components/cart_products.dart";
class cart extends StatefulWidget {
  Map? product;
   cart({Key? key,this.product}) : super(key: key);


  @override
  State<cart> createState() => _cartState();
}

class _cartState extends State<cart> {

  var Products_on_the_cart =[
  {
  "name":"Blazer",
  "picture":"images/product/blazer1.jpeg",
    "current_price":1200,
    "initial_price": 1200,
    "size" : "Medium",
    "quantity": 1,
    "color": "black",

  }

   ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 1,
        backgroundColor: Colors.red,
        title: Text('Shopping app'),
        actions: <Widget>[
          // new IconButton(onPressed: () {}, icon: Icon(Icons.search, color: Colors.white)),
          // new IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart, color: Colors.white))
        ],
      ),
      body: new Cart_products(),

    );
  }
}
