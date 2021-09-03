/// Copyright 2020 Logica Booleana Authors

import 'package:flutter/material.dart';

// Dependencias
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

///  DESCRIPCIÓN
//  Clon ui autenticación  de la red social twitter

class PageLoginTwitter extends StatefulWidget {
  @override
  _PageLoginTwitterState createState() => _PageLoginTwitterState();
}

class _PageLoginTwitterState extends State<PageLoginTwitter> {
  // var
  bool colorFondoStado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // La clase BoxDecoration : proporciona una variedad de formas de dibujar un cuadro
        decoration: colorFondoStado == false
            ? null
            : BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                    Color.fromRGBO(29, 202, 255, 1.0),
                    Color.fromRGBO(29, 161, 242, 1.0)
                  ])),
        child: SafeArea(
          // SafeArea : Un widget que inserta a su hijo con suficiente relleno para evitar intrusiones por parte del sistema operativo. */
          child: loginTwitter(context),
        ),
      ),
    );
  }

  // var
  Widget loginTwitter(BuildContext context) {
    return Stack(
      // Stack : Esta clase es útil si desea superponer a varios niños de una manera simple
      textDirection: TextDirection.rtl,
      children: <Widget>[
        // Agregamos los Widgets de la vista */
        Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              FaIcon(
                FontAwesomeIcons.twitter,
                size: 50.0,
                color: Color.fromRGBO(29, 161, 242, 1.0),
              ),
              SizedBox(height: 50.0),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  FaIcon(FontAwesomeIcons.fingerprint, size: 100.0),
                  SizedBox(height: 30.0),
                  Text("Iniciar sesión con la identificación táctil",
                      style: GoogleFonts.manrope(fontSize: 20.0),
                      textAlign: TextAlign.center),
                  SizedBox(height: 30.0),
                  Text(
                      "Use la identificación táctil para acceder de forma rápida y fácil a su cuenta",
                      style: TextStyle(fontSize: 14.0),
                      textAlign: TextAlign.center),
                  SizedBox(height: 20.0),
                  //WidgetButtonCricle(context: context,rute: "",texto: "Usar identificación táctil",colorButton: Color.fromRGBO(29, 161, 242,1.0),),
                ],
              ),
              SizedBox(height: 50.0),
                                  Text("Iniciar sesión con correo electrónico",
                  style: TextStyle(fontSize: 14.0),
                  textAlign: TextAlign.center),
              SizedBox(height: 20.0),
            ],
            ),
        ),
        // Agrega dos botones
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(
                icon: Icon(Icons.invert_colors),
                  onPressed: () {
            setState(() {
                    colorFondoStado = !colorFondoStado;
                  }  );
                }),
          ],
        ),
      ],
    );
  }
}
