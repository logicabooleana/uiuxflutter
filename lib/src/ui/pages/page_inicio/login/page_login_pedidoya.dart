// Copyright 2020 Logica Booleana Authors 

// Dependencias 
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias 
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PageLoginPedidoYa extends StatelessWidget {
  const PageLoginPedidoYa();
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        imageFondo(),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar:appbar(context: context),
          body: body(),
        ),
      ],
    );
  }

  /* WIDGETS */
  PreferredSizeWidget appbar({required BuildContext context}){
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: InkWell(child: Icon(Icons.arrow_back,color: Colors.white),onTap:(){Navigator.of(context).pop();}),
    );
  }
  Widget body() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(child: Container()),
        buttonIconRound(iconData: FontAwesomeIcons.facebookF,onPressed: (){},text: "Continuar con Facebook",colorButton: Colors.blue,colorText: Colors.white),
        buttonIconRound(iconData: FontAwesomeIcons.google,onPressed: (){},text: "Continuar con Google",colorButton: Colors.white,colorText: Colors.grey),
        buttonIconRound(onPressed: (){},text: "Continuar de otra forma",colorButton: Colors.transparent,colorText: Colors.white,colorBorder: Colors.white),
        SizedBox(height: 20.0),
      ],
    );
  }

  /// WIDGETS COMPONENTS
  Widget buttonIconRound({required void Function()? onPressed,required String text,IconData ?iconData,Color colorButton=Colors.white,Color colorText=Colors.white,Color ?colorBorder}){
    if(colorBorder==null)colorBorder=colorButton;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical:8.0),
      child: ElevatedButton.icon(
        icon: iconData==null?Container():Icon(iconData,color: colorText),
        label: Text(text,style: TextStyle(color: colorText,fontSize: 16.0,fontWeight: FontWeight.bold)),
        style:ElevatedButton.styleFrom(
          padding: EdgeInsets.all(15.0),
          primary: colorButton,onPrimary:Colors.black,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50.0),side: BorderSide(color: colorBorder)),
        ),
        onPressed: onPressed,
      ),
    );
  }
  Widget imageFondo(){
    return SizedBox(
      height: double.infinity,width: double.infinity,
      child: CachedNetworkImage(
        fadeInDuration: Duration(milliseconds: 300),
        fit: BoxFit.cover,
        imageUrl: "https://tynmedia.com/tynmag/wp-content/uploads/sites/3/2018/04/PampitYa-PedidosYa-1-e1524194256744.jpg",
        placeholder: (context, urlImage) => Center(child: Container(color: Colors.grey[900])),
        errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey[900])),
      ),
    );
  }
}
