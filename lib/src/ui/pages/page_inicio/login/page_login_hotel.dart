// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'dart:ui';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:neon/neon.dart';

// README
// Esta es una ui creada para un motel 
// FEATURES
// ui created by @logica.booleana
// theme: dark/light
// animation: false
// interactivity: false

class PageLoginHotel extends StatelessWidget {
  const PageLoginHotel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //  usar Stack //
    //  Se pueden almacenar varios widgets en la pila,
    //  pero existe la desventaja o ventaja de que todos los widgets secundarios se superponen
    return Stack(
      // dimensionar los hijos no posicionados en la pila
      fit: StackFit.expand, // ajustado a su tamaño más grande
      //!Advertencia! El uso de Expanded() dentro de la pila produce error en release y en debug no es detectado normalmente
      children: [
        backgroundimageBlur(urlImage:'https://i0.wp.com/www.saavedraonline.com.ar/wp-content/uploads/2015/10/albergue-puraciudad.jpg'),
        _scaffold(context: context),
      ],
    );
  }

  // WIDGETS VIEWS
  Widget backgroundimageBlur(
      {required String urlImage, double sigmaYXBlur = 5}) {
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: ImageFiltered(
          imageFilter:
              ImageFilter.blur(sigmaY: sigmaYXBlur, sigmaX: sigmaYXBlur),
          child: CachedNetworkImage(
            fit: BoxFit.cover,
            fadeInDuration: Duration(milliseconds: 300),
            imageUrl: urlImage,
            placeholder: (context, urlImage) =>
                Center(child: Container(color: Colors.grey[900])),
            errorWidget: (context, urlImage, error) =>
                Center(child: Container(color: Colors.grey[900])),
          )),
    );
  }

  Widget _scaffold({required BuildContext context}) {
    
    return Scaffold(
      backgroundColor: Colors.black54,
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: _logo(),
            ),
          ),
          _buttonsAuth(context: context),
        ],
      ),
    );
  }

  /// WIDGETS VIEWS
  Widget _logo(){
    return Padding(
      padding: const EdgeInsets.all(50.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  Padding(padding:const EdgeInsets.only(top: 3, bottom: 5.0),child: Icon(Icons.favorite, color: Colors.purple, size: 75.0)),
                  Padding(padding: const EdgeInsets.only(left: 12, bottom: 0, top: 10),child: Icon(Icons.favorite,color: Colors.pink, size: 75.0)),
                ],
              ),
              SizedBox(width: 5),
              Text("MOTEL",style:TextStyle(color: Colors.pink, fontSize: 40.0)),
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Container(),
              ),
              Neon(
                  text: '24Hs',
                  color: Colors.red,
                  fontSize: 40,
                  font: NeonFont.TextMeOne,
                  flickeringText: false,
                  flickeringLetters: [0, 1],
                  glowing: false),
            ],
          )
        ],
      ),
    );
  }
  Widget _buttonsAuth({required BuildContext context}){

    Color colorBoton = Theme.of(context).brightness == Brightness.light
        ? Colors.black
        : Colors.white;

    return Container(
      decoration: BoxDecoration(color: Theme.of(context).canvasColor.withOpacity(0.3)),
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              buttonIconRound(
                  iconData: FontAwesomeIcons.facebookF,
                  onPressed: () {},
                  colorButton: Colors.transparent,
                  colorBorder: colorBoton,
                  colorText: colorBoton),
              buttonIconRound(
                  iconData: FontAwesomeIcons.google,
                  onPressed: () {},
                  colorButton: Colors.transparent,
                  colorBorder: colorBoton,
                  colorText: colorBoton),
              buttonIconRound(
                  iconData: FontAwesomeIcons.envelope,
                  onPressed: () {},
                  colorButton: Colors.transparent,
                  colorBorder: colorBoton,
                  colorText: colorBoton),
            ],
          ),
        ),
      ),
    );
  }
  /// WIDGETS COMPONENTS
  Widget buttonIconRound(
      {required void Function()? onPressed,
      String text = '',
      IconData? iconData,
      Color colorButton = Colors.white,
      Color colorText = Colors.white,
      Color? colorBorder}) {
    if (colorBorder == null) colorBorder = colorButton;

    return Material(
      color: Colors.transparent,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Center(
          child: Ink(
            decoration: ShapeDecoration(
              color: colorButton,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50.0),
                  side: BorderSide(color: colorBorder)),
            ),
            child: IconButton(
              icon: iconData == null
                  ? Container()
                  : Icon(iconData, color: colorText),
              color: colorText,
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
