import 'package:flutter/material.dart';
import 'dart:math';

void main() => runApp(CalculatorApp());

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Calculator(),
    );
  }
}

class Calculator extends StatefulWidget {
  @override
  _CalculatorState createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String entrada = '';
  String salida = '';
  double number1 = 0;
  double number2 = 0;
  String operacion = '';

  void presionarBoton(String botonTexto) {
    setState(() {
      if (botonTexto == 'C') {
        entrada = '';
        salida = '';
        number1 = 0;
        number2 = 0;
        operacion = '';
      } else if (botonTexto == '+' ||
          botonTexto == '-' ||
          botonTexto == 'x' ||
          botonTexto == '/') {
        number1 = double.parse(entrada);
        operacion = botonTexto;
        entrada = '';
      } else if (botonTexto == '=') {
        number2 = double.parse(entrada);
        if (operacion == '+') {
          entrada = (number1 + number2).toString();
        } else if (operacion == '-') {
          entrada = (number1 - number2).toString();
        } else if (operacion == 'x') {
          entrada = (number1 * number2).toString();
        } else if (operacion == '/') {
          entrada = (number1 / number2).toString();
        }
        number1 = 0;
        number2 = 0;
        operacion = '';
      } else if (botonTexto == '⌫') {
        // Manejar el botón de retroceso
        if (entrada.isNotEmpty) {
          entrada = entrada.substring(0, entrada.length - 1);
        }
      } else if (botonTexto == '√') {
        // Manejar el botón de raíz cuadrada
        entrada = (sqrt(double.parse(entrada))).toString();
      } else if (botonTexto == '^2') {
        // Manejar el botón de al cuadrado
        entrada = (pow(double.parse(entrada), 2)).toString();
      } else if (botonTexto == ',') {
        // Manejar el botón de coma decimal
        if (!entrada.contains(',')) {
          entrada += botonTexto;
        }
      } else {
        entrada += botonTexto;
      }
    });
  }

  Widget construirBoton(String botonTexto) {
    return Expanded(
      child: TextButton(
        onPressed: () => presionarBoton(botonTexto),
        child: Text(
          botonTexto,
          style: TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lab 04 PE Calculadora'),
      ),
      body: Column(
        children: <Widget>[
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              entrada,
              style: TextStyle(fontSize: 36.0),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
            child: Text(
              salida,
              style: TextStyle(fontSize: 48.0),
            ),
          ),
          Expanded(
            child: Divider(),
          ),
          Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  construirBoton('C'),
                  construirBoton('^2'),
                  construirBoton('⌫'),
                  construirBoton('/')
                ],
              ),
              Row(
                children: <Widget>[
                  construirBoton('7'),
                  construirBoton('8'),
                  construirBoton('9'),
                  construirBoton('x')
                ],
              ),
              Row(
                children: <Widget>[
                  construirBoton('4'),
                  construirBoton('5'),
                  construirBoton('6'),
                  construirBoton('-')
                ],
              ),
              Row(
                children: <Widget>[
                  construirBoton('1'),
                  construirBoton('2'),
                  construirBoton('3'),
                  construirBoton('+')
                ],
              ),
              Row(
                children: <Widget>[
                  construirBoton('√'),
                  construirBoton('0'),
                  construirBoton(','),
                  construirBoton('=')
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
