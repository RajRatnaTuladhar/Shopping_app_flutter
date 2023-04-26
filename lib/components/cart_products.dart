import "package:flutter/material.dart";
import 'package:shopping/components/buy_now.dart';

import '../main.dart';
class Cart_products extends StatefulWidget {
   Cart_products({Key? key}) : super(key: key);
  Map? product;
  @override
  State<Cart_products> createState() => _Cart_productsState();
}

class _Cart_productsState extends State<Cart_products> {
  var Products_on_the_cart =[
  {
  "name":"Blazer",
  "picture":"images/product/blazer1.jpeg",
    "current_price":1200,
    "initial_price": 1200,
    "size" : "Medium",
    "quantity": 1,
    "color": "black",

  },


  ];
  @override

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Products_on_the_cart. isEmpty?
          Center(
            child: Text("Cart is empty"),
          ):

      ListView.builder(
        itemCount: Products_on_the_cart.length,
          itemBuilder: (context, index){
         return Single_cart_product(
           cart_product_name: Products_on_the_cart[index]["name"],
           cart_product_pic: Products_on_the_cart[index]["picture"],
           cart_product_current_price: Products_on_the_cart[index]["current_price"],
           cart_product_size: Products_on_the_cart[index]["size"],
           cart_product_quantity: Products_on_the_cart[index]["quantity"],
           cart_product_color: Products_on_the_cart[index]["color"],
           cart_initial_price: Products_on_the_cart[index]["initial_price"],
         );

          }
      ),
      bottomNavigationBar: new Container(
        color: Colors.white,
        child: Row(
          children: <Widget>[
            Expanded(child: ListTile(
              // title: new Text("Total"),
              subtitle: new Text(""),
            )),
            Expanded(
                child: MaterialButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>buy_now()));

                  },
                  child: new Text("Buynow", style:TextStyle(color: Colors.white),),
                  color: Colors.red,
                )),

          ],
        ),
      ),
    );
  }
}
class Single_cart_product extends StatefulWidget {
  final cart_product_name;
  final cart_product_pic;
  var cart_product_current_price;
  final cart_product_size;
  final cart_product_quantity;
  final cart_product_color;
  final cart_initial_price;
  Single_cart_product({
    this.cart_product_name,
    this.cart_product_pic,
    this.cart_product_current_price,
    this.cart_product_size,
    this.cart_product_quantity,
    this.cart_product_color,
    this.cart_initial_price,
  }
      );

  @override
  State<Single_cart_product> createState() => _Single_cart_productState();
}

class _Single_cart_productState extends State<Single_cart_product> {
  var counter = 1;
  @override
  Widget build(BuildContext context) {

    return Card(
      child: ListTile(
        contentPadding: EdgeInsets.all(15.0),
        leading: new Image.asset(widget.cart_product_pic, width: 80.0, height: 80.0,),
        title: new Text(widget.cart_product_name),
        subtitle: new Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(padding: EdgeInsets.all(0.0),
                child: new Text("Size:"),
                ),
                Padding(padding: EdgeInsets.all(4.0),
                child: new Text(widget.cart_product_size),),
                Padding(padding: EdgeInsets.fromLTRB(20.0, 8.0, 4.0, 4.0),
                child: new Text("Color:"),),
                Padding(padding: EdgeInsets.all(4.0),
                child: new Text(widget.cart_product_color),),
              ],
            ),
            new Container(
              alignment: Alignment.topLeft,
              child: new Text("${widget.cart_product_current_price}",
              style: TextStyle(color: Colors.red, fontSize: 17.0, fontWeight: FontWeight.bold
              ),
              ),
            ),

          ],
        ),

        trailing: new Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
              child: new IconButton(onPressed: (){
              setState(() {
                counter++;

                setState(() {
                  widget.cart_product_current_price = widget.cart_product_current_price + widget.cart_initial_price;
                });
              });
              }, icon: Icon(Icons.arrow_drop_up),

              ),
              flex: 2,
            ),
            Expanded(child: Text("$counter"),
            flex: 2,
            ),
            Expanded(child: IconButton(onPressed: (){
             if(counter > 1)
               {

                 setState(() {
                   counter--;
                   setState(() {
                     widget.cart_product_current_price = widget.cart_product_current_price-widget.cart_initial_price;
                   });
                 });
               }
            }, icon: Icon(Icons.arrow_drop_down)),
            flex: 1,
            ),
          ],
        ),


      ),
    );

  }
}


