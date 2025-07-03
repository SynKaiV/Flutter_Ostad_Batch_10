import 'package:flutter/material.dart';

class cityCard extends StatelessWidget {
  final String imageUrl, cityName;
  const cityCard({
    super.key, required this.imageUrl, required this.cityName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              offset: Offset(6,6)
          ),
        ],
      ),
      alignment: Alignment.center,
      width: 300,
      child: Column(
        children: [
          Stack(
            children: [
              Image.network(imageUrl),
              Positioned(
                bottom: 15,
                left: 15,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: Text("4.5", style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
              Positioned(
                top: 15,
                right: 15,
                child: Container(
                  color: Colors.white,
                  padding: EdgeInsets.all(5),
                  child: Text(cityName, style: TextStyle(
                    fontSize: 20,
                    color: Colors.orange,
                    fontWeight: FontWeight.bold,
                  ),),
                ),
              ),
            ],
          ),
          Text(cityName, style: TextStyle(
            fontSize: 26,
            color: Colors.blue,
          ),),
        ],
      ),
    );
  }
}