
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
            .width * 0.20 * buttonHeight,
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          title: Padding(
            padding: const EdgeInsets.only(left: 80.0),
            child: Text('Calculadora',
              style: TextStyle(color: Colors.white
                )
            ),
          )
      ),
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Icon(Icons.account_circle, size: 100, color: Colors.white,),
              decoration: BoxDecoration(
                gradient: LinearGradient(colors: <Color>[
                  Colors.orange,
                  Colors.orange[300]])
              )
            ),
            CustomListTile(Icons.lock, 'Definir uma senha',() => PassWord(context)),
            CustomListTile(Icons.lock_open, 'Redefinir Senha',() => RedifinePassWord(context))
          ],
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
                                buildButton("C", 1, Colors.orange[400]),
                                buildButton("<", 1, Colors.orange[400]),
                                buildButton("/", 1, Colors.orange[400])
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
                              buildButton("*", 1, Colors.orange[400]),
                            ]
                        ),
                        TableRow(
                            children: [
                              buildButton("+", 1, Colors.orange[400]),
                            ]
                        ),
                        TableRow(
                            children: [
                              buildButton("-", 1, Colors.orange[400]),
                            ]
                        ),
                        TableRow(
                            children: [
                              buildButton("=", 2, Colors.blueAccent),
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

void PassWord(BuildContext context){
  Navigator.push(context, MaterialPageRoute(
    builder: (context){
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.orange,
          title: Text('Definir uma senha'),
        ),
        body: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50),
              padding: EdgeInsets.fromLTRB(8, 8, 8, 0),
              alignment: Alignment.topLeft,
              child: Text('Criando uma conta.',
                style: TextStyle(fontSize: 35),),),
            Container(
              margin: EdgeInsets.only(right: 50),
              padding: EdgeInsets.fromLTRB(8, 0, 8, 5),
              alignment: Alignment.topLeft,
              child: Text('Criando uma conta, você poderá redefiní-la posteriormente.',
                style: TextStyle(fontSize: 15),),),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          bottom: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          left: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          right: BorderSide(
                              color: Colors.grey.shade400
                          ),
                        )
                    ),
                    margin: EdgeInsets.all(10),
                    width: 400,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.account_circle),
                        ),
                        Text('Usuario',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                Container(
                  alignment: Alignment.center,
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                                color: Colors.grey.shade400
                            ),
                          bottom: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          left: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          right: BorderSide(
                              color: Colors.grey.shade400
                          ),
                        )
                    ),
                    margin: EdgeInsets.all(10),
                    width: 400,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.lock_outline),
                        ),
                        Text('Senha',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(top: 80,bottom: 8),
              child: Text('Defina seu PIN',
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  border: Border(
                    top: BorderSide(
                        color: Colors.grey.shade500
                    ),
                    bottom: BorderSide(
                        color: Colors.grey.shade500
                    ),
                    left: BorderSide(
                        color: Colors.grey.shade500
                    ),
                    right: BorderSide(
                        color: Colors.grey.shade500
                    ),
                  )
              ),
              child: Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(Icons.lock_open),
                  ),
                  Text('PIN',style: TextStyle(fontSize: 18),)
                ],
              ),
              width: 100,
              height: 40,
            ),
            Container(
              margin: EdgeInsets.only(top: 110),
              alignment: Alignment.bottomCenter,
              child: RaisedButton(
                onPressed: (){},
                elevation: 10,
                color: Colors.orange,
                child: Text('Criar conta.',style: TextStyle(color: Colors.white),),
              ),
            )
          ],
        ),
      );
    }
  ));
}
void RedifinePassWord(BuildContext context){
  Navigator.push(context, MaterialPageRoute(
      builder: (context){
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.blueAccent,
            title: Text('Definir uma senha'),
          ),
          body: Column(
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.fromLTRB(8, 8, 8, 2),
                alignment: Alignment.topLeft,
                child: Text('Redefinindo sua senha.',
                  style: TextStyle(fontSize: 35),),),
              Container(
                margin: EdgeInsets.only(bottom: 5),
                padding: EdgeInsets.fromLTRB(8, 2, 8, 4),
                alignment: Alignment.topLeft,
                child: Text('Através da sua conta, redefina seu PIN.',
                  style: TextStyle(fontSize: 15),),),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          bottom: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          left: BorderSide(
                              color: Colors.grey.shade400
                          ),
                          right: BorderSide(
                              color: Colors.grey.shade400
                          ),
                        )
                    ),
                    margin: EdgeInsets.all(10),
                    width: 400,
                    height: 40,
                    child: Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(Icons.account_circle),
                        ),
                        Text('Usuario',style: TextStyle(fontSize: 15),)
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border(
                            top: BorderSide(
                                color: Colors.grey.shade400
                            ),
                            bottom: BorderSide(
                                color: Colors.grey.shade400
                            ),
                            left: BorderSide(
                                color: Colors.grey.shade400
                            ),
                            right: BorderSide(
                                color: Colors.grey.shade400
                            ),
                          )
                      ),
                      margin: EdgeInsets.all(10),
                      width: 400,
                      height: 40,
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.lock_outline),
                          ),
                          Text('Senha',style: TextStyle(fontSize: 15),)
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 80,bottom: 8),
                child: Text('Redefina seu PIN',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(
                          color: Colors.grey.shade500
                      ),
                      bottom: BorderSide(
                          color: Colors.grey.shade500
                      ),
                      left: BorderSide(
                          color: Colors.grey.shade500
                      ),
                      right: BorderSide(
                          color: Colors.grey.shade500
                      ),
                    )
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Icon(Icons.lock_open),
                    ),
                    Text('PIN',style: TextStyle(fontSize: 18),)
                  ],
                ),
                width: 100,
                height: 40,
              ),
              Container(
                margin: EdgeInsets.only(top: 120),
                alignment: Alignment.bottomCenter,
                child: RaisedButton(
                  onPressed: (){},
                  elevation: 10,
                  color: Colors.blueAccent,
                  child: Text('Redefinir senha.', style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        );
      }
  ));
}

class CustomListTile extends StatelessWidget {

  IconData icon;
  String text;
  Function ontap;

  CustomListTile(this.icon, this.text,this.ontap);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 8.0, right: 8),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: Colors.grey.shade400
            )
          )
        ),
        height: 50,
        child: FlatButton(
          onPressed: ontap,
          splashColor: Colors.blueAccent,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Row(
                children: <Widget>[
                  Icon(icon),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(text,style: TextStyle(
                      fontSize: 16
                    ),
                    ),
                  ),
                ],
              ),
              Icon(Icons.arrow_right)
            ],
          ),
        ),
      ),
    );
  }
}










