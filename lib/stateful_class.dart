import 'package:first_class/widgets/cityCard.dart';
import 'package:flutter/material.dart';

class StatefulClass extends StatefulWidget {
  const StatefulClass({super.key});

  @override
  State<StatefulClass> createState() => _StatefulClassState();
}

class _StatefulClassState extends State<StatefulClass> {
  int counter = 0; // Random value nilam

  @override
  void initState() { // Ei screen ta jokhon first time dekhabe tokhon initState() method call hobe and updated content show korbe
    // TODO: implement initState
    super.initState();
  } // Etar usage/use-case pore dekhano hobe

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stateful Class',style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(counter.toString(), style: TextStyle(
              fontSize: 70,
              color: Colors.deepPurpleAccent,
              fontWeight: FontWeight.w500,
            ),
            ),

            SizedBox(height: 50,),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                    ),

                    onPressed: (){
                      setState(() { // setState() method use korle UI update hoy
                        counter++;
                      });

                  }, child: Text('+', style: TextStyle(
                    fontSize: 35,
                  ),),
                  ),
                ),

                SizedBox(width: 20,),

                SizedBox(
                  width: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                    ),

                    onPressed: (){
                      setState(() { // setState() method use korle UI update hoy
                        counter--;
                      });

                    }, child: Text('-', style: TextStyle(
                    fontSize: 35,
                  ),),
                  ),
                ),
              ],
            ),

            // Custom Widget
              SizedBox(height: 50,),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  cityCard(imageUrl: 'https://www.amny.com/wp-content/uploads/2022/08/GettyImages-523538287.jpg?quality=51', cityName: 'New York City',),
                  SizedBox(width: 10,),
                  cityCard(imageUrl: 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRYV3EfsaWMn0aXHxhb5FuXZlJWEbIjUPwSyg&s', cityName: 'Dhaka',),
                  SizedBox(width: 10,),
                  cityCard(imageUrl: 'https://www.sunsiyam.com/media/5k3iw5a5/ssiv_general_04.jpg?width=782&height=521&mode=max', cityName: 'Maldives',),
                  SizedBox(width: 10,),
                ],
              ),
            ),
          ],
        ),
      ),

    );
  }
}


