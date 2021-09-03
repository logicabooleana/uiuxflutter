/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:flutter/material.dart';
/// Los link de de las depedencias se pueden encontrar en el apartado => Dependencias 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///  DESCRIPCIÓN
//  Diseño de authenticación de la red social snapchat 

class PageLoginsnapchat extends StatefulWidget {
  @override
  _PageLoginsnapchatState createState() => _PageLoginsnapchatState();
}

class _PageLoginsnapchatState extends State<PageLoginsnapchat>with TickerProviderStateMixin {

  // var
  bool colorFondoStado = false;

  @override
  Widget build(BuildContext context) {
    return Theme(
      // Create a unique theme with "ThemeData
      data: Theme.of(context).copyWith(brightness: Brightness.dark),
      child: Scaffold(
        backgroundColor: Colors.yellow[400],
        body: body(context: context),
      ),
    );
  }

  // Devuelve una vista
  Widget body({required BuildContext context}) {
    return Column(
      children: [
        Expanded(
            child: Center(
          child: Icon(
            FontAwesomeIcons.snapchatGhost,
            size: 75.0,
            color: Colors.white,
          ),
        )),
        button(text: "Iniciar sesión",colorButton:  Colors.pink[400]!,colorText: Colors.white,onPressed: (){}),
        button(text: "Regístrate",colorButton:  Colors.blue[400]!,colorText: Colors.white,onPressed: (){}),
        
      ],
    );
  }

  // Buttons
  Widget button({required void Function()? onPressed,required String text,Color colorButton=Colors.white,Color colorText=Colors.white}){
    return Container(
      width: double.infinity,
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: EdgeInsets.all(35.0),
          primary: colorButton,onPrimary:Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0),side: BorderSide(color: colorButton)),
        ),
        child: Text(text.toUpperCase(),style: TextStyle(color: colorText,fontSize: 16.0,fontWeight: FontWeight.bold)),
        onPressed: onPressed,
      ),
    );
  }
}
