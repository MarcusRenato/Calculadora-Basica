import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController n1 = TextEditingController();
  TextEditingController n2 = TextEditingController();

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String _result = "Digite os valores e aguarde pelo resultado";

  void restar() {
    n1.text = "";
    n2.text = "";

    setState(() {
      _result = "Digite os valores e aguarde pelo resultado";
    });
  }

  void _somar() {
    setState(() {
      int num1 = int.parse(n1.text);
      int num2 = int.parse(n2.text);

      int tot = num1 + num2;
      _result = "$num1 + $num2 = $tot";
    });
  }

  void _subtracao() {
    setState(() {
      int num1 = int.parse(n1.text);
      int num2 = int.parse(n2.text);

      int tot = num1 - num2;
      _result = "$num1 - $num2 = $tot";
    });
  }

  void _multiplicacao() {
    setState(() {
      int num1 = int.parse(n1.text);
      int num2 = int.parse(n2.text);

      int tot = num1 * num2;
      _result = "$num1 * $num2 = $tot";
    });
  }

  void _divisao() {
    setState(() {
      if (n2.text == "0") {
        _result = "Não pode haver divisão por 0";
      } else {
        int num1 = int.parse(n1.text);
        int num2 = int.parse(n2.text);
        double tot = num1 / num2;

        _result = "$num1 / $num2 = ${tot.toStringAsPrecision(2)}";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Calculadora básica",
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.deepPurple,
        centerTitle: true,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: restar,
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(15, 30, 15, 30),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.keyboard_arrow_right,
                      size: 75,
                      color: Colors.deepPurple,
                    ),
                    Icon(
                      Icons.add,
                      size: 100,
                      color: Colors.deepPurple,
                    ),
                    Icon(
                      Icons.clear,
                      size: 100,
                      color: Colors.deepPurple,
                    ),
                    Icon(
                      Icons.keyboard_arrow_left,
                      size: 75,
                      color: Colors.deepPurple,
                    )
                  ],
                ),
              ),
              Text(
                _result,
                style: TextStyle(fontSize: 30, color: Colors.deepPurple),
                textAlign: TextAlign.center,
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: "1º Número",
                      labelStyle:
                          TextStyle(color: Colors.deepPurple, fontSize: 30)),
                  controller: n1,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.deepPurple, fontSize: 30),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Insira um valor!";
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 20),
                child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        labelText: "2º Número",
                        labelStyle:
                            TextStyle(color: Colors.deepPurple, fontSize: 30)),
                    controller: n2,
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.deepPurple, fontSize: 30),
                    validator: (value) {
                      if (value.isEmpty) {
                        return "Insira um número";
                      }
                    }),
              ),
              Container(
                padding: EdgeInsets.only(bottom: 15),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _somar();
                          }
                        },
                        child: Text(
                          "+",
                          style: TextStyle(fontSize: 50),
                        ),
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _subtracao();
                          }
                        },
                        child: Text(
                          "-",
                          style: TextStyle(fontSize: 50),
                        ),
                        color: Colors.deepPurple,
                        textColor: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _multiplicacao();
                        }
                      },
                      child: Text(
                        "*",
                        style: TextStyle(fontSize: 50),
                      ),
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    ),
                  ),
                  Expanded(
                    child: RaisedButton(
                      onPressed: () {
                        if (_formKey.currentState.validate()) {
                          _divisao();
                        }
                      },
                      child: Text(
                        "/",
                        style: TextStyle(fontSize: 50),
                      ),
                      color: Colors.deepPurple,
                      textColor: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
