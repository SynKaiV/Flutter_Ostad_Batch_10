import 'package:flutter/material.dart';

class ListV extends StatelessWidget {
  const ListV({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        title: Text('List View', style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),),
      ),

        // ListView widget => Automatically scrollable
      body: ListView.builder(
        itemCount: 50,
        itemBuilder: (context, index){
          return Card( // Card widget => UI design
            child: ListTile( // ListTile widget => List er item
              leading: Icon(Icons.phone),
              trailing: Icon(Icons.delete),
              title: Text('Imtiaz', style: TextStyle( // title e name dekhabe
                fontSize: 25,
                fontWeight: FontWeight.w500,
                color: Colors.deepPurpleAccent,
              ),),
              subtitle: Text('0171307684 $index', style: TextStyle( // subtitle e number dekhabe
                fontSize: 20,
                color: Colors.black,
              ),),
            
            
            ),
          );
        },
      ),
    );
  }
}
