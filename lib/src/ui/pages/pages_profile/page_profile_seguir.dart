/// Copyright 2020 Logica Booleana Authors 

// Dependencias
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias

/// DESCRIPCIÓN
//Perfil simple

class PageProfileSeguir extends StatelessWidget {
  PageProfileSeguir() ;
  
  // var
  Color colorTextPrimary=Colors.white;
  Color colorTextSecundary=Colors.black;

  @override
  Widget build(BuildContext context) {

    // var 
    colorTextPrimary = Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black;
    colorTextSecundary = Theme.of(context).brightness==Brightness.dark?Colors.white24:Colors.black38;

    return Scaffold(
      backgroundColor: Theme.of(context).brightness==Brightness.dark?Colors.grey[900]:Theme.of(context).canvasColor,
      appBar: appbar(context: context),
      body: contenedor(context),
    );
  }
  // WIDGETS VIES 
  PreferredSizeWidget appbar({required BuildContext context}){
    return AppBar(
        iconTheme: IconThemeData(color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black),
        backgroundColor:Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[WidgetsUtilsApp().buttonThemeBrightness(context: context)],
      );
  }
  Widget contenedor(BuildContext context) {
    return Container(
      child: Center(
        child: Column(
          children: <Widget>[
            Expanded(child: Container()),
            Card(
              child: CircleAvatar(radius: 80,backgroundColor: colorTextSecundary,child: CircleAvatar(backgroundColor:Theme.of(context).canvasColor,radius: 77,backgroundImage: NetworkImage("https://www.superprof.com.ar/imagenes/avisos/profesor-home-ingeniera-informatica-con-anos-experiencia-clases-scrum-para-principiantes-bogota.jpg"))),
              elevation: 0.0,
              shape: CircleBorder(),
              clipBehavior: Clip.antiAlias,
            ),
            SizedBox(height: 30.0),
            Text("Katherine Lyonne", style: TextStyle( color: colorTextPrimary ,fontSize: 24.0,fontWeight:FontWeight.bold )),
            SizedBox(height: 8.0),
            Text("Diseñadora de producto",style: TextStyle(color: colorTextSecundary,fontSize: 14.0)),
            counts(),
            Expanded(child: Center(child: ButtonFollow(),)),
          ],
        ),
      ),
    );
  }
  /// WIDGETS COMPONENTS
  Widget counts(){
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              pint(total: "271",text: "Photos"),
              pint(total: "2.5k",text: "Followers"),
              pint(total: "346",text: "Following"),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
  Widget pint({required String text,required String total}){
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          Text(total,style: TextStyle(color: colorTextPrimary,fontWeight: FontWeight.normal)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,style: TextStyle(color: colorTextSecundary,fontWeight: FontWeight.bold)),
          ),
        ]
      ),
    );
  }
}

class ButtonFollow extends StatefulWidget {
  ButtonFollow({Key ?key}) : super(key: key);

  @override
  _ButtonFollowState createState() => _ButtonFollowState();
}

class _ButtonFollowState extends State<ButtonFollow> {

  bool follow=false;
  @override
  Widget build(BuildContext context) {

    Color? color = follow?Colors.red[300]:Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black;
    return Container(
      child: TextButton.icon(
        onPressed: () {setState(() {follow=!follow;}); },
        icon: Icon(follow?Icons.close:Icons.add, size: 25,color: color,),
        label: Text(follow?"stop following":"seguir",style: TextStyle(color: color,fontSize: 20)),
      )
    );
  }
}