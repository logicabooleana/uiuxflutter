/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias 
import 'package:google_fonts/google_fonts.dart'; 
import 'package:lottie/lottie.dart';

import '../../../../utils/widgets/widgets_utils_app.dart';  


class PageLoginDribbbble extends StatefulWidget {
  @override
  _PageLoginDribbbbleState createState() => _PageLoginDribbbbleState();
}

class _PageLoginDribbbbleState extends State<PageLoginDribbbble> with TickerProviderStateMixin {
  
  // var
  late AnimationController _controllerLogo;  

  @override
  void initState() {
    super.initState();
    _controllerLogo = AnimationController(vsync: this);
  }
  @override
  void dispose() {
    _controllerLogo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData.dark(),
      child: Scaffold( 
        body: Container(
          // La clase BoxDecoration : proporciona una variedad de formas de dibujar un cuadro. 
          decoration: Theme.of(context).brightness==Brightness.dark? 
          BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [Theme.of(context).scaffoldBackgroundColor,Theme.of(context).scaffoldBackgroundColor]))
          :BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [Color.fromRGBO(233, 76, 136,1.0),Color.fromRGBO(233, 76, 136,1.0)])),
          child: SafeArea(  //  SafeArea : Un widget que inserta a su hijo con suficiente relleno para evitar intrusiones por parte del sistema operativo. */
            child: logindribbbble(context),
          ),
        ),
      ),
    );
  }
  // Devuelve una vista
  Widget logindribbbble(BuildContext context){
    return Stack(
      textDirection: TextDirection.rtl,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(30.0),
          alignment: Alignment.center,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Lottie.asset('assets/anim_dribbble_loader.json',controller: _controllerLogo,height: 200,width: 200.0,onLoaded: (composition) {setState(() {_controllerLogo.duration = composition.duration;_controllerLogo.repeat();});},),
                SizedBox(height: 30.0),
                Text("dribbbble",style: GoogleFonts.pacifico(fontSize: 30.0),textAlign:TextAlign.center),
                SizedBox(height: 20.0),
                TextField( decoration: InputDecoration( labelText: 'Correo electrónico o teléfono') ),
                SizedBox(height: 20.0),
                TextField( obscureText: true, decoration: InputDecoration( labelText: 'Contraseña')),
                SizedBox(height: 50.0),
                TextButton(
                  onPressed: () {},
                  child: Text('Iniciar sesión',
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.blue
                              : Colors.white))),
                SizedBox(height: 20.0),
              ],
            ),
          ),
        ),
        // Agrega dos botones 
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            WidgetsUtilsApp().buttonThemeBrightness(context: context),
          ],
        ),
    ],
  );
}

}

