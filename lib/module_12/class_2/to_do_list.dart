import 'package:flutter/material.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});

  @override
  State<ToDoList> createState() => _ToDoListState();
}

class _ToDoListState extends State<ToDoList> {
  List<Map<String, dynamic>> tasks = [];
  bool showActiveTasks = true;

  int get activeCount =>
      tasks.where((task) => !task['isCompleted']).length;
  int get completedCount =>
      tasks.where((task) => task['isCompleted']).length;

  void _addTask(String task) {
    setState(() {
      tasks.add({'task': task, 'isCompleted': false});
      Navigator.pop(context);
    });
  }

  void _editTask(int index, String updatedTask) {
    setState(() {
      tasks[index]['task'] = updatedTask;
      Navigator.pop(context);
    });
  }

  void _showTaskDialog({int? index}) {
    TextEditingController taskController = TextEditingController(
      text: index != null ? tasks[index]['task'] : '',
    );

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(index != null ? 'Edit Task' : 'Add a Task'),
        content: TextField(
          controller: taskController,
          decoration: InputDecoration(
            hintText: 'Enter your task here',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(
              'Cancel',
              style: TextStyle(color: Colors.red, fontSize: 20),
            ),
          ),
          TextButton(
            onPressed: () {
              if (taskController.text.isNotEmpty) {
                if (index != null) {
                  _editTask(index, taskController.text);
                } else {
                  _addTask(taskController.text);
                }
              }
            },
            child: Text(
              'Save',
              style: TextStyle(color: Colors.green, fontSize: 20),
            ),
          ),
        ],
      ),
    );
  }

  void toggleTaskStatus(int index) {
    setState(() {
      tasks[index]['isCompleted'] = !tasks[index]['isCompleted'];
    });
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> filteredTasks = tasks
        .where((task) => task['isCompleted'] != showActiveTasks)
        .toList();

    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "To-Do App",
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    showActiveTasks = true;
                  });
                },
                child: Card(
                  child: Container(
                    margin: EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6,
                          spreadRadius: 4,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            activeCount.toString(),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            'Active Tasks',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              InkWell(
                onTap: () {
                  setState(() {
                    showActiveTasks = false;
                  });
                },
                child: Card(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.greenAccent,
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey,
                          blurRadius: 6,
                          spreadRadius: 4,
                          offset: Offset(3, 3),
                        ),
                      ],
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        children: [
                          Text(
                            completedCount.toString(),
                            style: TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),
                          ),
                          Text(
                            'Completed Tasks',
                            style: TextStyle(
                                fontSize: 23,
                                fontWeight: FontWeight.w500,
                                color: Colors.black),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: filteredTasks.length,
              itemBuilder: (context, index) {
                final task = filteredTasks[index];
                final originalIndex = tasks.indexOf(task);

                return Dismissible(
                  key: Key(UniqueKey().toString()),
                  background: Container(
                    color: Colors.greenAccent,
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.check_box,
                        color: Colors.white, size: 40),
                  ),
                  secondaryBackground: Container(
                    color: Colors.redAccent,
                    child: Icon(Icons.delete,
                        color: Colors.white, size: 40),
                  ),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.startToEnd) {
                      toggleTaskStatus(originalIndex);
                    }
                    else {
                      deleteTask(originalIndex);
                    }
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(
                        task['task'],
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                          color: Colors.black,
                          decoration: task['isCompleted']
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      leading: Checkbox(
                        shape: CircleBorder(),
                        value: task['isCompleted'],
                        onChanged: (value) =>
                            toggleTaskStatus(originalIndex),
                      ),
                      trailing: IconButton(
                        onPressed: () =>
                            _showTaskDialog(index: originalIndex),
                        icon: Icon(
                          Icons.edit,
                          color: Colors.deepPurpleAccent,
                          size: 28,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.lightBlue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        onPressed: _showTaskDialog,
        child: Icon(Icons.add, size: 30, color: Colors.white),
      ),
    );
  }
}