import 'package:flutter/material.dart';

import '../../widgets/calculatorButton.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({super.key});

  @override
  State<CalculatorApp> createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  String output = '';
  String input = '';
  String operator = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPress(String value){
    setState(() {
      if(value == 'C'){
        input = '';
        output = '';
        operator = '';
        num1 = 0;
        num2 = 0;
      }
      else if(value == '='){
        num2 = double.parse(input);
        if(operator == '+'){
          output = (num1 + num2).toString();
        }
        else if(operator == '-'){
          output = (num1 - num2).toString();
        }
        else if(operator == 'x'){
          output = (num1 * num2).toString();
        }
        else if(operator == '÷'){
          output = (num2 != 0) ? (num1 / num2).toString() : 'Syntax Error';
        }
        input = output;
      }
      else if(['+','-','x','÷'].contains(value)){
        num1 = double.parse(input);
        operator = value;
        input = '';
      }
      else {
        input += value;
        output = input;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Expanded(
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.all(25),
              child: Text(output,style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.bold,
                color: Colors.white
              ),),
            ),
          ),

          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('7'), text: '7'),
              calculatorButton(onClick: () => buttonPress('8'), text: '8'),
              calculatorButton(onClick: () => buttonPress('9'), text: '9'),
              calculatorButton(onClick: () => buttonPress('÷'), text: '÷', color: Colors.orange),
            ],
          ),

          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('4'), text: '4'),
              calculatorButton(onClick: () => buttonPress('5'), text: '5'),
              calculatorButton(onClick: () => buttonPress('6'), text: '6'),
              calculatorButton(onClick: () => buttonPress('x'), text: 'x', color: Colors.orange),
            ],
          ),

          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('1'), text: '1'),
              calculatorButton(onClick: () => buttonPress('2'), text: '2'),
              calculatorButton(onClick: () => buttonPress('3'), text: '3'),
              calculatorButton(onClick: () => buttonPress('-'), text: '-', color: Colors.orange),
            ],
          ),

          Row(
            children: [
              calculatorButton(onClick: () => buttonPress('C'), text: 'C', color: Colors.red),
              calculatorButton(onClick: () => buttonPress('0'), text: '0'),
              calculatorButton(onClick: () => buttonPress('='), text: '=', color: Colors.green),
              calculatorButton(onClick: () => buttonPress('+'), text: '+', color: Colors.orange),
            ],
          ),
        ],
      ),
    );
  }
}


