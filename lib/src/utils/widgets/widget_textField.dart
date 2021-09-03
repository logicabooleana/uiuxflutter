import 'package:flutter/material.dart';


class WidgetTextFieldContent extends StatefulWidget {


  WidgetTextFieldContent(
    { 
      required String labelText,
      Color labelTextColor=Colors.black ,
      Color fillColor=Colors.white,
      Color colorBorderLine=Colors.white ,
      bool obscureText=false  
      }
  );

  @override
  _WidgetTextFieldContentState createState() => _WidgetTextFieldContentState();
}

class _WidgetTextFieldContentState extends State<WidgetTextFieldContent> {
  late BuildContext context;

  late String labelText;

  late double width; 
  late Color labelTextColor;

  late Color fillColor;

  late Color colorBorderLine;

  late bool obscureText;

  @override
  Widget build(BuildContext context) {
    return getTextField();
  }

  Widget getTextField() {
    return TextField(
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color:labelTextColor ),
          filled: true,
          fillColor: fillColor,
          
          enabledBorder:OutlineInputBorder(
            borderSide: BorderSide(color: colorBorderLine, width: 1.0),
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
      );
  }
}
