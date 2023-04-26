import 'package:flutter/material.dart';
import 'package:shopping/components/login.dart';
import 'package:shopping/main.dart';
import 'package:shopping/pages/cart.dart';
import 'package:shopping/components/about.dart';

class sidebar extends StatefulWidget {
  const sidebar({Key? key}) : super(key: key);

  @override
  State<sidebar> createState() => _sidebarState();
}

class _sidebarState extends State<sidebar> {
  @override
  Widget build(BuildContext context) {


    return new Drawer(
        child: new ListView(
          children: <Widget>[
            // header
            new UserAccountsDrawerHeader(
              accountName: Text('Raj'),
              accountEmail: Text('tuladharraj09@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.white,

                ),
              ),
              decoration: new BoxDecoration(
                color: Colors.red,
              ),
            ),
            // body
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: ListTile(
                title: Text('HomePage'),
                leading: Icon(Icons.home,color: Colors.red ),
              ),
            ),


            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=> new cart()));
              },
              child: ListTile(
                title: Text('Shopping cart'),
                leading: Icon(Icons.shopping_cart,color: Colors.red),
              ),
            ),
            // InkWell(
            //   onTap: () {},
            //   child: ListTile(
            //     title: Text('Favourites'),
            //     leading: Icon(Icons.favorite,color: Colors.red),
            //   ),
            // ),
            Divider(),

            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) =>  about(),));
              },
              child: ListTile(
                title: Text('About us'),
                leading: Icon(Icons.question_mark, color: Colors.red,),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()),(route) => false,);
              },
              child: ListTile(
                title: Text('Logout'),
                leading: Icon(Icons.login, color: Colors.red,),
              ),
            ),

          ],
        ),

    );
  }
}

