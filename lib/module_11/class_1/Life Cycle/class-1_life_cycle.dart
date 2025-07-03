import 'package:flutter/material.dart';

import 'life_cycle_test.dart';

class LifeCycle extends StatefulWidget {
  const LifeCycle({super.key});

  @override
  State<LifeCycle> createState() => _LifeCycleState();
}

class _LifeCycleState extends State<LifeCycle> {

  @override
  void initState() { // First e eta run hoy
    // TODO: implement initState
    super.initState();
    print('initState from LifeCycle');
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    print('Dispose from LifeCycle');
  }

  @override
  Widget build(BuildContext context) { // Then, build method run hoy
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Life Cycle',style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),),
      ),

      body: Center(
        child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
            ),

            onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => LifeCycleTest()
                )
              );
        },
            child: Text('Next Page',style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),)),
      ),

    );
  }
}
