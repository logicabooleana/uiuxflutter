/// Copyright 2020 Logica Booleana Authors


// Dependencias
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias

/// DESCRIPCIÓN
// Pantalla de inicio de una app de ventas online

class PageLoginMercadoLibre extends StatelessWidget {

  // var
  late Size screenSize;

  @override
  Widget build(BuildContext context) {

    // var
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.yellow[600],
      body: body(),
    );
  }

  Widget body() {
    return Stack(
      clipBehavior: Clip.hardEdge, fit: StackFit.loose,
      children: [
        // Fondo dividio entre dos colores
        Column(
          children: [
            Expanded(child: Container(color: Colors.yellow[600])),
            Expanded(child: Container(color: Colors.grey[100])),
          ],
        ),
        // Widget Card centrado en la mitad de la pantalla
        Center(
          child: Container(
              width: screenSize.width * 0.90,
              child: Column(
                children: [
                  Expanded(child: Center(child: Icon(Icons.shopping_basket,color: Colors.white,size: 50.0))),
                  card(),
                  Expanded(child: Center(child: Text("Privacidad - Condiciones",style: TextStyle(color: Colors.black38, fontSize: 14.0)))),
                ],
              )),
        ),
      ],
    );
  }
  // Widget tipo card con el contenido de los componentes
  Widget card() {
    return Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Hola, Ingresa tu e-mail o usuario",textAlign: TextAlign.center,style: TextStyle(color: Colors.grey[800],fontWeight: FontWeight.bold,fontSize: 20.0)),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                  style: TextStyle(color: Colors.black),
                  decoration: new InputDecoration(labelStyle: TextStyle(color: Colors.blue),labelText: "E-mail o usuario",enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue)),border: UnderlineInputBorder()),
                  keyboardType: TextInputType.text,obscureText: true,
                ),
              ),
              buttonIconRound(onPressed: (){},text:"Continuar",colorButton:  Colors.blue,colorText: Colors.white),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextButton(
                  onPressed: () {},
                  child: Text("Crear cuenta",style: TextStyle(fontSize: 16.0, color: Colors.blue)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget buttonIconRound({required void Function()? onPressed,required String text,IconData ?iconData,Color colorButton=Colors.white,Color colorText=Colors.white,Color ?colorBorder}){
    if(colorBorder==null)colorBorder=colorButton;
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical:8.0),
      child: ElevatedButton.icon(
        icon: iconData==null?Container():Icon(iconData,color: colorText),
        label: Text(text,style: TextStyle(color: colorText,fontSize: 16.0,fontWeight: FontWeight.bold)),
        style:ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          primary: colorButton,onPrimary:Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(color: colorBorder)),
        ),
        onPressed: onPressed,
      ),
    );
  }
}

