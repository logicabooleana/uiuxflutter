/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en el apartado => Dependencias 
import 'package:google_fonts/google_fonts.dart'; 
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

///  DESCRIPCIÓN
//  Clon ui autenticación  de la red social instagram

class PageLoginInstagram extends StatefulWidget {
  @override
  _PageLoginInstagramState createState() => _PageLoginInstagramState();
}
// var
bool isDarkTheme = false;

class _PageLoginInstagramState extends State<PageLoginInstagram> {
  @override
  Widget build(BuildContext context) {

    // var
    isDarkTheme=Theme.of(context).brightness==Brightness.dark?true:false;

    return Scaffold( 
      body: body(context),
    );
  }
  
  /// WIDGETS VIEWS
  Widget body(BuildContext context) {
    return Container(
      //  decoration : proporciona una variedad de formas de dibujar un cuadro
      decoration: isDarkTheme==true? null:BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [ Color.fromRGBO(205, 72, 107, 1.0),Color.fromRGBO(188, 42, 141, 1.0) ],)),
      child: Column(
        children: [
          SafeArea(child: Row(children: [Expanded(child: Container()),WidgetsUtilsApp().buttonThemeBrightness(context: context)])),
          Expanded(
            child: Stack( // Stack : Esta clase es útil si desea superponer a varios niños de una manera simple
              textDirection: TextDirection.rtl,
              children: <Widget>[
                // Agregamos los Widgets de la vista
                Container(
                  padding: EdgeInsets.all(30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text("Instagram",style: GoogleFonts.cookie(fontSize: 50.0,color: Colors.white)),
                      SizedBox(height: 30.0),
                      TextField(decoration: InputDecoration(disabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)), labelText: 'Usuario',labelStyle: TextStyle(color:Colors.white),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white70))),),
                      SizedBox(height: 20.0),
                      TextField( obscureText: true, decoration: InputDecoration(border: OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),enabledBorder: OutlineInputBorder(borderSide: BorderSide(color:Colors.white70)), labelText: 'Contraseña',labelStyle: TextStyle(color:Colors.white))),
                      SizedBox(height: 20.0),
                      InkWell(
                        child: Container(
                            padding: EdgeInsets.all(16.0),
                            child: Text("iniciar sesión",style: TextStyle(fontSize: 14.0,color:Colors.white),textAlign: TextAlign.center),
                            width: double.infinity,
                            decoration: BoxDecoration(border: Border.all(color: Colors.white70, width: 0.5),borderRadius: BorderRadius.all(Radius.circular(5.0)))),
                        onTap: () {},
                      ),
                      SizedBox(height: 20.0),
                      Text("¿Ha olvidado sus datos de acceso? obtenga ayuda para iniciar sesión.",textAlign: TextAlign.center,style: TextStyle(color:Colors.white)),
                      SizedBox(height: 20.0),
                      Row(
                        children: <Widget>[
                          Expanded(child: Divider()),
                          SizedBox(width: 12.0),
                          Text("O",style: TextStyle(color:Colors.white)),
                          SizedBox(width: 12.0),
                          Expanded(child: Divider()),
                        ],
                      ),
                      SizedBox(height: 20.0),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FaIcon(FontAwesomeIcons.facebook,size: 24.0,color:Colors.white),
                          SizedBox(width: 12.0),
                          Text("Iniciar sesión con Facebook",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.white)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
}
}


//!  
//!  Advertencia : Tenga en cuenta que al rotar la pantalla horizontal se va aproducir un Desbordamiento de pixeles
//!
