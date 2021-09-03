import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
/// Copyright 2020 Logica Booleana Authors 

// Dependencias
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:cached_network_image/cached_network_image.dart';

class PageProfileNetflix extends StatelessWidget {
  PageProfileNetflix({Key ?key}) : super(key: key);

  final Map pelicula ={
    "url":"https://pics.filmaffinity.com/Loco_por_ella-517833573-large.jpg",
    "title": "Loco por ella",
    "description":"Loco por ella es una película española cómica original de Netflix estrenada el 26 de febrero de 2021.​ La película está dirigida por Dani de la Orden y protagonizada por Álvaro Cervantes y Susana Abaitua",
    "distribution":"Protagonistas: Susana Abaitua, Álvaro Cervantes, Luis Zahera, Aixa Villagrán",
  };
  final List listaPeliculas =[
    {"titulo":"Nación Z","url":"https://www.formulatv.com/images/series/posters/900/931/1_m1.jpg"},
    {"titulo":"pelicula","url":"https://i.pinimg.com/736x/b8/7a/a9/b87aa9d39089434e02cce9497e283661.jpg"},
    {"titulo":"pelicula","url":"https://www.accioncine.es/media/k2/items/cache/5b591a58cb6e9d0cf283871f39f87dd2_XL.jpg"},
    {"titulo":"pelicula","url":"https://pics.filmaffinity.com/resident_evil_extinction_resident_evil_3-571197761-large.jpg"},
    {"titulo":"pelicula","url":"https://cdn.20m.es/img/2020/02/12/372/2152334.jpg"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      body: body(context: context),
    );
  }
  PreferredSizeWidget appBar({required BuildContext context}){

    
    return AppBar(
      iconTheme: IconThemeData(color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black),
      backgroundColor: Theme.of(context).canvasColor,
      actions: [
        WidgetsUtilsApp().buttonThemeBrightness(context: context),
      ],
    );
  }
  Widget body({required BuildContext context}){
    return Column(
      children: [
        portada(context: context),
        Expanded(
          child: ListView(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.start,
                  children: [
                    Text("Serie"),
                    Text(pelicula["title"],style:TextStyle(fontSize:25.0,fontWeight:FontWeight.bold)),
                    Row(
                      children: [
                        Text("%90 para ti",style: TextStyle(fontSize: 12.0,color: Colors.green)),
                        SizedBox(width: 4.0),
                        Text("2021",style: TextStyle(fontSize: 12.0)),
                        SizedBox(width: 4.0),
                        Card(clipBehavior: Clip.antiAlias,elevation: 0.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),child: Padding(padding: const EdgeInsets.all(2.0),child: Text("16+",style: TextStyle(fontSize:12.0)))),
                        Card(clipBehavior: Clip.antiAlias,elevation: 0.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),child: Padding(padding: const EdgeInsets.all(2.0),child: Text("HD",style: TextStyle(fontSize:12.0)))),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:0.0),child: RaisedButton.icon(icon: Icon(Icons.play_arrow,color: Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.white,),padding:EdgeInsets.all(0.0),elevation: 1.0,onPressed: () {},color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,label: Text("Ver",style: TextStyle(fontSize: 14.0, color: Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.white,fontWeight: FontWeight.bold)))),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:0.0),child: RaisedButton.icon(icon: Icon(Icons.arrow_downward,color:Colors.white),padding:EdgeInsets.all(0.0),elevation: 1.0,onPressed: () {},color: Theme.of(context).brightness==Brightness.dark?Colors.grey[900]:Colors.grey[400],label: Text("Descargar",style: TextStyle(fontSize: 14.0, color:Colors.white,fontWeight: FontWeight.bold)))),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(pelicula["description"]),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(pelicula["distribution"],style:TextStyle(fontSize:12.0,fontWeight:FontWeight.normal,color: Colors.grey)),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Expanded(child: InkWell(splashColor: Colors.green,onTap: () {},child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Icon(Icons.check,size: 24.0,),Text("Mi lista",style:TextStyle(fontSize: 10.0))]))),
                    Expanded(child: InkWell(splashColor: Colors.green,onTap: () {},child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Icon(Icons.thumb_up,size: 24.0,),Text("Calificado",style:TextStyle(fontSize: 10.0))]))),
                    Expanded(child: InkWell(splashColor: Colors.green,onTap: () {},child: Column(mainAxisAlignment: MainAxisAlignment.center,children: <Widget>[Icon(Icons.share,size: 24.0,),Text("Compartir",style:TextStyle(fontSize: 10.0))]))),
                  ],
                ),
              ),
              listHorizontalCards(titulo:"Similares",listPeliculas:listaPeliculas),
              SizedBox(height: 50.0),
            ],
          ),
        ),
      ],
    );
  }
  /// WIDGETS VIEWS
  Widget portada({required BuildContext context}){
    return Container(
      width: double.infinity,height: 250.0,
      child: CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl: pelicula["url"],placeholder: (context, urlImage) => Center(child: Container(color: Colors.grey)),errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey)),),
    );
  }
  Widget listHorizontalCards({ required String titulo,required  List listPeliculas}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0,top:25.0,left: 12.0,right: 20.0),
          child:Text(titulo,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold)),
        ),
        Container(
          width:double.infinity,
          height: 200.0,
          child: ListView.builder(
            scrollDirection:Axis.horizontal,
            itemCount:listPeliculas.length,
            itemBuilder: (context, index) => cardItemPelicula(url:listPeliculas[index]["url"]),
          ),
        ),
      ],
    );
  }

  /// WIDGETS COMPONENTS
  Widget cardItemPelicula({required String url}){
    return Card(
      margin:const EdgeInsets.all(3.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4.0)),
      child: InkWell(
        child: Container(
          width: 140.0,
          child: CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl:url,placeholder: (context, urlImage) => Container(color: Colors.grey),errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey))),
        ),
      ),
    );
  }
}

