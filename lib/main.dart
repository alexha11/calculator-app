import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {
  double sum = 0;
  double preValue = 0;
  String output = '';
  String rememOperand = '';
  onButtonClick(val) {
    if(val == "C") {
      sum = 0;
      preValue = 0;
      output = '';
      rememOperand = '';
    }
    else if (val == "+") {
      sum = sum + preValue;
      print(sum);
      output = '+';
      rememOperand = '+';
      preValue = 0;
    }
    else if (val == '-') {
      sum = sum - preValue;
      if (rememOperand == '') {
        sum = preValue;
      }
      print(sum);
      output = '-';
      rememOperand = '-';
      preValue = 0;
    }
    else if (val == '=') {
      if (rememOperand == '+') {
        sum = sum + preValue;

      }
      else {
        sum = sum - preValue;
      }
      output = sum.toStringAsFixed(2);
      sum = 0;
      preValue = 0;
    }
    else {
      preValue = preValue * 10 + double.parse(val);
      output = preValue.toStringAsFixed(2);
    }
    setState(() {
      output = output;
    });
  }

  Widget createButtonSign(String text) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(fontSize:25.0),
          ),
        ),
      ),
    );
  }

  Widget createButton(String text) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: TextButton(
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all<Color>(Colors.black),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              CircleBorder(),
            ),
          ),
          onPressed: () => onButtonClick(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 30.0),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator App"),
        ),
        body: Container(
          padding: EdgeInsets.all(45.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.bottomLeft,
                child: Text(
                  output,
                  style: TextStyle(fontSize: 20.0),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Row(
                children: [
                  createButton("1"),
                  createButton("2"),
                  createButton("3"),
                  createButtonSign("+"),

                ],
              ),
              Row(
                children: [
                  createButton("4"),
                  createButton("5"),
                  createButton("6"),
                  createButtonSign("-"),
                ],
              ),
              Row(
                children: [
                  createButton("7"),
                  createButton("8"),
                  createButton("9"),
                  createButtonSign(""),
                ],
              ),
              Row(
                children: [
                  createButton("C"),
                  createButton("0"),
                  createButton(""),
                  createButtonSign("="),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
