import 'package:flutter/material.dart';
import 'package:shopping/pages/product_details.dart';
class products extends StatefulWidget {
  const products({Key? key}) : super(key: key);

  @override
  State<products> createState() => _productsState();
}

class _productsState extends State<products> {
    var product_list =[
      {
        "name":"Bagpack",
        "picture":"images/product/b1.jpg",
        "old_price":"Rs.2000",
        "current_price":"Rs.1800",
        "brand":"TricorBraun flex"
      },
      {
        "name":"Farrari",
        "picture":"images/product/j1.jpg",
        "old_price":"Rs.2500",
        "current_price":"Rs.2200",
        "brand":"Puma"
      },
      {
        "name":"Jogger",
        "picture":"images/product/ja3.jpg",
        "old_price":"Rs.1700",
        "current_price":"Rs.1600",
        "brand":"Lee"
      },
      {
        "name":"Blazer",
        "picture":"images/product/blazer1.jpeg",
        "old_price":"Rs.1500",
        "current_price":"Rs.1200",
        "brand":"Nike"
      },
      {
        "name":"Sport",
        "picture":"images/product/s1.jpg",
        "old_price":"Rs.2000",
        "current_price":"Rs.1800",
        "brand":"Nike"
      },
      {
        "name":"Pant",
        "picture":"images/product/ja1.jpg",
        "old_price":"Rs.2000",
        "current_price":"Rs.1900",
        "brand":"Levi's"
      },
      {
        "name":"Full Pant",
        "picture":"images/product/ja2.jpg",
        "old_price":"Rs.3000",
        "current_price":"Rs.2800",
        "brand":"Wrangler"
      },
      {
        "name":"Gauon",
        "picture":"images/product/dress1.jpeg",
        "old_price":"Rs.2000",
        "current_price":"Rs.1800",
        "brand":"Adidas"

      },
      {
        "name":"Hills",
        "picture":"images/product/hills2.jpeg",
        "old_price":"Rs.1500",
        "current_price":"Rs.1200",
        "brand":"Adidas"

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
            return Single_prod(
              product_name: product_list[index]['name'],
              product_pic: product_list[index]['picture'],
              product_old_price: product_list[index]['old_price'],
              product_current_price: product_list[index]['current_price'],
              brand: product_list[index]['brand'],
            );
          });
    }
}
class Single_prod extends StatelessWidget {
  final product_name;
  final product_pic;
  final product_old_price;
  final product_current_price;
  final brand;
  Single_prod({
    this.product_name,
    this.product_pic,
    this.product_old_price,
    this.product_current_price, this.brand

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
                  brand: brand,
                ))),
          child: GridTile(
            footer: Container(
              color: Colors.white70,
              child: ListTile(
                leading: Text(product_name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
                title: Text("$product_old_price",style: TextStyle(color: Colors.redAccent,
                    decoration: TextDecoration.lineThrough),
                ),
                subtitle: Text("$product_current_price",style: TextStyle(color: Colors.black),),
              ),
            ),
          child: Image.asset(product_pic,
          fit: BoxFit.cover,
          )),
          ),
        ),
      ),
    );
  }
}

