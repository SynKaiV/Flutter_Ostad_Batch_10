import 'package:flutter/material.dart';

class FlutterClass2 extends StatelessWidget {
  const FlutterClass2({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController numberController = TextEditingController(); // 'Phone Number' TextField er jonne controller create kora hoyeche, input ta store kore rakhar jonno
    TextEditingController passwordController = TextEditingController(); // 'Password' TextField er jonne controller create kora hoyeche, input ta store kore rakhar jonno
    return Scaffold(
      backgroundColor: Colors.grey[300], // Background color and color er opacity set kora hoyeche
      // backgroundColor: Colors.grey.withOpacity(1), // Opacity set korar alternative method
      // backgroundColor: Colors.grey.shade500, // Another way to set opacity
      appBar: AppBar(
        title: Text("Class - 2", style: TextStyle(
          fontSize: 35,
          color: Colors.white,
        )),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),

      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurpleAccent,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15), // Button er corner round kora hoyeche
                  )
          ),
                  onPressed: (){
                print('Elevated button pressed!');
              }, child: Text('Elevated Button')),
          
              SizedBox(
                height: 10,
              ),
          
              // How to increase/decrease size of a button
              SizedBox(
                height: 60,
                width: 250,
                // width: double.infinity, // Button er width screen er width er shathe match korate chaile
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.deepPurpleAccent,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15), // Button er corner round kora hoyeche
                        )
                    ),
                    onPressed: (){
                      print('Elevated button pressed!');
                    }, child: Text('Elevated Button', style: TextStyle(
                      fontSize: 25,
                    ))),
              ),
              // ElevatedButton er background color dewa jayna, but foreground color dewa jaa
          
              SizedBox(
                height: 15,
              ),
          
              SizedBox(
                height: 40,
                width: 200,
                child: OutlinedButton(onPressed: (){
                  print('Outlined button pressed!');
                }, child: Text('Outlined Button', style: TextStyle(
                  fontSize: 20,
                  color: Colors.deepPurpleAccent
                ),)),
              ),
          
              SizedBox(
                height: 10,
              ),
          
              // Gesture Detector
              GestureDetector(
                  onTap: (){
                    print('Gesture Detector pressed!');
                  },
                  child: Text('Gesture Detector!', style: TextStyle(
                    fontSize: 25,
                    color: Colors.deepPurpleAccent,
                    fontWeight: FontWeight.w400
                  ),)),
          
              SizedBox(height: 10,),
          
              // Text Overflow Handling:
              // Text(overflow: TextOverflow.ellipsis,
              //   maxLines: 3,
              //   "What is Lorem Ipsum? Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum. Lorem Ipsum is simply dummy text of the printing and typesetting industry.", style: TextStyle(
              //   fontSize: 20,
              // ),),
          
              SizedBox(
                height: 10,
              ),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: numberController, // TextField er jonne controller dewa hoyeche
                  keyboardType: TextInputType.phone, // Input type number hobe
                  decoration: InputDecoration(
                    hintText: 'Enter number',
                    labelText: 'Phone Number',
                    labelStyle: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 20,
                    ),
          
                    prefixIcon: Icon(Icons.phone), // Phone number text field er moddhe phone icon dewa hoyeche
          
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                ),
              ),
          
              SizedBox(height: 10,),
          
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: passwordController, // TextField er jonne controller dewa hoyeche
                  obscureText: true, // Password field er jonne, jate password ta show na kore
                  decoration: InputDecoration(
                    hintText: 'Enter password',
                    labelText: 'Password',
                    labelStyle: TextStyle(
                      color: Colors.deepPurpleAccent,
                      fontSize: 20,
                    ),
          
                    suffixIcon: Icon(Icons.lock),
          
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.deepPurpleAccent,
                      ),
                    ),
                  ),
                ),
              ),
          
              SizedBox(height: 10,),
          
              ElevatedButton(onPressed: (){
                if(numberController.text.isEmpty){
                  print('Phone number is empty! Please enter a valid phone number.');
                }
                else if(numberController.text.length < 11){
                  print('Please enter a valid phone number.');
                }
                else{
                  print("Your number: ${numberController.text}");
                }
              }, child: Text('Submit', style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20,
              ),)),

              SizedBox(
                height: 10,
              ),

              ElevatedButton(onPressed: (){
                numberController.clear();
              }, child: Text('Clear', style: TextStyle(
                color: Colors.deepPurpleAccent,
                fontSize: 20,
              ),)),
          
              Container(
                // alignment: Alignment.center, // Align the child widget(s) to the center of the container. But jodi child widget already center hoye thake, tahole eta dewar dorkar naai
                margin: EdgeInsets.all(20), // Container will have a 20-pixel empty space on all sides (top, bottom, left, right) between itself and its parent or neighboring widgets
                padding: EdgeInsets.all(20), // Container will have a 20-pixel empty space on all sides (top, bottom, left, right) between its content and its border
                height: 250,
                width: 250,
          
                decoration: BoxDecoration(
                  color: Colors.deepPurpleAccent,
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    color: Colors.orangeAccent,
                    width: 4,
                  ),
          
                  boxShadow: [
                    BoxShadow(
                      color: Colors.blue, // Shadow er color
                      offset: Offset(8, 8), // Shadow er position, x and y axis borabor
                      blurRadius: 12, // Shadow er blur radius
                    )
                  ],
          
                ),
                child: Center(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                        Text('This is a container', style: TextStyle(
                          fontSize: 22,
                          color: Colors.white,
                        ),),
                      ],
                    ),
                  ),
                ),
              )
          
            ],
          ),
        ),
      ),


      // Floating action button: body er moddhe hoy naah, scaffold er moddhe thakte hoy
        floatingActionButton: FloatingActionButton(onPressed: (){
          print('Floating action button pressed!');
        },
          backgroundColor: Colors.deepPurpleAccent,
          child: Icon(Icons.add, size: 30, color: Colors.white,),
        ),
    );
  }
}
