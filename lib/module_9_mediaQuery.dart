import 'package:flutter/material.dart';

class ModuleMedia extends StatefulWidget {
  const ModuleMedia({super.key});

  @override
  State<ModuleMedia> createState() => _ModuleMediaState();
}

class _ModuleMediaState extends State<ModuleMedia> {
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size; // Eta always Buildcontext er niche and Scaffold er upore dite hobe.
    double fontSize = screenSize.width > 600 ? 32 : 25;
    double pixelRatio = MediaQuery.of(context).devicePixelRatio;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              width: screenSize.width*0.5,
              height: screenSize.height*0.3,
              color: Colors.red,
            ),
          ),

          Text('This is Media Query Text', style: TextStyle(
            fontSize: fontSize,
          ),),
          
          Text('Pixel Ratio: $pixelRatio', style: TextStyle(
            fontSize: 20,
          ),),

          /* Wrap: Arranges multiple widgets in rows (left to right),
             and moves to a new line when the screen runs out of space. */

          Wrap(
            spacing: 8, // Adds 8 pixels of space between items horizontally.
            runSpacing: 8, // Adds 8 pixels of space between rows (vertically).
            children: List.generate(21, (index){ // Creates 21 square orange boxes.
              return Container(
                color: Colors.orange,
                height: 50,
                width: 50,
              );
            }),
          ),

         // LayoutBuilder(builder: (context,value){ // Instead of 'value', jekono name dewa jabe
         //   if(value.maxWidth > 600){
         //     return GridView.count(crossAxisCount: 3);
         //   }
         //   else{
         //     return GridView.count(crossAxisCount: 1);
         //   }
         // }),
        ],
      ),
    );
  }
}
