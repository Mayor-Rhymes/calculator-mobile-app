import 'package:calculator/components/button.dart';
import 'package:calculator/components/buttonsection.dart';
import 'package:calculator/components/input.dart';
import 'package:flutter/material.dart';

import 'components/buttonrow.dart';

class Home extends StatefulWidget {
  const Home({super.key, required this.title});

  final String title;

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController controller = TextEditingController();
  String _screenValue = "";

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      controller.value = TextEditingValue(
        text: _screenValue,
      );
    });
  }

  void handleInput(String value) {
    setState(() {
      _screenValue += value;
      controller.value = TextEditingValue(
        text: _screenValue,
        selection: TextSelection.fromPosition(
          TextPosition(offset: _screenValue.length),
        ),
      );
    });
  }

  void handleBackSpace() {
    if (_screenValue.isNotEmpty) {
      setState(() {
        _screenValue = _screenValue.substring(0, _screenValue.length - 1);
        controller.value = TextEditingValue(
          text: _screenValue,
        );
      });
    }
  }

  void handleBracket() {
    if (_screenValue.isEmpty) {
      setState(() {
        _screenValue += "(";

        controller.value = TextEditingValue(text: _screenValue);
      });
    } else if (double.tryParse(_screenValue[_screenValue.length - 1]) is num &&
        _screenValue.contains("(")) {
      setState(() {
        _screenValue += ")";

        controller.value = TextEditingValue(text: _screenValue);
      });
    } else if (double.tryParse(_screenValue[_screenValue.length - 1]) is num) {
      setState(() {
        _screenValue += "x(";
        controller.value = TextEditingValue(text: _screenValue);
      });
    }
  }

  void handlePercent() {
    if (_screenValue.isNotEmpty && double.tryParse(_screenValue) is num) {
      setState(() {
        _screenValue += '%';
        controller.value = TextEditingValue(text: _screenValue);
      });
    }
  }


  void handleSign() {
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Column(children: <Widget>[
      Input(controller: controller),
      Expanded(
          child: ButtonSection(children: <Widget>[
        ButtonRow(children: [
          IconButton(
            icon: const Icon(Icons.history),
            onPressed: () {},
            iconSize: 30,
          ),
          IconButton(
            icon: const Icon(Icons.scale_rounded),
            onPressed: () {},
            iconSize: 30,
          ),
          IconButton(
            icon: const Icon(Icons.science),
            onPressed: () {},
            iconSize: 30,
          ),
          IconButton(
            icon: const Icon(Icons.backspace),
            color: Colors.green,
            onPressed: () {
              handleBackSpace();
            },
            iconSize: 30,
          ),
        ]),
        const SizedBox(height: 20),
        ButtonRow(children: [
          CalculatorButton(
              title: "C",
              textColor: Colors.red,
              onPressed: () {
                setState(() {
                  _screenValue = '';
                  controller.value = TextEditingValue.empty;
                });
              }),
          CalculatorButton(
            title: "( )",
            textColor: Colors.green,
            // onPressed: () {
            //   handleBracket();
            // },
          ),
          CalculatorButton(
            title: "%",
            textColor: Colors.green,
            onPressed: () {
              handlePercent();
            },
          ),
          CalculatorButton(
            title: "/",
            textColor: Colors.green,
          ),
        ]),
        const SizedBox(height: 9),
        ButtonRow(children: [
          CalculatorButton(
              title: "7",
              onPressed: () {
                handleInput("7");
              }),
          CalculatorButton(
            title: "8",
            onPressed: () {
              handleInput("8");
            },
          ),
          CalculatorButton(
              title: "9",
              onPressed: () {
                handleInput("9");
              }),
          CalculatorButton(
              title: "x",
              textColor: Colors.green,
              onPressed: () {
                handleInput("x");
              }),
        ]),
        const SizedBox(height: 9),
        ButtonRow(children: [
          CalculatorButton(
              title: "4",
              onPressed: () {
                handleInput("4");
              }),
          CalculatorButton(
              title: "5",
              onPressed: () {
                handleInput("5");
              }),
          CalculatorButton(
              title: "6",
              onPressed: () {
                handleInput("6");
              }),
          CalculatorButton(
              title: "-",
              textColor: Colors.green,
              onPressed: () {
                handleInput("-");
              }),
        ]),
        const SizedBox(height: 9),
        ButtonRow(children: [
          CalculatorButton(
              title: "1",
              onPressed: () {
                handleInput("1");
              }),
          CalculatorButton(
              title: "2",
              onPressed: () {
                handleInput("2");
              }),
          CalculatorButton(
              title: "3",
              onPressed: () {
                handleInput("3");
              }),
          CalculatorButton(
              title: "+",
              textColor: Colors.green,
              onPressed: () {
                handleInput("+");
              }),
        ]),
        const SizedBox(height: 9),
        ButtonRow(children: [
          CalculatorButton(
            title: "+/-",
          ),
          CalculatorButton(
              title: "0",
              onPressed: () {
                handleInput("0");
              }),
          CalculatorButton(
              title: ".",
              onPressed: () {
                handleInput(".");
              }),
          CalculatorButton(
            title: "=",
            buttonColor: Colors.green,
            textSize: 30,
          ),
        ]),
      ]))
    ])));
  }
}
