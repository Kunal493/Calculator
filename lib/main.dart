import 'package:flutter/material.dart';
import 'calculator_logic.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String _expression = '';
  String _result = '';

  void _onButtonPressed(String value) {
    setState(() {
      if (value == 'C') {
        _expression = '';
      } else if (value == 'AC') {
        _expression = '';
        _result = '';
      } else if (value == 'DEL') {
        if (_expression.isNotEmpty) {
          _expression = _expression.substring(0, _expression.length - 1);
        }
      } else if (value == '=') {
        try {
          _result = CalculatorLogic.evaluate(_expression);
        } catch (e) {
          _result = 'Error';
        }
      } else {
        _expression += value;
      }
    });
  }

  Widget _buildButton(String text, Color color, Color textColor) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: color,
            padding: EdgeInsets.all(20.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
          onPressed: () => _onButtonPressed(text),
          child: Text(
            text,
            style: TextStyle(fontSize: 20.0, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Calculator'),
        backgroundColor: Colors.blue,
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20.0),
              alignment: Alignment.bottomRight,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    _expression,
                    style: TextStyle(fontSize: 30.0, color: Colors.black54),
                  ),
                  Text(
                    _result,
                    style: TextStyle(fontSize: 40.0, color: Colors.black),
                  ),
                ],
              ),
            ),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  _buildButton('C', Colors.red, Colors.white),
                  _buildButton('DEL', Colors.orange, Colors.white),
                  _buildButton('%', Colors.blue, Colors.white),
                  _buildButton('/', Colors.blue, Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('7', Colors.black54, Colors.white),
                  _buildButton('8', Colors.black54, Colors.white),
                  _buildButton('9', Colors.black54, Colors.white),
                  _buildButton('*', Colors.blue, Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('4', Colors.black54, Colors.white),
                  _buildButton('5', Colors.black54, Colors.white),
                  _buildButton('6', Colors.black54, Colors.white),
                  _buildButton('-', Colors.blue, Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('1', Colors.black54, Colors.white),
                  _buildButton('2', Colors.black54, Colors.white),
                  _buildButton('3', Colors.black54, Colors.white),
                  _buildButton('+', Colors.blue, Colors.white),
                ],
              ),
              Row(
                children: <Widget>[
                  _buildButton('AC', Colors.red, Colors.white),
                  _buildButton('0', Colors.black54, Colors.white),
                  _buildButton('.', Colors.black54, Colors.white),
                  _buildButton('=', Colors.green, Colors.white),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
