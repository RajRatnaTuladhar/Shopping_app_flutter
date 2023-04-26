import 'package:flutter/material.dart';
import 'package:shopping/components/login.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isHiddenPassword = true;

  String? email;
  String? password;
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
          
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(height: 30.0,),
                Text(
                  'Create a account',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30,),

                Form(
                  key: formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Full name',
                              hintText: 'Enter Full name ',
                              prefixIcon: Icon(Icons.person),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value){

                            },
                            validator: (value){
                              return value!.isEmpty ? 'Please enter full name': null;
                            },
                          ),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: 'Email',
                              hintText: 'Enter email',
                              prefixIcon: Icon(Icons.email),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value){
                              email=value;
                            },
                            validator: (value){
                              return value!.isEmpty ? 'Please enter email': null;
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
                        SizedBox(height: 30,),
                        Padding(
                          padding: EdgeInsets.only(left: 30.0, right: 30.0),
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelText: 'Mobile Number',
                              hintText: 'Enter Mobile Number',
                              prefixIcon: Icon(Icons.phone),
                              border: OutlineInputBorder(),
                            ),
                            onChanged: (String value){

                            },
                            validator: (value){
                              return value!.isEmpty ? 'Please enter Mobile Number': null;
                            },
                          ),
                        ),
                        SizedBox(height: 30,),
                        Padding(
                          padding: EdgeInsets.only(left: 120.0, right: 120.0),
                          child: MaterialButton(
                            onPressed: (){
                              // print(email);
                              // print(password);
                              // Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(email: email,password: password,)));
                              bool? validity = formKey.currentState?.validate();
                              if (validity!) {
                                formKey.currentState?.save();
                                // print('email');
                                // print('password');
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>Login(email: email,password: password,)));
                                // print(email);
                                // buildContext.read<AuthenticationBloc>().add(GetAuthenticationEvent(email: email, password: password));
                                //call api
                              }
                            },
                            minWidth: double.infinity,
                            child: Text("Register"),
                            color: Colors.red,
                            textColor: Colors.white,
                          ),
                        )
                      ],

                    )
                ),
              ],
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
