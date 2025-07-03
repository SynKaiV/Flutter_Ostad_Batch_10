import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        centerTitle: true, // Cause by default, android er appbar title left side e thake
        backgroundColor: Colors.deepPurpleAccent,
      ),

      // body: SingleChildScrollView(
      //   scrollDirection: Axis.horizontal, // Scrollable widget jate horizontally scroll kora jaay, by default axis.vertical thake
      //   child: Row(
      //     children: [
      //       Text("This is a row",style: TextStyle(
      //             fontSize: 30,
      //             color: Colors.red
      //         ),),
      //       SizedBox( // SizedBox widget er maddhome space dewa hoyeche
      //         width: 10,
      //       ),
      //
      //       Text("This is a row",style: TextStyle(
      //           fontSize: 30,
      //           color: Colors.red
      //       ),),
      //       SizedBox( // SizedBox widget er maddhome space dewa hoyeche
      //         width: 10,
      //       ),
      //
      //       Text("This is a row",style: TextStyle(
      //           fontSize: 30,
      //           color: Colors.red
      //       ),),
      //       SizedBox( // SizedBox widget er maddhome space dewa hoyeche
      //         width: 10,
      //       ),
      //
      //       Text("This is a row",style: TextStyle(
      //           fontSize: 30,
      //           color: Colors.red
      //       ),),
      //       SizedBox( // SizedBox widget er maddhome space dewa hoyeche
      //         width: 10,
      //       ),
      //
      //       Text("This is a row",style: TextStyle(
      //           fontSize: 30,
      //           color: Colors.red
      //       ),),
      //       SizedBox( // SizedBox widget er maddhome space dewa hoyeche
      //         width: 10,
      //       ),
      //     ],
      //   ),
      // ),
      // body: Text('This is body area',style: TextStyle(
      //   fontSize: 50,
      //   color: Colors.orange,
      //   fontWeight: FontWeight.w400, // Text widget er moddhe text likha hoyeche
      // ),),
      body: SingleChildScrollView( // Scrollable widget jate vertically scroll kora jaay
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Column er moddhe text gulo evenly spaced thakbe
            children: [
              InkWell(
                  onTap: (){

                  },

                  onDoubleTap: (){

                  },

                  onLongPress: (){

                  },
                  child: Icon(Icons.add,size: 40,color: Colors.blueAccent,)), // Icon widget er moddhe + icon dewa hoyeche

              IconButton(onPressed: (){
                print("Item has been deleted!");
              }, icon: Icon(Icons.delete, size: 30, color: Colors.red,)),

              TextButton(onPressed: (){
                print("Button has been clicked!");
              }, child: Text("Click me",style: TextStyle(
                fontSize: 50,
                color: Colors.blue,
                fontWeight: FontWeight.bold,
              ),),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),

              Text("This is a column",style: TextStyle(
                  fontSize: 30,
                  color: Colors.purple
              ),),
            ],
          ),
        ),
      ),
    );
  }
}