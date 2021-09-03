/// Copyright 2020 Logica Booleana Authors

/// Dependencias */
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

///  DESCRIPCIÓN
//  Clon ui autenticación  de la red social Facebook

class PageLoginFacebook extends StatefulWidget {
  @override
  _PageLoginFacebookState createState() => _PageLoginFacebookState();
}

class _PageLoginFacebookState extends State<PageLoginFacebook> {

  //  var
  bool colorFondoStado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold( 
      body: Container(
        // La clase BoxDecoration : proporciona una variedad de formas de dibujar un cuadro
        decoration: colorFondoStado==false? null:BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [Color.fromRGBO(59,89,152,1.0),Color.fromRGBO(59,89,152,1.0)])),
        child: SafeArea(  // SafeArea : Un widget que inserta a su hijo con suficiente relleno para evitar intrusiones por parte del sistema operativo
          child: loginFacebook(context),
        ),
      ),
    );
  }
  // Devuelve una vista de login de instagram simple
  Widget loginFacebook(BuildContext context){
    // Stack : Esta clase es útil si desea superponer a varios niños de una manera simple
    return Stack(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        // Agregamos los Widgets de la vista 
        Container(
          padding: EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(child: Container()),
              FaIcon(FontAwesomeIcons.facebookSquare,size: 50.0),
              SizedBox(height: 30.0),
              TextField( decoration: InputDecoration( labelText: 'Correo electrónico o teléfono')),
              SizedBox(height: 20.0),
              TextField(obscureText: true, decoration: InputDecoration( labelText: 'Contraseña'),keyboardType: TextInputType.visiblePassword,),
              SizedBox(height: 20.0),
              InkWell(child: Container(padding: EdgeInsets.all(16.0),child: Text("iniciar sesión",style: TextStyle(fontSize: 14.0),textAlign: TextAlign.center,), width: double.infinity, decoration: BoxDecoration(border: Border.all(color:Colors.black12,width: 0.5), borderRadius: BorderRadius.all(Radius.circular(5.0)),color: Colors.black12)),onTap: (){},),
              Expanded(child: Container(),),
              Text("inicio de sesión de facebook",textAlign: TextAlign.center),
              SizedBox(height: 20.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  SizedBox(width: 12.0),Text("Se te olvidó tu contraseña?",style: TextStyle(fontWeight: FontWeight.bold)), 
                  SizedBox(width: 12.0),
                  FaIcon(FontAwesomeIcons.questionCircle, size: 20.0,color: Theme.of(context).textTheme.bodyText1!.color),
                ], 
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
        // Agrega dos botones
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            IconButton(icon: Icon(Icons.invert_colors),onPressed: (){ setState((){ colorFondoStado=!colorFondoStado; });}),
          ],
        ),
    ],
  );
  }

}