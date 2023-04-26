import 'package:flutter/material.dart';
import 'package:shopping/category/bag.dart';
import 'package:shopping/pages/product_list.dart';
class categories extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 125.0,

      child: ListView(
        scrollDirection: Axis.horizontal,

        children: <Widget>[
          Category(
              image_location: 'images/cats/tshirt.jpg',
              image_caption: 'T-shirt'

          ),

          Category(
              image_location: 'images/cats/bag.jpg',
              image_caption: 'Bag'
          ),
          Category(
              image_location: 'images/cats/jackets.jpg',
              image_caption: 'Jackets'
          ),
          Category(
              image_location: 'images/cats/shoes.jpg',
              image_caption: 'Shoes'
          ),
          Category(
              image_location: 'images/cats/jeans.jpg',
              image_caption: 'Jeans'
          ),


        ],
      ),
    );

  }
}
class Category extends StatefulWidget {
  final String image_location;
  final String image_caption;
  Category({
    required this.image_location,
    required this.image_caption,
});

  @override
  State<Category> createState() => _CategoryState();
}

class _CategoryState extends State<Category> {
  ProductData pd = ProductData();
  @override

  Widget build(BuildContext context) {

    return Padding(padding: const EdgeInsets.all(2.0),

      child: InkWell(

       onTap: (){
         Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListPage(
           data: widget.image_caption == 'T-shirt'? pd.tshirt
               :widget.image_caption == 'Bag'? pd.bag
               :widget.image_caption == 'Jackets'? pd.jacket
               :widget.image_caption == 'Shoes'? pd.shoes
               :widget.image_caption == 'Jeans'? pd.jeans
               :null
           ,
           categoryName: widget.image_caption == 'T-shirt'? 'T-shirt'
               :widget.image_caption == 'Bag'? 'Bag'
               :widget.image_caption == 'Jackets'? 'Jacket'
               :widget.image_caption == 'Shoes'? 'Shoes'
               :widget.image_caption == 'Jeans'? 'Jeans'
               :null,
         ),));
       },
       child: Container(
         width: 100.0,
         child: ListTile(
           title: Image.asset(
             widget.image_location,
             width: 100.0,
             height: 100.0,

           ),
           subtitle: Container(
             alignment: Alignment.topCenter,
             child: Text(widget.image_caption),
           ),
         ),
       ),
      ),

    );


  }
}
