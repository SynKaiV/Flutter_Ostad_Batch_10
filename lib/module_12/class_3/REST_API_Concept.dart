import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RestApiConcept extends StatefulWidget {
  const RestApiConcept({super.key});

  @override
  State<RestApiConcept> createState() => _RestApiConceptState();
}

class _RestApiConceptState extends State<RestApiConcept> {

  List users = [];
  bool isLoading = true;

  Future<void> fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    // log(response.body); // For debugging purposes, you can log the response body to see the raw data.

    if (response.statusCode == 200) {
      setState(() {
        users = jsonDecode(response.body);
        isLoading = false; // Data loaded
      });
    } else {
      setState(() {
        isLoading = false; // Stop loading even on failure
      });
      throw Exception('Failed to load users!');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('User List (REST API Concept)',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),

      body: isLoading ?
      Center(child: CircularProgressIndicator())
          : ListView.builder(
        itemCount: users.length,
          itemBuilder: (context,index){
          final user = users[index];
            return ListTile(
              leading: CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                child: Text(user['name'][0],
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              title: Text(user['name'],
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Username: ${user['username']}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey
                    ),
                  ),
                  Text('Email: ${user['email']}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),
                  ),
                  Text('Phone: ${user['phone']}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),
                  ),
                  Text('Website: ${user['website']}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),
                  ),
                  Text('Address: ${user['address']['street']}, ${user['address']['city']}',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey
                    ),
                  ),
                ],
              ),
            );
          }
      ),
    );
  }
}
