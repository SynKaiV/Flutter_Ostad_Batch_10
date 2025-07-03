import 'package:first_class/module_12/class_1/expense_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseTracker extends StatefulWidget {
  const ExpenseTracker({super.key});

  @override
  State<ExpenseTracker> createState() => _ExpenseTrackerState();
}

class _ExpenseTrackerState extends State<ExpenseTracker> {
  
  final List<String> categories = [
    'Food',
    'Transport',
    'Shopping',
    'Health',
    'Entertainment',
    'Other'
  ];

  final List<Expense> expense = [];
  
  double total = 0.0;
  
  void showForm(BuildContext context) {
    String selectedCategory = categories.first;
    TextEditingController titleController = TextEditingController();
    TextEditingController amountController = TextEditingController();
    DateTime expenseDateTime = DateTime.now();

    showModalBottomSheet(
        context: context,
        builder: (context){
        return Padding(
          padding: const EdgeInsets.only(
            left: 16,
            right: 16,
            top: 16
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  labelText: 'Title',
                  ),
                ),

              SizedBox(height: 10),

              TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'Amount',
                ),
              ),

              SizedBox(height: 10),

              DropdownButtonFormField(
                  items: categories.map((category) => DropdownMenuItem(
                    value: category, child: Text(category),)
                  ).toList(),
                  onChanged: (value) => selectedCategory = value!,
              decoration: InputDecoration(
                labelText: 'Select Category'
              ),),

              SizedBox(height: 20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.deepPurpleAccent,
                      foregroundColor: Colors.white,
                    ),
                    onPressed: (){
                      if(titleController.text.isNotEmpty ||
                      double.tryParse(amountController.text) != null){
                        addExpense(titleController.text,
                            double.parse(amountController.text),
                            expenseDateTime, selectedCategory);
                        Navigator.pop(context);
                      }
                    },
                    child: Text('Add Expense', style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),),),
              ),

              SizedBox(height: 20),
            ],
          ),
        );
        });
  }

  void addExpense(String title, double amount, DateTime date, String category) {
    setState(() {
      expense.add(Expense(title: title, amount: amount, date: date, category: category));
      total += amount;
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text('Expense Tracker',style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),),
        actions: [
          IconButton(
              onPressed: ()=> showForm(context),
              icon: Icon(Icons.add)),
        ],
      ),

      body: Column(
        children: [
          Center(
            child: Card(
              color: Colors.blueAccent,
              margin: const EdgeInsets.all(20.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30.0),
                child: Text('Total Expense: ৳ $total',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: expense.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.deepPurpleAccent,
                        child: Text(expense[index].category,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      
                      title: Text(expense[index].title,
                        style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      subtitle: Text(
                        DateFormat.yMMMd().format(expense[index].date)
                      ),
                    ),
                  );
                }
            ),
          )
        ],
      ),

      floatingActionButton: FloatingActionButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
          onPressed: ()=> showForm(context),
          backgroundColor: Colors.deepPurpleAccent,
          foregroundColor: Colors.white,
          child: Icon(Icons.add)
      ),
    );
  }
}
