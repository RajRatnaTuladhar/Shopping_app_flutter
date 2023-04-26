import 'package:flutter/material.dart';
import 'package:carousel_pro/carousel_pro.dart';
//self imported files
import 'package:shopping/pages/product_details.dart';
class buy_now extends StatefulWidget {
  const buy_now({Key? key}) : super(key: key);

  @override
  State<buy_now> createState() => _buy_nowState();
}

class _buy_nowState extends State<buy_now> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            title: Text('Shopping app'),
            elevation: 1,
            backgroundColor: Colors.red,

          ),
          body: SafeArea(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 40.0),
              child: SingleChildScrollView(

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children:[

                    SizedBox(height: 30,),
                    Form(
                        child: Column(
                          children: [
                            Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: TextFormField(
                                keyboardType: TextInputType.emailAddress,
                                key: ValueKey("email"),
                                decoration: InputDecoration(
                                  labelText: 'Fullname',
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: 'Enter Fullname',
                                  border: OutlineInputBorder(),
                                ),

                              ),
                            ),

                            SizedBox(height: 30,),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Address',
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: 'Enter Address',
                                  border: OutlineInputBorder(),
                                ),

                              ),
                            ),
                            SizedBox(height: 30,),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: TextFormField(
                                decoration: InputDecoration(
                                  labelText: 'Phone number',
                                  contentPadding: EdgeInsets.all(8.0),
                                  hintText: 'Phone number',
                                  border: OutlineInputBorder(),
                                ),

                              ),
                            ),
                            SizedBox(height: 30,),
                            Padding(
                              padding: EdgeInsets.only(left: 30.0, right: 30.0),
                              child: MaterialButton(
                                onPressed: (){},
                                minWidth: double.infinity,
                                child: Text("Submit"),
                                color: Colors.red,
                                textColor: Colors.white,
                              ),
                            ),






                          ],

                        )
                    ),
                  ],
                ),
              ),
            ),
          )

      ),
    );
  }
}