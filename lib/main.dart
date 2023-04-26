import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
//self imported files
import 'package:shopping/components/categories.dart';
import 'package:shopping/components/products.dart';
import 'package:shopping/components/sidebar.dart';
import 'package:shopping/components/login.dart';
import 'package:shopping/pages/cart.dart';
import 'package:shopping/category/bag.dart';
void main()
{
  ProductData pd = ProductData();

  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,

      //home: sidebar(),
      home: Login(),
      // home: HomePage(),
      //home: bag(),
      // home: Cart(),
      // home: Register(),


    )
  );
}
class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Widget image_carousel = new Container(
      height: 200.0,
      child: new Carousel(
        boxFit: BoxFit.cover ,
        images: [
          AssetImage('images/product/shoe.jpg'),

          AssetImage('images/product/b1.jpg'),

          AssetImage('images/product/j1.jpg'),
          AssetImage('images/product/ja1.jpg'),
          AssetImage('images/product/s1.jpg'),
          AssetImage('images/product/t3.jpg'),
        ],
        autoplay: true,
        animationCurve: Curves.fastOutSlowIn ,
        animationDuration: Duration(milliseconds: 1),
        dotSize: 5,
        dotColor: Colors.red,
        indicatorBgPadding: 3.0,
        dotBgColor: Colors.transparent,
      ),
    );
    return Scaffold(
      appBar: new AppBar(
        elevation: 1,
        backgroundColor: Colors.red,
        title: Text('Shopping app'),
        actions: <Widget>[

          new IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>new cart()));
          },
              icon: Icon(Icons.shopping_cart,
                  color: Colors.white))
        ],
      ),
      drawer: sidebar(),

      body: ListView(
        children: <Widget>[
          //image_carousel begins here
          image_carousel,
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Text('Categories'),
          ),
          //horizontal list view begins here
          categories(),
          new Padding(padding: const EdgeInsets.all(15.0),
          child: Text('Recent Products'),
          ),
          //new sidebar(),

          //grid view
          Container(

            child: products(),
          ),



        ],
      ),
    );
  }
}
