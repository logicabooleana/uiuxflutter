/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:animate_do/animate_do.dart';
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PageLoginGame extends StatefulWidget {
  @override
  _PageLoginGameState createState() => _PageLoginGameState();
}

class _PageLoginGameState extends State<PageLoginGame> with TickerProviderStateMixin {
  
  // var
  late AnimationController animationController;
  bool isDark=false;
  bool isPassword=false;

  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    // var
    isDark=Theme.of(context).brightness==Brightness.dark?true:false;
    Color color1=isDark?Colors.black:Colors.purple;
    Color color2=isDark?Colors.purple.withOpacity(0.01):Colors.purple[900]!;

    return Container(
      color: isDark?Colors.black:Colors.white,
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [color1,color2])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: body(context),
        ),
      ),
    );
  }
  /// WIDGETS
  Widget body(BuildContext context){

    // var
    bool isDark = Theme.of(context).brightness==Brightness.dark?true:false;
    Color colorText1Dark = Colors.white;Color colorText2Dark = Colors.blue;
    Color colorText1light = Colors.purple[900]!;Color colorText2light = Colors.orange;
    Color colorText = Theme.of(context).brightness==Brightness.dark?Colors.deepPurple:Colors.white;
    Color colorButton = Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.deepPurple;

    return Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SafeArea(child: Row(children: [Expanded(child: Container()),WidgetsUtilsApp().buttonThemeBrightness(context: context)])),
            Expanded(child: Center(child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(FontAwesomeIcons.gamepad,size: 100.0,color: isDark?Colors.white:Colors.purple[900],),
                SizedBox(height: 20.0),
                Row(crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,children: [Text("GAME",style: GoogleFonts.poppins(fontSize:30.0,fontWeight:FontWeight.bold,color: isDark?colorText1Dark:colorText1light)),Text("CORES",style: GoogleFonts.poppins(fontSize:30.0,fontWeight:FontWeight.bold,color: isDark?colorText2Dark:colorText2light))]),
              ],
            ))),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Bounce(controller: ( controller ) => animationController = controller,child: isPassword?formPaddword():formEmail()),
                  SizedBox(height: 50.0),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0.0),
                      onPrimary: Colors.purple,primary: colorButton,
                      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(5.0))),
                      side: BorderSide(color: colorButton),
                    ),
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),child: Text(isPassword?"Iniciar sesión".toUpperCase():"Siguiente".toUpperCase(), style: TextStyle(color: colorText,fontSize: 20.0,fontWeight: FontWeight.bold))),
                    onPressed: () => setState(() {isPassword=!isPassword;animationController.repeat();}),
                  ),
                  SizedBox(height: 10.0),
                  ElevatedButton(
                    style:ElevatedButton.styleFrom(
                      padding: EdgeInsets.all(0.0),
                      onPrimary: colorButton,primary: colorButton.withOpacity(0.1),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(color:colorButton)),
                      side: BorderSide(color: colorButton),
                    ),
                    child: Padding(padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),child: Text("Iniciar sesión con Google".toUpperCase(),textAlign: TextAlign.center, style: TextStyle(color: colorButton,fontSize: 14.0,fontWeight: FontWeight.bold))),
                    onPressed: () {},
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(padding: const EdgeInsets.only(top: 24,),child: Row(crossAxisAlignment: CrossAxisAlignment.start,children: [Expanded(child: Container()),/*DynamicTheme.of(context).getIConButton(context)*/]),),
      ],
    );
}
  /// WIDGETS COMPONENT
  Widget formEmail(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(5.0),border: Border.all(width: 2,color: Colors.white10.withOpacity(0.1))),
      child: TextField(textAlign: TextAlign.center,style: TextStyle(color: Colors.white),controller: TextEditingController(text: ""),decoration: InputDecoration(contentPadding:EdgeInsets.all(20.0) ,hintText:"Correo electrónico o teléfono",hintStyle:TextStyle(color: Colors.white,fontSize:18.0),enabledBorder: InputBorder.none,focusedBorder: InputBorder.none)),
    );
  }
  Widget formPaddword(){
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(5.0),border: Border.all(width: 2,color: Colors.white10.withOpacity(0.1))),
      child: TextField(obscureText: true,textAlign: TextAlign.center,style: TextStyle(color: Colors.white),controller: TextEditingController(text: ""),decoration: InputDecoration(contentPadding:EdgeInsets.all(20.0) ,hintText:"Contraseña",hintStyle:TextStyle(color: Colors.white,fontSize:18.0),enabledBorder: InputBorder.none,focusedBorder: InputBorder.none)),
    );
  }
}




