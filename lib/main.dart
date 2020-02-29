import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  double num1;
  double num2;
  String operand;
  String _output = "0";

  String output = "0";
  bool equalWasPressed = false;
  bool dotIsPressed = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      home: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Flexible(
                flex: 2,
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        "$output",
                        style: TextStyle(
                          fontSize: 100,
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 4,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          calculatorButton(
                            flex: 1,
                            buttonText: "C",
                            color: Colors.white70,
                            shapeBorder: CircleBorder(),
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "+/-",
                            color: Colors.white70,
                            shapeBorder: CircleBorder(),
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "%",
                            color: Colors.white70,
                            shapeBorder: CircleBorder(),
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "/",
                            color: Colors.orange,
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          calculatorButton(
                            flex: 1,
                            buttonText: "7",
                            shapeBorder: CircleBorder(),
                            color: Colors.white12,
                            textColor: Colors.white,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "8",
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                            color: Colors.white12,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "9",
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                            color: Colors.white12,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "x",
                            color: Colors.orange,
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          calculatorButton(
                            flex: 1,
                            buttonText: "4",
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                            color: Colors.white12,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "5",
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                            color: Colors.white12,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "6",
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                            color: Colors.white12,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "-",
                            color: Colors.orange,
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          calculatorButton(
                            flex: 1,
                            buttonText: "1",
                            shapeBorder: CircleBorder(),
                            color: Colors.white12,
                            textColor: Colors.white,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "2",
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                            color: Colors.white12,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "3",
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                            color: Colors.white12,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "+",
                            color: Colors.orange,
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          calculatorButton(
                              flex: 2,
                              color: Colors.white12,
                              textColor: Colors.white,
                              buttonText: "0",
                              shapeBorder: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50))),
                          calculatorButton(
                            flex: 1,
                            buttonText: ".",
                            shapeBorder: CircleBorder(),
                            color: Colors.white12,
                            textColor: Colors.white,
                          ),
                          calculatorButton(
                            flex: 1,
                            buttonText: "=",
                            color: Colors.orange,
                            shapeBorder: CircleBorder(),
                            textColor: Colors.white,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget calculatorButton(
      {String buttonText,
      Color color,
      ShapeBorder shapeBorder,
      Color textColor,
      int flex}) {
    return Flexible(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: RaisedButton(
          color: color,
          elevation: 0,
          shape: shapeBorder,
          onPressed: () {
            buttonPressed(buttonText);
          },
          child: Center(
            child: Text(
              buttonText,
              style: TextStyle(
                fontSize: 30.0,
                fontWeight: FontWeight.w800,
                color: textColor,
              ),
            ),
          ),
        ),
      ),
    );
  }

  buttonPressed(String buttonText) {
    if (buttonText == "C") {
      _output = "0";

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else if (buttonText == "%") {
      _output = (double.parse(_output) / 100).toString();
    } else if (buttonText == "+/-") {
      _output = (double.parse(_output) * -1).toString();
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "x") {
      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        print("Already conatains a decimals");
        return;
      } else {
        dotIsPressed = true;
        _output = _output + buttonText.toString();
      }
      dotIsPressed = false;
    } else if (buttonText == "=") {
      setState(() {
        equalWasPressed = true;
      });

      num2 = double.parse(output);

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }
      if (operand == "-") {
        _output = (num1 - num2).toString();
      }
      if (operand == "x") {
        _output = (num1 * num2).toString();
      }
      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      print("num 1 : $num1");
      print("num 2 : $num2");
      print("operand : $operand");
//else if (opperant is not any of these)

      num1 = 0.0;
      num2 = 0.0;

      operand = "";
    } else {
//if it is a number

      if (equalWasPressed) {
        _output = buttonText;

        setState(() {
          equalWasPressed = false;
        });
      } else {
        if (!equalWasPressed) {
          _output = _output + buttonText;
        }
      }
    }

    setState(() {
      print(_output);
//      if (dotIsPressed){
//        output = _output;
//      }
      print(equalWasPressed);
      output = format(double.parse(_output));
    });
  }

  String format(double n) {
    return n.toStringAsFixed(n.truncateToDouble() == n ? 0 : 4);
  }
}