import 'package:flutter/material.dart';

class ToDoApp extends StatefulWidget {
  const ToDoApp({super.key});

  @override
  State<ToDoApp> createState() => _ToDoAppState();
}

class _ToDoAppState extends State<ToDoApp> {

  void _addTask(){
    if(taskController.text.isNotEmpty){
      setState(() {
        _tasks.add(taskController.text);
        taskController.clear();
      });
    }
  }

  void _deleteTask(int index){
    setState(() {
      _tasks.removeAt(index);
    });
  }

  List<String> _tasks = [];
  TextEditingController taskController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('To Do App', style: TextStyle(
          fontSize: 30,
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),),
        centerTitle: true,
        backgroundColor: Colors.deepPurpleAccent,
      ),

      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(child: TextField(
                  controller: taskController,
                  decoration: InputDecoration(
                    labelText: 'Enter a task',
                    labelStyle: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                      color: Colors.deepPurpleAccent,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                )),
                SizedBox(width: 10,),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: _addTask, child: Text("Add", style: TextStyle(
                  fontSize: 20,
                ),)),
              ],
            ),
            
            Expanded(
              child: ListView.builder(
                  itemCount: _tasks.length,
                  itemBuilder: (context,index){
                    return Card(
                      child: ListTile(
                        title: Text(_tasks[index]),
                        trailing: IconButton(
                            onPressed: ()=> _deleteTask(index), // ()=> this is lambda function. As onPressed requires a function, not the result of a function, we simply told onPressed to run the _deleteTask(index) when the delete button is pressed. Without the lambda function, onPressed directly runs the function, causing an error as the function is of void type, returns nothing.
                            icon: Icon(Icons.delete, color: Colors.red,)),
                      ),
                    );
                  }),
            )
            
          ],
        ),
      ),

    );
  }
}
