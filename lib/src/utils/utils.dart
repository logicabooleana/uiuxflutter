import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:math';


// Funcion para abrir la url o la geolocation
launchURL( BuildContext context, String _url) async {
  await canLaunch(_url) ? await launch(_url) : throw 'Could not launch $_url';
}

// Devuelve un color Random
Color getRandomColor(){

  List<MaterialColor> lista_color = [
      Colors.amber,
      Colors.blue,
      Colors.blueGrey,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.indigo,
      Colors.red,
      Colors.lime,
      Colors.pink,

    ];

  return lista_color[Random().nextInt(lista_color.length)];
}

