import 'package:flutter/material.dart';

class Module9Class3 extends StatefulWidget {
  const Module9Class3({super.key});

  @override
  State<Module9Class3> createState() => _Module9Class3State();
}

class _Module9Class3State extends State<Module9Class3> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Drawer & TabBar Demo',style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.w500,
          ),),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.home),
                text: 'Home',
              ),

              Tab(
                icon: Icon(Icons.star),
                text: 'Favourite',
              ),

              Tab(
                icon: Icon(Icons.settings),
                text: 'Settings',
              ),
            ],
          ),
          centerTitle: true,
          backgroundColor: Colors.amber,
          foregroundColor: Colors.black,
        ),

        body: TabBarView(
          children: [
            Center(child: Icon(Icons.home,size: 100)),
            Center(child: Icon(Icons.star,size: 100)),
            Center(child: Icon(Icons.settings,size: 100)),
          ],
        ),

        drawer: Drawer(
          child: ListView(
            children: [
              DrawerHeader(child: Column(
                children: [
                  CircleAvatar(
                    radius: 34,
                    backgroundImage: AssetImage('assets/Adnan Imtiaz 2.jpg'),
                  ),

                  SizedBox(height: 12,),

                  Text('Khondoker Adnan Imtiaz',style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),),

                  Text('adnanimtiaj201142@gmail.com',style: TextStyle(
                    fontSize: 16,
                  ),),

                ],
              ),
              ),

              ListTile(
                title: Text('Categories'),
                onTap: (){},
              ),

              Divider(
                thickness: 2,
                color: Colors.amber,
              ),

              ListTile(
                title: Text('Browse Items'),
                onTap: (){},
              ),

              Divider(
                thickness: 2,
                color: Colors.amber,
              ),

              ListTile(
                title: Text('Sign out'),
                onTap: (){},
              ),

              Divider(
                thickness: 2,
                color: Colors.amber,
              ),
            ],
          ),
        ),

      ),
    );
  }
}
