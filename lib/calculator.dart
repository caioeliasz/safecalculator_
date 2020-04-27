
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:math_expressions/math_expressions.dart';
import 'hidden_storage.dart';


class calculator extends StatefulWidget {
  @override
  _calculadoraTesteState createState() => _calculadoraTesteState();
}
class _calculadoraTesteState extends State<calculator> {

  String equation = "0";
  String result = "0";
  String expression = "";

  buttonPressed(buttonText) {
    setState(() {
      if (buttonText == "C") {
        equation = "0";
        result = "0";
      } else if (buttonText == "<") {
        equation = equation.substring(0, equation.length - 1);
        if (equation == "") {
          equation = "0";
        }
      } else if (buttonText == "=") {
        if (equation == '0') {
          openHiddenPage(context,'Arquivos',);
        }

        expression = equation;

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = "ERROR";
        }
      } else {
        if (equation == "0") {
          equation = buttonText;
        } else {
          equation = equation + buttonText;
        }
      }
    }
    );
  }
  Widget buildButton(String buttonText, double buttonHeight, Color buttonColor) {
    return Container(
        height: MediaQuery
            .of(context)
            .size
            .width * 0.23 * buttonHeight,
        color: buttonColor,
        child: FlatButton(
            padding: EdgeInsets.all(5.0),
            onPressed: () => buttonPressed(buttonText),
            child: Text(
                buttonText,
                style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.normal)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
                side: BorderSide(
                    color: Colors.white,
                    width: buttonHeight,
                    style: BorderStyle.solid
                )
            )
        )
    );
  } //cria um botao na calculadora
  void Settings(BuildContext context){
    Navigator.push(context, MaterialPageRoute(
      builder: (context) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueGrey[900],
            title: Text('Configurações'),
          ),
          body: Container(
            height: 80,
            width: 400,
            margin: EdgeInsets.only(top: 20),
            decoration: BoxDecoration(color: Colors.black),
            child: FlatButton(
              child: Padding(
                padding: EdgeInsets.only(right: 100),
                child: Text("Definir senha",
                style: TextStyle(fontWeight: FontWeight.normal,fontSize: 20,color: Colors.white),
                ),
              ),
            ),
          ),
        );
      }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          actions: <Widget>[
            IconButton(
              alignment: Alignment.centerRight,
              color: Colors.white,
              icon: Icon(Icons.settings),
              onPressed: () => Settings(context),
            )
          ],
          backgroundColor: Colors.black,
          title: Text('Calculadora',
            style: TextStyle(color: Colors.white
              )
          )
      ),

      body: Column(
          children: <Widget>[

            Container(alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(equation, style: TextStyle(fontSize: 38.0))
            ),
            Container(alignment: Alignment.centerRight,
                padding: EdgeInsets.fromLTRB(10, 20, 10, 0),
                child: Text(result, style: TextStyle(fontSize: 48.0))
            ),

            Expanded(
                child: Divider()
            ),

            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.75,
                    child: Table(
                        children: [
                          TableRow(
                              children: [
                                buildButton("C", 1, Colors.tealAccent[400]),
                                buildButton("<", 1, Colors.cyan[300]),
                                buildButton("/", 1, Colors.cyan[300])
                              ]
                          ),
                          TableRow(
                              children: [
                                buildButton("7", 1, Colors.blueGrey[100]),
                                buildButton("8", 1, Colors.blueGrey[100]),
                                buildButton("9", 1, Colors.blueGrey[100])
                              ]
                          ),
                          TableRow(
                              children: [
                                buildButton("4", 1, Colors.blueGrey[100]),
                                buildButton("5", 1, Colors.blueGrey[100]),
                                buildButton("6", 1, Colors.blueGrey[100])
                              ]
                          ),
                          TableRow(
                              children: [
                                buildButton("1", 1, Colors.blueGrey[100]),
                                buildButton("2", 1, Colors.blueGrey[100]),
                                buildButton("3", 1, Colors.blueGrey[100])
                              ]
                          ),
                          TableRow(
                              children: [
                                buildButton(".", 1, Colors.blueGrey[100]),
                                buildButton("0", 1, Colors.blueGrey[100]),
                                buildButton("00", 1, Colors.blueGrey[100])
                              ]
                          ),
                        ]
                    ),
                  ),
                  Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.25,
                    child: Table(
                      children: [
                        TableRow(
                            children: [
                              buildButton("*", 1, Colors.cyan[300]),
                            ]
                        ),
                        TableRow(
                            children: [
                              buildButton("+", 1, Colors.cyan[300]),
                            ]
                        ),
                        TableRow(
                            children: [
                              buildButton("-", 1, Colors.cyan[300]),
                            ]
                        ),
                        TableRow(
                            children: [
                              buildButton("=", 2, Colors.tealAccent[400]),
                            ]
                        ),
                      ],
                    ),
                  )
                ]
            ),
          ]
      ),
    );
  }

}







