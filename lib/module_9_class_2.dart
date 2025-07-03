import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ModuleNineClassTwo extends StatefulWidget {
  const ModuleNineClassTwo({super.key});

  @override
  State<ModuleNineClassTwo> createState() => _ModuleNineClassTwoState();
}

class _ModuleNineClassTwoState extends State<ModuleNineClassTwo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Module 9 - Class 2',style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.w500,
        ),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [

            SizedBox(height: 20),

            Container(
              height: 200.h,
              width: 300.w,
              color: Colors.orange,
            ),

            Text('This is responsive text',style: TextStyle(
              fontSize: 25.sp,
            ),),

            /* 1. 200.h (height):
               a) Converts 200 into a responsive height.
               b) It adapts to the device's screen height.
               c) For example, on a small phone, 200.h might equal 150
               actual pixels; on a tablet, it might be 220 pixels.

               2. 300.w (width):
               a) Converts 300 into a responsive width.
               b) Based on screen width of the current device.
               c) Ensures consistent layout proportions across devices.

               3. 25.sp (scale pixels):
               a) Converts 25 into a responsive font size.
               b) Stands for "scalable pixels".
               c) It adapts based on the screen pixel density (DPI)
               and user text scale settings.
               d) Ensures the text looks consistently sized on all screen
               types.

               * BEHIND THE SCENES *
               a) Looks good on small and large screens.
               b) Automatically scales to phones, tablets, fold-ables, etc. */

            SizedBox(height: 10),

            FractionallySizedBox(
              widthFactor: 0.5, // Parent er 50% jayga nibe.
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                ),
                  onPressed: (){},
                  child: Text('Submit',style: TextStyle(
                    fontSize: 20,
              ),)),
            ),

            SizedBox(height: 10),

            Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepPurpleAccent, width: 3),
              ),
              height: 200,
              child: FractionallySizedBox(
                heightFactor: 0.6,
                child: Container(
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text('This is Fractionally Sized Box Container',style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.w400,
                      color: Colors.black,
                    ),),
                  ),
                ),
              ),
            ),

            SizedBox(height: 20),

            /* 1. Expanded:
                  a) Tells the child to take up as much space
                  as possible.

                  b) It forces the child to expand and fill
                  the remaining space.

               2. Flexible:
                  a) Allows the child to take some or all
                  of the available space.

                  b)But doesn't force it to fill everything.

                  c) The child decides how big it wants to be,
                  within limits. */
            Row(
              children: [
                Flexible(
                  flex: 2, // Ei container 2 ghor jayga nibe.
                  child: Container(
                    height: 100,
                    color: Colors.black,
                  ),
                ),

                Flexible(
                  flex: 2, // Ei container 1 ghor jayga nibe.
                  child: Container(
                    height: 100,
                    color: Colors.amber,
                  ),
                ),

                Flexible(
                  flex: 1, // Ei container 1 ghor jayga nibe.
                  child: Container(
                    height: 100,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            Column(
              children: [
                Container( // Without Expanded widget
                  height: 100, // Fixed size
                  color: Colors.lightGreen,
                ),

                Container(
                  height: 50,
                  color: Colors.pinkAccent,
                ),
              ],
            ),


            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row( // Direct Row ke Expanded widget diye wrap kora jaay naah
                children: [ // Expand er bhitoreo 'flex' use kora jaay
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.orangeAccent,
                        ),
                        onPressed: (){}, child: Text('Person - 1',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),)),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.orangeAccent,
                        ),
                        onPressed: (){}, child: Text('Person - 2',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),)),
                  ),

                  SizedBox(width: 10),

                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,
                          foregroundColor: Colors.orangeAccent,
                        ),
                        onPressed: (){}, child: Text('Person - 3',style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),)),
                  ),

                  SizedBox(width: 10),

                ],
              ),
            ),

            AspectRatio(
                aspectRatio: 16/9, // 16:9 ratio (FHD,1920x1080 pixels,1080p resolution) => For every 16 units of width, there are 9 units of height.
                child: Container(
                  color: Colors.orange,
                ),
            ),
        
            AspectRatio(
              aspectRatio: 9/16, // 9:16 ratio => width is 9 units, height is 16 units. Mobile screens and vertical videos use this format.
              child: Container(
                color: Colors.red,
              ),
            ),

            AspectRatio(
              aspectRatio: 4/3, // 4:3 ratio => (4 units wide, 3 units tall) is a classic, almost square-like rectangle used in various traditional and modern contexts.
              child: Container(
                color: Colors.blueAccent,
              ),
            ),

          ],
        ),
      ),

    );
  }
}
