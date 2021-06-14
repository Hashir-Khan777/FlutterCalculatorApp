import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class CalculatorApp extends StatefulWidget {
  const CalculatorApp({Key? key}) : super(key: key);

  @override
  _CalculatorAppState createState() => _CalculatorAppState();
}

class _CalculatorAppState extends State<CalculatorApp> {
  var input = "";

  buttonPressed(value) {
    setState(() {
      input = input + value;
    });
  }

  clear() {
    setState(() {
      input = "";
    });
  }

  equal() {
    Parser parse = Parser();
    Expression exp = parse.parse(input);
    ContextModel cm = ContextModel();
    var eval = exp.evaluate(EvaluationType.REAL, cm);
    setState(() {
      input = eval.toString();
    });
  }

  Widget button(text, clearButton, equalButton) => ElevatedButton(
      onPressed: clearButton
          ? clear
          : equalButton
              ? equal
              : () => buttonPressed(text),
      child: Text(text));

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator App',
      home: Scaffold(
        appBar: AppBar(
          title: Center(child: Text('Calculator App')),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Text(
                input,
                style: TextStyle(fontSize: 30),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("1", false, false),
                button("2", false, false),
                button("3", false, false),
                button("4", false, false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("5", false, false),
                button("5", false, false),
                button("7", false, false),
                button("8", false, false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("9", false, false),
                button("0", false, false),
                button("+", false, false),
                button("-", false, false),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                button("*", false, false),
                button("/", false, false),
                button("clear", true, false),
                button("=", false, true),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
