// Copyright 2020 Logica Booleana Authors 

// Dependencias 
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias */
import 'package:cached_network_image/cached_network_image.dart';


//  DESCRIPCIÓN */
//  Creamos una pantalla de autenticación */
//  con un efecto desplazable vertical que consta de dos vistas */

class PageLoginGuideAr extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: PageView(
          scrollDirection: Axis.vertical,
          children: <Widget>[
            _pagina1(),
            _pagina2(context),
          ],
        )
    );
  }
  Stack _pagina1() {
    //  usar Stack //
    //  Se pueden almacenar varios widgets en la pila, 
    //  pero existe la desventaja o ventaja de que todos los widgets secundarios se superponen
    return Stack(
      children: <Widget>[
        _colorFondo(),
        _backgroundimage(urlImage: "https://i.pinimg.com/736x/56/b6/e0/56b6e02dc4ebda2e8ffce5570f5b7ad4.jpg"),
        Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.9],
                colors: [Colors.black54, Colors.transparent])),
            child: _textos()),
      ],
    );
  }
  Widget _colorFondo() {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
    );
  }
  Widget _backgroundimage({required String urlImage}){
    return SizedBox(
      height: double.infinity,width: double.infinity,
      child: CachedNetworkImage(
        fit: BoxFit.cover,fadeInDuration: Duration(milliseconds: 300),
        imageUrl: urlImage,
        placeholder: (context, urlImage) => Center(child: Container(color: Colors.grey[900])),
        errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey[900])),
      ),
    );
  }
  Widget _textos() {
    
    return SafeArea(
      child: Column(
        children: <Widget>[
          SizedBox(height: 150.0),
          Text.rich(
          TextSpan(
            text: 'Hola,', 
            style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),
            children: <TextSpan>[
              TextSpan(text: ' bienvenido!\n', style: TextStyle(fontStyle: FontStyle.italic,color: Colors.white,fontSize: 24)),
              TextSpan(text: 'Esto es Argentina', style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 38)),
            ],
          ),
        ),
          Expanded(child: Container() ),
          Icon(Icons.keyboard_arrow_down, size: 70.0, color: Colors.white)
        ],
      ),
    );
  }
  // Esta Widget devuelve un contenedor con dos botones */
  Widget _pagina2(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Color.fromRGBO(108, 192, 218, 1.0),
      child: Stack(
        children: [
          Container(child: _backgroundimage(urlImage: "https://i.pinimg.com/originals/ce/20/60/ce2060b810920fbd847cc4997ce877c6.jpg")),
          Column(
            children: [
              Expanded(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Text("Esta es una aplicación donde podés encontrar información detallada de las regiones de Argentina y sus atractivos turísticos. Esta guía cuenta con información útil para el viajero",style: TextStyle(fontSize: 25.0,color: Colors.white,fontWeight:FontWeight.bold )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(100.0),
                child: ElevatedButton(
                  onPressed: (){}, 
                  child: Text("Iniciar Guía",style: TextStyle(fontSize: 20.0,color: Colors.black,fontWeight:FontWeight.bold )),
                  style:ElevatedButton.styleFrom(padding: EdgeInsets.all(15.0),primary: Colors.white,onPrimary:Colors.black,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),side: BorderSide(color: Colors.white))),
                ),
              ),
            ],
          ),
        ]
      ),
    );
  }
}
