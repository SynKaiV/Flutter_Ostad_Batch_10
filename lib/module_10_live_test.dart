import 'package:flutter/material.dart';

class ContactList extends StatefulWidget {
  const ContactList({super.key});

  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();
  List<Map<String, String>> contacts = [];

  void _addContact() {
    if (_nameController.text.isEmpty || _numberController.text.isEmpty) {
      return;
    }

    setState(() {
      contacts.add({
        'name': _nameController.text,
        'number': _numberController.text,
      });
      _nameController.clear();
      _numberController.clear();
    });
  }

  void _showDeleteDialog(int index) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmation'),
          content: Text(
            'Are you sure you want to delete?',
            style: const TextStyle(fontSize: 16),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton.icon(
                  onPressed: () => Navigator.of(context).pop(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey[300],
                    foregroundColor: Colors.black,
                  ),
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      contacts.removeAt(index);
                    });
                    Navigator.of(context).pop();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red[400],
                    foregroundColor: Colors.white,
                  ),
                  icon: const Icon(Icons.delete),
                  label: const Text('Delete'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contact List',style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),),
        centerTitle: true,
        backgroundColor: Colors.blueGrey,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            color: Colors.blueGrey[50],
            child: Column(
              children: [
                TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.blueGrey[800]),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                ),

                const SizedBox(height: 16),

                TextField(
                  controller: _numberController,
                  decoration: InputDecoration(
                    labelText: 'Number',
                    labelStyle: TextStyle(color: Colors.blueGrey[800]),
                    border: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blueGrey),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                ),

                const SizedBox(height: 16),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _addContact,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueGrey[800],
                      foregroundColor: Colors.white,
                    ),
                    child: const Text('Add',style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: contacts.length,
              itemBuilder: (context, index) {
                final contact = contacts[index];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  color: Colors.blueGrey[50],
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.blueGrey),
                    trailing: const Icon(Icons.phone, color: Colors.blue),
                    title: Text(
                      contact['name']!,
                      style: TextStyle(color: Colors.red),
                    ),
                    subtitle: Text(
                      contact['number']!,
                      style: TextStyle(color: Colors.black),
                    ),
                    onLongPress: () => _showDeleteDialog(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _nameController.dispose();
    _numberController.dispose();
    super.dispose();
  }
}