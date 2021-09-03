import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
/// Copyright 2020 Logica Booleana Authors

import 'package:flutter/material.dart';

// Dependencias
// Los link de de las depedencias se pueden encontrar en el apartado => Dependencias

///  DESCRIPCIÓN
//  Clon ui autenticación  de la plataforma de netflix

class PageLoginNetflix extends StatefulWidget {
  @override
  _PageLoginNetflixState createState() => _PageLoginNetflixState();
}

class _PageLoginNetflixState extends State<PageLoginNetflix> with TickerProviderStateMixin {

  // var
  bool isDarkTheme = false;

  @override
  Widget build(BuildContext context) {

    // var
    isDarkTheme=Theme.of(context).brightness==Brightness.dark?true:false;

    return Scaffold( 
      body: body(context),
    );
  }

  // WIDGETS VIEWS 
  Widget body(BuildContext context){
    // Obtenemos las vavriables de la dimension de la pantalla
    Size screenSize = MediaQuery.of(context).size;
    // Esto cambia el color segun "colorFondoStado"
    Color colorTextFiel = isDarkTheme==false?Colors.black12:Colors.white12;
    
    return Container(
      // La propiedad BoxDecoration : proporciona una variedad de formas de dibujar un cuadro
      decoration: isDarkTheme==false? null:BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [Colors.transparent.withOpacity(0.8),Colors.black,Colors.black])),
      child: Stack( // Stack : Esta clase es útil si desea superponer a varios niños de una manera simple
        textDirection: TextDirection.rtl,
        children: <Widget>[
          // Opcional : Agrega una imagen de fondo  siempre que "colorFondoStado" sea verdadero
          isDarkTheme==true?Image(image: NetworkImage("https://rtvc-assets-radionica3.s3.amazonaws.com/s3fs-public/styles/image_750x424/public/field/image/article/movies.jpg?itok=xkRWcmb0"),fit: BoxFit.cover,width: double.infinity,height: screenSize.height / 2 ,):Container(),
          Container(
            decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [ isDarkTheme==true?Colors.transparent.withOpacity(0.8):Theme.of(context).canvasColor,isDarkTheme==false?Theme.of(context).canvasColor:Colors.black,isDarkTheme==false?Theme.of(context).canvasColor:Colors.black])),
            padding: EdgeInsets.all(30.0),
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
              children: <Widget>[
                Image.asset("assets/logo_netflix.png",width: 300.0,height: 300.0,),
                textField( obscureText: true,labelText: 'Correo electrónico',labelTextColor:Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black ,colorBorderLine: Colors.transparent,fillColor: colorTextFiel),
                SizedBox(height: 15.0),
                textField( labelText: 'Contraseña',labelTextColor:Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,colorBorderLine: Colors.transparent,fillColor: colorTextFiel,obscureText: true),
                SizedBox(height: 30.0),
                SizedBox(height: 50.0),
                Text("¿No eres miembro todavía? ¡comienza tu mes gratis!",textAlign: TextAlign.center,),
                SizedBox(height: 20.0),
                Text("¿Olvidaste tu contraseña?",textAlign: TextAlign.center,style: TextStyle()),
              ],
            ),
            ),
          ),
          SafeArea(child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: WidgetsUtilsApp().buttonThemeBrightness(context: context),
              ),
            ])),
      ],
  ),
    );
}
// Esto devuelve un "TextFiel" perzonalizado
Widget textField({  required String labelText,Color labelTextColor=Colors.black ,Color fillColor=Colors.white,Color colorBorderLine=Colors.white ,bool obscureText=false  }){
  return TextField(
    obscureText: obscureText,
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: TextStyle(color:labelTextColor ),
          filled: true,
          fillColor: fillColor,
          enabledBorder:OutlineInputBorder(borderSide: BorderSide(color: colorBorderLine, width: 1.0),borderRadius: BorderRadius.circular(5.0)),
          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: labelTextColor, width: 1.0),borderRadius: BorderRadius.circular(5.0),gapPadding: 12.0),
          border: OutlineInputBorder(),
        ),
      );
}

}

