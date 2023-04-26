import 'package:flutter/material.dart';
import 'package:shopping/main.dart';
import 'package:shopping/components/buy_now.dart';

import 'cart.dart';
class Product_Details extends StatefulWidget {
  final product_details_name;
  final product_details_oldprice;
  final product_details_newprice;
  final product_details_pictures;
  final brand;
  final details;
  Product_Details({
    this.product_details_name,
    this.product_details_oldprice,
    this.product_details_newprice,
    this.product_details_pictures, this.brand, this.details,
});

  @override
  State<Product_Details> createState() => _Product_DetailsState();
}

class _Product_DetailsState extends State<Product_Details> {
  List size = ['Size','S','M''L','XL','XXl'];
  List color =['Color','Red','Green','Blue'];
  String? dropdownvalue= 'Size';
  String? dropdownvalue1= 'Color';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
        elevation: 0.2,
        backgroundColor: Colors.red,
        title: InkWell(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> new HomePage()));
          },
          child: Text("Shopping app"),
        ),

        actions : <Widget>[

          new IconButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => cart(),));
          }, icon: Icon(Icons.shopping_cart, color: Colors.white,)),
        ],
    ),
      body: ListView(
        children: <Widget>[
          new Container(
            height: 300.0,
            child: new GridTile(
                child: new Container(
                  color: Colors.white,
                  child: Image.asset(widget.product_details_pictures),
                ),

              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  leading: new Text(widget.product_details_name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 28.0)),

                ),


              ),
            ),

          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Expanded(
                  child: new Text("${widget.product_details_newprice}",
                    style: TextStyle(fontSize: 20.0),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Expanded(

                  child: new Text("${widget.product_details_oldprice}",

                    style: TextStyle(color: Colors.red,
                      decoration: TextDecoration.lineThrough,
                      fontSize: 15.0,
                      decorationColor: Colors.red,
                    ),
                  ),


                ),
              ),

            ],
          ),

          Row(
            children: <Widget>[
              Expanded(
                  child: MaterialButton(onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                      return AlertDialog(
                        title: Text("Alert", style: TextStyle(color: Colors.red,fontSize: 30.0),),
                        content: Text("Choose the size", style: TextStyle(fontSize: 20.0),),
                        actions: <Widget>[
                          new MaterialButton(onPressed: (){
                            Navigator.of(context).pop(context);
                          },
                          child: Text("Exit", style: TextStyle(fontSize: 18.0),),
                          )
                        ],
                      );
                    });


                  },
                  color: Colors.white,
                    elevation: 0.2,
                    child: DropdownButton(
                      value: dropdownvalue,
                      items:
                      size.map((e) => DropdownMenuItem(child: Text(e),value:e,)).toList()
                      , onChanged: (value) {
                      setState(() {
                        dropdownvalue = value as String;
                      });
                      },

                    ),
                  )
              ),

              Expanded(
                  child: MaterialButton(onPressed: (){
                    showDialog(context: context,
                        builder: (context){
                          return AlertDialog(
                            title: Text("Alert", style: TextStyle(color: Colors.red,fontSize: 30.0),),
                            content: Text("Choose the color", style: TextStyle(fontSize: 20.0),),
                            actions: <Widget>[
                              new MaterialButton(onPressed: (){
                                Navigator.of(context).pop(context);
                              },
                                child: Text("Exit", style: TextStyle(fontSize: 18.0),),
                              )
                            ],
                          );

                        });
                  },
                    color: Colors.white,
                    elevation: 0.2,
                      child: DropdownButton(
                        value: dropdownvalue1,
                        items:
                        color.map((e) => DropdownMenuItem(child: Text(e),value:e,)).toList()
                        , onChanged: (value) {
                        setState(() {
                          dropdownvalue1 = value as String;
                        });
                      },
                  )
                  )),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Expanded(child: MaterialButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => buy_now()));
                },
                  color: Colors.red,
                  textColor: Colors.white,
                  
                  child: Text("Buy Now", style: TextStyle(fontSize: 18.0,),
                  ),
                  elevation: 0.2,

                ),

                ),
              ),
              new IconButton(onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>cart()));
              }, icon: Icon(Icons.add_shopping_cart),color: Colors.red,),
              new IconButton(onPressed: () {}, icon: Icon(Icons.favorite), color: Colors.red,),
            ],
          ),

          Divider(),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Name:", style: TextStyle(color: Colors.grey,fontSize: 18.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text('${widget.product_details_name}', style: TextStyle(color: Colors.black,fontSize: 18.0),),),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Brand:", style: TextStyle(color: Colors.grey,fontSize: 18.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("${widget.brand}", style: TextStyle(color: Colors.black,fontSize: 18.0),),),
            ],
          ),
          Row(
            children: <Widget>[
              Padding(padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("Product Condition:", style: TextStyle(color: Colors.grey,fontSize: 18.0),),),
              Padding(padding: EdgeInsets.all(5.0),
                child: Text("New", style: TextStyle(color: Colors.black,fontSize: 18.0),),),
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
              child: Text("Related products",style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),),

          ),

          SingleChildScrollView(
            child: Similar_Products(),

          )


        ],
      ),
    );
  }
}
class Similar_Products extends StatefulWidget {
  const Similar_Products({Key? key}) : super(key: key);

  @override
  State<Similar_Products> createState() => _Similar_ProductsState();
}

class _Similar_ProductsState extends State<Similar_Products> {
  var product_list =[
    {
      "name":"Blazer",
      "picture":"images/product/blazer1.jpeg",
      "old_price":"Rs.1500",
      "current_price":"Rs.1200",
    },
    {
      "name":"Dress",
      "picture":"images/product/dress1.jpeg",
      "old_price":"Rs.1500",
      "current_price":"Rs.1200",
    },
    {
      "name":"Hills",
      "picture":"images/product/hills2.jpeg",
      "old_price":"Rs.1500",
      "current_price":"Rs.1200",
    },
    {
      "name":"Pants",
      "picture":"images/product/pants2.jpeg",
      "old_price":"Rs.1500",
      "current_price":"Rs.1200",
    },
    {
      "name":"Shoe",
      "picture":"images/product/shoe.jpg",
      "old_price":"Rs.1500",
      "current_price":"Rs.1200",
    },
    {
      "name":"Skirt",
      "picture":"images/product/skt2.jpeg",
      "old_price":"Rs.1500",
      "current_price":"Rs.1200",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: product_list.length,
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemBuilder: (BuildContext context, int index)
        {
          return Similar_Single_prod(
            product_name: product_list[index]['name'],
            product_pic: product_list[index]['picture'],
            product_old_price: product_list[index]['old_price'],
            product_current_price: product_list[index]['current_price'],
          );
        });
  }
}

class Similar_Single_prod extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_old_price;
  final product_current_price;
  Similar_Single_prod({
    this.product_name,
    this.product_pic,
    this.product_old_price,
    this.product_current_price

  });



  @override
  Widget build(BuildContext context) {
    return Card(
      child: Hero(
        tag:product_name,
        child: Material(
          child: InkWell(
            onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                builder: (context)=> new Product_Details(
                  product_details_name: product_name,
                  product_details_oldprice: product_old_price,
                  product_details_newprice: product_current_price,
                  product_details_pictures: product_pic,

                ))),
            child: GridTile(
                footer: Container(
                  color: Colors.white70,
                  child: ListTile(
                    leading: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize:20.0),
                    ),
                    title: Text("$product_current_price",style: TextStyle(color: Colors.black,
                        ),
                    ),
                    subtitle: Text("$product_old_price",style: TextStyle(color: Colors.redAccent,decoration: TextDecoration.lineThrough),),

                  ),
                ),
                child: Image.asset(product_pic,
                  fit: BoxFit.cover,
                )

            ),

          ),
        ),
      ),
    );
  }
}


