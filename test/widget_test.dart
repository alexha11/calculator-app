import 'package:flutter/material.dart';

void main() => runApp(Calculator());

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _output = "0";
  double _num1 = 0;
  double _num2 = 0;
  String _operand = "";

  void _buttonPressed(String text) {
    if (text == "C") {
      _output = "0";
      _num1 = 0;
      _num2 = 0;
      _operand = "";
    } else if (text == "+" || text == "-" || text == "=") {
      if (_num1 == 0) {
        _num1 = double.parse(_output);
      } else {
        _num2 = double.parse(_output);
      }
      if (_operand == "+") {
        _output = (_num1 + _num2).toString();
      } else if (_operand == "-") {
        _output = (_num1 - _num2).toString();
      }
      _operand = text;
      _num1 = double.parse(_output);
    } else {
      if (_output == "0") {
        _output = text;
      } else {
        _output += text;
      }
    }
    setState(() {
      _output = _output;
    });
  }

  Widget _buildButton(String text) {
    return Expanded(
      child: FlatButton(
        padding: EdgeInsets.all(24.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 32.0),
        ),
        onPressed: () {
          _buttonPressed(text);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator"),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.centerRight,
                child: Text(
                  _output,
                  style: TextStyle(fontSize: 64.0),
                ),
              ),
              Expanded(
                child: Divider(),
              ),
              Row(
                children: [
                  _buildButton("1"),
                  _buildButton("2"),
                  _buildButton("3"),
                ],
              ),
              Row(
                children: [
                  _buildButton("4"),
                  _buildButton("5"),
                  _buildButton("6"),
                ],
              ),
              Row(
                children: [
                  _buildButton("7"),
                  _buildButton("8"),
                  _buildButton("9"),
                ],
              ),
              Row(
                children: [
                  _buildButton("C"),
                  _buildButton("0"),
                  _buildButton("="),
                ],
              ),
              Row(
                children: [
                  _buildButton("+"),
                  _buildButton("-"),
                  SizedBox(width: 24.0),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
