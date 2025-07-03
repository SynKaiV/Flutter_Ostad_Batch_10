import 'package:flutter/material.dart';

class GridV extends StatelessWidget {
  const GridV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepOrange,
        title: Text('Grid View', style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),),
      ),

      body: GridView.builder(

          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, // number of columns
              crossAxisSpacing: 25, // space between columns
              mainAxisSpacing: 25, // space between rows
          ),

          itemCount: 30,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(

                decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.phone, size: 25, color: Colors.white,),
                    SizedBox(height: 10,),

                    Text('Send Money', style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),),
                  ],
                ),
              ),
            );
          }
      ),

    );
  }
}
