/// Copyright 2020 Logica Booleana Authors

// Dependencias 
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en el apartado => Dependencias
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PageLoginSpotify extends StatelessWidget {
  PageLoginSpotify({Key ?key}) : super(key: key);

  // var
  late Size screenSize; // Obtenemos las vavriables de la dimension de la pantalla

  @override
  Widget build(BuildContext context) {

    // var
    screenSize = MediaQuery.of(context).size;
    
    return Stack(
      children: [
        imagenFondo(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:appbar(),
          body: body(),
        ),
      ],
    );
  }

  /// WIDGETS
  PreferredSizeWidget appbar(){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
  }
  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Container()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 50.0),
          child: Column(
            children: [
              Padding(padding: const EdgeInsets.all(12.0),child: FaIcon(FontAwesomeIcons.spotify, size: 40,color:Colors.white)),
              Text("Millones de canciones.\nGratis en Spotify.",textAlign:TextAlign.center,style: TextStyle(fontSize: 24.0, color: Colors.white,fontWeight: FontWeight.bold)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              buttonRound(onPressed: (){},text: "Regístrate gratis",colorButton: Colors.green,colorText: Colors.white),
              buttonRound(onPressed: (){},text: "Continuar con facebook",colorButton: Colors.indigo,colorText: Colors.white),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("¿Ya tienes un usuario?",textAlign:TextAlign.center,style: TextStyle(color: Colors.white,fontSize: 14.0)),
              ),
              buttonRound(onPressed: (){},text: "Iniciar sesion",colorButton: Colors.white,colorText: Colors.black),
            ],
          ),
        ),
      ],
    );
  }

  /// WIDGETS COMPONENTS
  Widget buttonRound({required void Function()? onPressed,required String text,Color colorButton=Colors.white,Color colorText=Colors.white}){
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical:8.0),
      child: ElevatedButton(
        style:ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          primary: colorButton,onPrimary:Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),side: BorderSide(color: colorButton)),
        ),
        child: Text(text.toUpperCase(),style: TextStyle(color: colorText,fontSize: 16.0,fontWeight: FontWeight.bold)),
        onPressed: onPressed,
      ),
    );
  }
  Widget imagenFondo(){
    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: CachedNetworkImage(
        fadeInDuration: Duration(milliseconds: 300),
        fit: BoxFit.cover,
        imageUrl: "https://image.freepik.com/fotos-gratis/mulher-jovem-feliz-pulando-ouvindo-musica_171337-21525.jpg",
        placeholder: (context, urlImage) => Center(child: Container(color: Colors.grey[900])),
        errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey[900])),
      ),
    );
  }
}
