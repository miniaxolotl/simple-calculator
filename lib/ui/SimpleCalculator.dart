import 'package:calculator/widget/TextKey.dart';
import 'package:calculator/widget/IconKey.dart';
import 'package:flutter/material.dart';

import 'package:math_expressions/math_expressions.dart';

class SimpleCalculator extends StatefulWidget {
	@override
	_SimpleCalculatorState createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  String equation = "0";
  String result = "0";
  String expression = "";

  buttonPressed({String? text, Icon? icon}){
    setState(() {
      if(text != null){
        if(text == "C") {
          equation = "0";
          result = "0";
        } else {
          if(equation == "0"){
            equation = text;
          }else {
            equation = equation + text;
          }
        }
      } else if(icon != null){
        if(icon.icon?.codePoint == Icons.arrow_back_sharp.codePoint) {
          equation = equation.substring(0, equation.length - 1);
          if(equation == ""){
            equation = "0";
          }
        } else if(icon.icon?.codePoint == Icons.subdirectory_arrow_left.codePoint) {
          expression = equation;
          expression = expression.replaceAll('×', '*');
          expression = expression.replaceAll('÷', '/');

          try{
            Parser p = Parser();
            Expression exp = p.parse(expression);

            ContextModel cm = ContextModel();
            result = '${exp.evaluate(EvaluationType.REAL, cm)}';
          }catch(e){
            result = "Error";
          }
        } else {
          if(icon.icon?.codePoint == Icons.remove.codePoint) {
            equation = equation + "-";
          } else if(icon.icon?.codePoint == Icons.add.codePoint) {
            equation = equation + "+";
          } else if(icon.icon?.codePoint == Icons.close.codePoint) {
            equation = equation + "×";
          }
        }
      }
    });
  }

	@override
	Widget build(BuildContext context) {
		var container = Container(
			width: MediaQuery.of(context).size.width * 1,
			child: Table(
				children: [
					TableRow(
						children: [
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "C", 
								buttonFontSize: 28,
								buttonTextColor: Colors.white,
								buttonColor: Colors.redAccent,
								buttonHeight: 0.1,
							),
							IconKey(
								context: context,
                onPressed: buttonPressed,
								icon: const Icon(Icons.arrow_back_sharp),
								iconSize: 32,
								buttonColor: Colors.blue,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "÷", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.blue,
								buttonHeight: 0.1,
							),
							IconKey(
								context: context,
                onPressed: buttonPressed,
								icon: const Icon(Icons.close),
								iconSize: 32,
								buttonColor: Colors.blue,
								buttonHeight: 0.1,
							),
						]
					),
					TableRow(
						children: [
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "7", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "8", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "9", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							IconKey(
								context: context,
                onPressed: buttonPressed,
								icon: const Icon(Icons.remove),
								iconSize: 32,
								buttonColor: Colors.blue,
								buttonHeight: 0.1,
							),
						]
					),
					TableRow(
						children: [
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "4", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "5", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "6", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							IconKey(
								context: context,
                onPressed: buttonPressed,
								icon: const Icon(Icons.add),
								iconSize: 32,
								buttonColor: Colors.blue,
								buttonHeight: 0.1,
							),
						]
					),
					TableRow(
						children: [
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "1", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "2", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "3", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							Container(),
						]
					),
					TableRow(
						children: [
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: ".", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "0", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							TextKey(
								context: context,
                onPressed: buttonPressed,
								buttonText: "00", 
								buttonFontSize: 32,
								buttonTextColor: Colors.white,
								buttonColor: Colors.black54,
								buttonHeight: 0.1,
							),
							IconKey(
								context: context,
                onPressed: buttonPressed,
								icon: const Icon(Icons.subdirectory_arrow_left),
								iconSize: 32,
								buttonColor: Colors.red,
								buttonHeight: 0.1,
							),
						]
					)
				],
			),
		);

		return Scaffold(
			appBar: AppBar(title: Text('Simple Calculator')),
			body: Column(
				children: [
					Container(
						alignment: Alignment.centerRight,
						width: MediaQuery.of(context).size.width * 0.95,
						padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
						child: Text(equation, style: TextStyle(fontSize: 24)),
					),
					Container(
						alignment: Alignment.centerRight,
						width: MediaQuery.of(context).size.width * 0.95,
						padding: EdgeInsets.fromLTRB(8, 16, 0, 0),
						child: Text(result, style: TextStyle(fontSize: 32)),
					),

					Expanded(child: Divider()),

					Row(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							container
						],
					)
				],
		));
	}
}
