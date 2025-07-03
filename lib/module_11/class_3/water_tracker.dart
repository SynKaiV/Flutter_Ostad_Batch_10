import 'package:flutter/material.dart';
import '../../widgets/add_water_button.dart';

class WaterTracker extends StatefulWidget {
  const WaterTracker({super.key});

  @override
  State<WaterTracker> createState() => _WaterTrackerState();
}

class _WaterTrackerState extends State<WaterTracker> {
  int currentWaterIntake = 0;
  final int targetWaterIntake = 2000; // Target water intake in litres

  void addWater(int amount) {
    setState(() {
      currentWaterIntake = (currentWaterIntake+amount).clamp(0, targetWaterIntake); // Clamp the value to ensure it doesn't exceed the target
    });
  }

  void reset(){
    setState(() {
      currentWaterIntake = 0; // Reset the water intake to zero
    });
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentWaterIntake/targetWaterIntake).clamp(0.0, 1.0);
    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Water Tracker App',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
      ),

      body: Center(
        child: Column(
          children: [
            SizedBox(height: 30),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.lightBlue.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: Offset(6, 6), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                children: [
                  Text('Today\'s Water Intake', style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w500,
                  ),),
                  SizedBox(height: 10,),
                  Text('$currentWaterIntake Litre',style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue
                  ),),
                ],
              ),
            ),

            SizedBox(height: 30),

            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  height: 150,
                  width: 150,
                  child: CircularProgressIndicator(
                    value: progress,
                    backgroundColor: Colors.grey,
                    color: Colors.blueAccent,
                    strokeWidth: 9,
                  ),
                ),
                Text('${(progress*100).toInt()}%',style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),),
              ],
            ),

            SizedBox(height: 40),

            Wrap(
              spacing: 20,
              children: [
                addWaterButton(
                    onCLick: ()=> addWater(200),
                    amount: 200,
                    icon: Icons.local_drink
                    ),
                addWaterButton(
                    onCLick: ()=> addWater(500),
                    amount: 500,
                    icon: Icons.local_drink
                    ),
                addWaterButton(
                    onCLick: ()=> addWater(1000),
                    amount: 1000,
                    icon: Icons.local_drink
                ),
              ],
            ),

            SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                    onPressed: ()=> reset(),
                    child: Text('Reset',style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


