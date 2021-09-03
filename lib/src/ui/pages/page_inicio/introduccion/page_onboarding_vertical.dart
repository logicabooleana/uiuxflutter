/* Copyright 2020 Logica Booleana Authors */

/// Dependencias 
import 'package:flutter/material.dart';

///  DESCRIPCIÓN
/// Interfaz de usuario con lista de páginas desplazable horizontalmente

class PageOnboarding1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body(context: context),
    );
  }
  /// WIDGETS COMPONENTS
  Widget body({required BuildContext context}){
    return SafeArea( // SafeArea : Un widget que inserta a su hijo con suficiente relleno para evitar intrusiones por parte del sistema operativo.
      child: PageView(
        controller: PageController(  initialPage: 0 ),
        pageSnapping: true, //  Deslizaiento automatico */
        scrollDirection: Axis.vertical, //  Dirección de deslizamiento  */  
        children: <Widget>[
          viewComponent(context: context,assetImage: AssetImage('assets/imagen_animal_corazon.png'),title: "Welcome", description:""),
          viewComponent(context: context,assetImage: AssetImage('assets/image_send.png'),title: "Mensaje instantaneos",description:"Envia mensajes en tiempo real con tus contactos"),
          viewComponent(context: context,assetImage: AssetImage('assets/image_video.png'),title: "Comparte tus videos",description:"Mira videos que comparten tus amigos y crea tus propio arte en video"),
          paginaButton(context),
          
        ],
      ),
    );
  }
  Widget viewComponent({required AssetImage assetImage,required BuildContext context,IconData ?iconData, String title="", String description=""}) {
    
    // Declaramos los estilos
    const estiloTitulo = TextStyle( fontSize: 30.0, fontWeight: FontWeight.bold);
    const estiloSubTitulo = TextStyle( fontSize: 20.0);
    Color? color = Theme.of(context).textTheme.headline1!.color;
    
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: Column(
        children: <Widget>[
          Expanded(child: Container()),
          Padding(padding: EdgeInsets.all(20.0),child: iconData==null? Image(image: assetImage,width: 250.0,height: 250.0,fit: BoxFit.cover):Icon(iconData)),
          Text(title,style: estiloTitulo,textAlign: TextAlign.center),
          SizedBox(height: 12.0),
          Text(description,style: estiloSubTitulo,textAlign: TextAlign.center),
          Expanded(child: Container()),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: color)
        ],
      ),
    );
  }
  Widget paginaButton(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: ElevatedButton(
          child: Padding(padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),child: Text('Bienvenidos', style: TextStyle(fontSize: 20.0))),
          onPressed: () => Navigator.pushNamed(context, ''),
        ),
      ),
    );
  }
}
