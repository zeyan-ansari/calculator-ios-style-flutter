import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(title: 'Calculator'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  String output = "0";

  String _output = "0";
  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText){

    if(buttonText == "CLEAR"){

      _output = "0";
      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else if (buttonText == "+" || buttonText == "-" || buttonText == "/" || buttonText == "X"){

      num1 = double.parse(output);

      operand = buttonText;

      _output = "0";

    } else if(buttonText == "."){

      if(_output.contains(".")){
        print("Already conatains a decimals");
        return;

      } else {
        _output = _output + buttonText;
      }

    } else if (buttonText == "="){

      num2 = double.parse(output);

      if(operand == "+"){
        _output = (num1 + num2).toString();
      }
      if(operand == "-"){
        _output = (num1 - num2).toString();
      }
      if(operand == "X"){
        _output = (num1 * num2).toString();
      }
      if(operand == "/"){
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";

    } else {

      _output = _output + buttonText;

    }

    print(_output);

    setState(() {

      output = double.parse(_output).toStringAsFixed(2);

    });

  }

  Widget numberButton(String buttonText) {
    return Container(margin:  EdgeInsets.symmetric(horizontal: 0,vertical: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffA5A5A5),
//        boxShadow: [BoxShadow(
//            color: Color(0xff003f5c),
//            blurRadius: 10,
//            spreadRadius: 5
//        )]
    ),
      child: new MaterialButton(highlightColor: Colors.transparent,splashColor: Colors.transparent,
        padding: new EdgeInsets.all(20.0),
        child: new Text(buttonText,
          style: TextStyle(color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }
  Widget operatorButton(String buttonText) {
    return Container(margin:  EdgeInsets.symmetric(horizontal: 2,vertical: 8),decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Color(0xffF59D0B),
//        boxShadow: [BoxShadow(
//            color: Color(0xfffb5b5a),
//            blurRadius: 10,
//            spreadRadius: 5
//        )]
    ),
      child: new MaterialButton(highlightColor: Colors.transparent,splashColor: Colors.transparent,
        padding: new EdgeInsets.all(20.0),
        child: new Text(buttonText,
          style: TextStyle(color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }
  Widget equalButton(String buttonText) {
    return Container(margin:  EdgeInsets.symmetric(horizontal: 2,vertical: 8),
      decoration: BoxDecoration(
        shape: BoxShape.circle,

        color: Color(0xff333333),
//        boxShadow: [BoxShadow(
//            color: Color(0xffeeeeee),
//            blurRadius: 10,
//            spreadRadius: 5
//        )]
    ),
      child: new MaterialButton(highlightColor: Colors.transparent,splashColor: Colors.transparent,
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
          style: TextStyle(color: Colors.white,
              fontSize: 22.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }
  Widget clearButton(String buttonText) {
    return Container(margin: EdgeInsets.fromLTRB(15,15,15,15),width:MediaQuery.of(context).size.width*0.6427,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(80),

          color: Color(0xff333333),
//          boxShadow: [BoxShadow(
//              color: Color(0xffeeeeee),
//              blurRadius: 10,
//              spreadRadius: 5
//          )]
      ),
      child: new MaterialButton(highlightColor: Colors.transparent,splashColor: Colors.transparent,
        padding: new EdgeInsets.all(24.0),
        child: new Text(buttonText,
          style: TextStyle(color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold
          ),
        ),
        onPressed: () =>
            buttonPressed(buttonText)
        ,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(backgroundColor: Colors.black,

        body: new Container(
            child: new Column(
              children: <Widget>[
                new Container(margin: EdgeInsets.only(top: 50),
                    alignment: Alignment.centerRight,
                    padding: new EdgeInsets.symmetric(
                        vertical: 25.0,
                        horizontal: 25.0
                    ),
                    child: new Text(output, style: new TextStyle(
                      fontSize: 48.0,color: Colors.white,
                      fontWeight: FontWeight.bold,

                    ))),
                new Expanded(
                  child: new Divider(),
                ),


                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[

                        new Column(children: [
                          new Row(children: [
                            numberButton("7"),
                            numberButton("8"),
                            numberButton("9"),

                          ]),

                          new Row(children: [
                            numberButton("4"),
                            numberButton("5"),
                            numberButton("6"),

                          ]),

                          new Row(children: [
                            numberButton("1"),
                            numberButton("2"),
                            numberButton("3"),

                          ]),


                          new Row(children: [
                            numberButton("."),
                            numberButton("0"),
                            numberButton("00"),

                          ]),



                        ]),
                        new Column(children: <Widget>[
                          operatorButton("/"),
                          operatorButton("X"),
                          operatorButton("-"),
                          operatorButton("+")
                        ],),


                      ],
                    ),
                    new Row(children: [
                      clearButton("CLEAR"),
                      equalButton("="),
                    ])
                  ],
                )
              ],
            )));
  }
}
