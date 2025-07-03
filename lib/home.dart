import 'package:first_class/flutter_class_1.dart';
import 'package:first_class/login_form.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String name; // name er jonno variable
  const Home({super.key, required this.name}); // name er jonno constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('Home Page', style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'asset/YT.png',
                height: 200,
                width: 350,
              ),
              SizedBox(height: 10,),
              Text('Welcome to the Home Page, $name !', style: TextStyle(
                fontSize: 23,
                color: Colors.deepPurpleAccent,
              ),),

              SizedBox(height: 10,),

              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => Homepage())
                      );
                    }, child: Text('flutter_class_1')),

                    SizedBox(width: 10,),

                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.deepPurpleAccent,
                          foregroundColor: Colors.white,
                        ),
                        onPressed: (){
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => LoginPage())
                          );
                        }, child: Text('Login Page')),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
