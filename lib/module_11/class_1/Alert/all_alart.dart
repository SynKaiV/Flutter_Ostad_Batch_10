import 'package:flutter/material.dart';

class Alert extends StatefulWidget {
  const Alert({super.key});

  @override
  State<Alert> createState() => _AlertState();
}

class _AlertState extends State<Alert> {

  void showAlertDialog(){
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('This is title',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
          content: Text('Are you sure?',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),),
          actions: [
            TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onPressed: (){
                  Navigator.pop(context);
            },
                child: Text('Yes',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),)),

            TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.amber,
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),

                onPressed: (){
                  Navigator.pop(context);
            }, child: Text('No',style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),)),

          ],
        ),
    );
  }

  void showAlertDialogWithIcons(){
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Text('Installation blocked!',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        content: Column(
          mainAxisSize: MainAxisSize.min, // Content er size wise column er size ta minimum rakhe, extra space ney naah
          children: [
            Row(
              children: [
                Icon(Icons.warning,color: Colors.red,size: 30),
                SizedBox(width: 10),
                Text('Fudie Admin',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),),
              ],
            ),

            SizedBox(height: 10),

            Text('Installation blocked. This application could not be installed because your device\'s current security settings or administrative restrictions do not allow apps from this source. This may be due to organizational policies, lack of required permissions, or an unverified installation package.',style: TextStyle(
              color: Colors.black,
              fontSize: 18
            ),),

          ],
        ),
        actions: [
          TextButton(
              style: TextButton.styleFrom(
                foregroundColor: Colors.amber,
                textStyle: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),

              onPressed: (){
                Navigator.pop(context);
              },

              child: Text('Dismiss',style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),)),
        ],
      ),
    );
  }

  void showSimpleDialog(){
    showDialog(
        context: context,
        builder: (context) => SimpleDialog(
          title: Text('Simple Dialog',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),),
          children: [
            SimpleDialogOption(
              child: Text('Option 1',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),),
              onPressed: () => Navigator.pop(context),
            ),

            SimpleDialogOption(
              child: Text('Option 2',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.amber,
              ),),
              onPressed: () => Navigator.pop(context),
            ),
          ],
        )
    );
  }

  void showBottomSheetAlert(){
    showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: EdgeInsets.all(20),
          color: Colors.amber,
          child: Column(
            mainAxisSize: MainAxisSize.min, // Content er size wise column er size ta minimum rakhe, extra space ney naah
            children: [
              Text('Choose option',style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),

              ListTile(
                title: Text('Option 1',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                onTap: () => Navigator.pop(context),
              ),

              ListTile(
                title: Text('Option 2',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),),
                onTap: () => Navigator.pop(context),
              ),

            ],
          ),
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        centerTitle: true,
        title: Text('Alert Dialog',style: TextStyle(
          fontSize: 35,
          fontWeight: FontWeight.bold,
        ),),
      ),
      
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

                onPressed: (){
                  showAlertDialog();
                },

                child: Text('Alert Dialog',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),

              onPressed: (){
                showAlertDialogWithIcons();
              },

              child: Text('Alert Dialog with Icons',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),),
            ),

            SizedBox(height: 20),

            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber,
                  foregroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onPressed: (){
                  showSimpleDialog();
                },
                child: Text('Simple Dialog',style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                ),
            ),

            SizedBox(height: 20),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.amber,
                foregroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              onPressed: (){
                showBottomSheetAlert();
              },
              child: Text('Bottom Sheet',style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
