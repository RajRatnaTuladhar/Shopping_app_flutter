import 'package:flutter/material.dart';
import 'package:shopping/pages/product_details.dart';
class ProductListPage extends StatefulWidget {
  dynamic data;
  String? categoryName;
   ProductListPage({Key? key, this.data, this.categoryName}) : super(key: key);

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    print(widget.data);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.categoryName!),
        backgroundColor: Colors.red,
      ),
      body: SafeArea(
          child:  SingleChildScrollView(
            child: GridView.builder(
            itemCount: widget.data.length,
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: (BuildContext context, int index)
            {
              return Card(
                child: Hero(
                  tag:widget.data[index]['name'],
                  child: Material(
                    child: InkWell(
                      onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
                          builder: (context)=> new Product_Details(
                            product_details_name: widget.data[index]['name'],
                            product_details_oldprice: widget.data[index]['old_price'],
                            product_details_newprice: widget.data[index]['current_price'],
                            product_details_pictures: widget.data[index]['picture'],
                            brand: widget.data[index]['brand'],
                          ))),
                      child: GridTile(
                          footer: Container(
                            color: Colors.white70,
                            child: ListTile(

                              title: Text(widget.data[index]['name'], style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                              ),
                              subtitle: Row(
                                children: [
                                  Text("${widget.data[index]['old_price']} ",style: TextStyle(color: Colors.redAccent,
                                      decoration: TextDecoration.lineThrough),

                                  ),
                              Text(" ${widget.data[index]['current_price']}",style: TextStyle(color: Colors.black,
                                  ),)
                                ],
                              ),
                              // subtitle: Text("${widget.data[index]['current_price']}",style: TextStyle(color: Colors.black),),
                            ),
                          ),
                          child: Image.asset(widget.data[index]['picture'],
                            fit: BoxFit.cover,
                          )),
                    ),
                  ),
                ),
              );
            }),
          )),
    );
  }
}
