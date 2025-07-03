import 'package:first_class/grid_view.dart';
import 'package:flutter/material.dart';

import 'home.dart';
import 'list_view.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>(); // Form er key
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Login Page', style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
      
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                  'asset/YT.png',
                height: 200,
                width: 350,
              ),
              
              // Image.network('https://cdn.pixabay.com/photo/2021/11/11/12/41/facebook-6786210_1280.png'),

              Text('Login with your Phone Number & Password'),

              SizedBox(height: 10,),

              Form(
                key: _formKey,
                  child: Column(
                    children: [

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.phone),
                            labelText: 'Phone Number',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.deepPurpleAccent,
                            ),
                            hintText: 'Enter your phone number',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),

                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please enter your phone number';
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          controller: passwordController,
                          obscureText: true,
                          decoration: InputDecoration(
                            suffixIcon: Icon(Icons.lock),
                            labelText: 'Password',
                            labelStyle: TextStyle(
                              fontSize: 20,
                              color: Colors.deepPurpleAccent,
                            ),
                            hintText: 'Enter your password',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),

                          validator: (value){
                            if(value == null || value.isEmpty){
                              return 'Please enter your password';
                            }
                            else if(value.length < 6){
                              return 'Password must be at least 6 characters';
                            }
                            else{
                              return null;
                            }
                          },
                        ),
                      ),

                      SizedBox(height: 20,),

                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),

                            onPressed: (){
                              if(_formKey.currentState!.validate()){
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Login Successful!'),)
                                );
                              }

                              Navigator.pushReplacement( // Login er por top left er back button ta ar dekhabe na
                                  context,
                                  MaterialPageRoute(builder: (context) => Home(name: 'Adnan',)), // name pass na korle LoginPage theke HomePage e jabe na
                              );
                            },
                            child: Text('Login',style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),)
                        ),
                      ),
                      
                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),

                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ListV())
                              );

                        }, child: Text('ListView', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),)),
                      ),

                      SizedBox(
                        width: 150,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.deepPurpleAccent,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),

                            onPressed: (){
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => GridV())
                              );

                            }, child: Text('GridView', style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),)),
                      ),
                      
                    ],
                  )
              )
            ],
          ),
        ),
      ),
    );
  }
}
