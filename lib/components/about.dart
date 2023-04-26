import 'package:flutter/material.dart';
class about extends StatefulWidget {
  const about({Key? key}) : super(key: key);

  @override
  State<about> createState() => _aboutState();
}

class _aboutState extends State<about> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        elevation: 1,
        backgroundColor: Colors.red,
        title: Text('Shopping app'),

      ),
      body: Text(
        'Welcome to shopping app \n\n We offer a wide range of products, from clothing and accessories to home goods and electronics. We work directly with manufacturers and suppliers to bring you high-quality products at competitive prices.'
            '\n\n If any query '
            '\n \nContact us:bigbrackets@gmail.com'
            '\n \nMobile Number: 9874563210',
          style: TextStyle(fontSize: 25),
      )
    );
  }
}
