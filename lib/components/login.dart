import 'package:flutter/material.dart';
import 'package:shopping/components/register.dart';
import 'package:shopping/main.dart';
 class Login extends StatefulWidget {
   String? email;
   String? password;
    Login({Key? key, this.email, this.password}) : super(key: key);
 
   @override
   State<Login> createState() => _LoginState();
 }
 
 class _LoginState extends State<Login> {
   bool isHiddenPassword = true;
   String? email;
   String? password;
   String message='';

   final formKey = GlobalKey<FormState>();
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
                   Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                   ),
                   SizedBox(height: 30,),
                   Form(
                     key: formKey,

                       child: Column(
                         children: [
                           Padding(padding: EdgeInsets.only(left: 30.0, right: 30.0),
                             child: TextFormField(
                             keyboardType: TextInputType.emailAddress,
                             key: ValueKey("email"),
                             decoration: InputDecoration(
                               labelText: 'Email',
                               contentPadding: EdgeInsets.all(8.0),

                               hintText: 'Enter email',
                               prefixIcon: Icon(Icons.email),
                               border: OutlineInputBorder(),




                             ),
                             onChanged: (String value){
                               email=value;
                             },
                             validator: (String? value) {
                               return (value == '') ? 'Invalid email' : null;
                             },
                           ),
                           ),

                           SizedBox(height: 30,),
                           Padding(
                               padding: EdgeInsets.only(left: 30.0, right: 30.0),
                             child: TextFormField(
                               obscureText: isHiddenPassword,

                               keyboardType: TextInputType.emailAddress,
                               decoration: InputDecoration(
                                 labelText: 'Password',
                                 hintText: 'Enter Password',
                                 prefixIcon: Icon(Icons.password),
                                 suffixIcon: InkWell(
                                     onTap: _togglePassword,
                                     child: Icon(Icons.visibility)
                                 ),
                                 border: OutlineInputBorder(),
                               ),
                               onChanged: (String value){
                                 password=value;
                               },
                               validator: (value){
                                 return value!.isEmpty ? 'Please enter password': null;
                               },
                             ),
                           ),
                           SizedBox(height: 10,),
                           Padding(
                             
                             padding: EdgeInsets.only(left: 120.0, right: 120.0),
                             child: MaterialButton(
                               onPressed: (){
                                 bool? validity = formKey.currentState?.validate();
                                 if (validity!) {
                                   formKey.currentState?.save();
                                   if(widget.email==email&&widget.password==password){
                                     setState(() {
                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                     });
                                   }
                                   else{
                                     setState(() {
                                       message="Login Failed";
                                     });
                                   }
                                   // print('email');
                                   // print('password');
                                   // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                                   //Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()),(route){return false;});
                                   // print(email);
                                   // buildContext.read<AuthenticationBloc>().add(GetAuthenticationEvent(email: email, password: password));
                                   //call api
                                 }
                               },
                                 



                               minWidth: double.infinity,
                               child: Text("Login"),
                               color: Colors.red,
                               textColor: Colors.white,

                             ),
                           ),
                           SizedBox(height: 50.0,),

                           SizedBox(height: 180.0),
                           Row(
                             children: <Widget>[
                               Spacer(),


                                    Text(
                                     "Don't have a account?",
                                     style: TextStyle(fontSize: 18.0),

                                   ),
                               SizedBox(width: 10,),

                               InkWell(
                                 onTap: (){
                                   Navigator.push(context, MaterialPageRoute(builder: (context)=> Register()));
                                 },

                                 child: Text("Signup",

                                   style: TextStyle(fontSize: 18.0,
                                       decoration:TextDecoration.underline,
                                       color: Colors.red),



                                 ),
                               ),
                               Spacer(),],

                           ),




                           Text(message),

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
   void _togglePassword()
   {
     if(isHiddenPassword == true)
     {
       isHiddenPassword = false;
     }
     else
     {
       isHiddenPassword = true;
     }
     setState(() {

     });
   }
 }
 