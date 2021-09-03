/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

///  DESCRIPCIÓN
// Recreamos el perfil de un producto de una app de ventas online

// var
Map producto ={
  "url":"https://saborstore.com/wp-content/uploads/2019/10/Remera-SkateCho-Rosa-Negro-Frente.jpg",
  "titulo": "Oferta temporal",
  "descripcion":"Remeras Lisas Mujer Manga Corta Algodón 24 Colores!",
  "precio": 2700,
  "textoButton": "Ver todas las ofertas temporales",
};

class PageProfileProductoMercadoLibre extends StatelessWidget {
  const PageProfileProductoMercadoLibre({Key ?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: appBar(),
      body: body(),
    );
  }
  PreferredSizeWidget appBar(){
    return AppBar(
        title: Text("Producto",style: TextStyle(color: Colors.black,fontFamily: 'Raleway')),
        backgroundColor: Colors.yellow[600],
        leading: Icon(Icons.view_headline, color: Colors.black),
        brightness: Brightness.dark,
        actions: [
          Padding(padding: const EdgeInsets.all(6.0),child: Icon(Icons.star_border,color: Colors.black87)),
          Padding(padding: const EdgeInsets.all(6.0),child: Icon(Icons.search,color: Colors.black87)),
          Padding(padding: const EdgeInsets.all(6.0),child: Icon(Icons.shopping_cart,color: Colors.black87)),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 14.0, color: Colors.black45),
                Padding(padding: const EdgeInsets.all(3.0),child: Text("Enviar a Capital Federal",style: TextStyle(color: Colors.black45, fontSize: 14.0)),),
                Icon(Icons.arrow_forward_ios,size: 14.0, color: Colors.black45),
              ],
            ),
          ),
        ),
      );
  }
  Widget body(){
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Text("Nuevo - 646 vendidos",style: TextStyle(fontSize: 12.0,color: Colors.black45)),
              Text(producto["descripcion"],style: TextStyle(fontSize: 16.0,color: Colors.black)),
              RatingBar.builder(itemSize: 14.0,initialRating: 3,minRating: 1,direction: Axis.horizontal,allowHalfRating: true,itemCount: 5,itemPadding: EdgeInsets.symmetric(horizontal: 1.0),itemBuilder: (context, _) => Icon(Icons.star,color: Colors.blue),onRatingUpdate: (rating) {}),
            ],
          ),
        ),
        widgetImagenProducto(urlImage: producto["url"]),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(color: Colors.grey[200],borderRadius: BorderRadius.all(Radius.circular(5.0))),
          //shape: RoundedRectangleBorder(side: BorderSide(color: Colors.grey, width: 0),borderRadius: BorderRadius.circular(10)),
          //elevation: 0.0,
          child: InkWell(onTap: (){},
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(children: [Expanded(child: Text("color: Rosa",style: TextStyle(color: Colors.black),)),Icon(Icons.arrow_right,color: Colors.blue,)]),
            ),
            //child:ListTile(tileColor: Colors.blue[300],title: Text("color: Rosa",style: TextStyle(color: Colors.black),),trailing: Icon(Icons.arrow_forward_ios,color: Colors.blue,),),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Column(
            crossAxisAlignment:CrossAxisAlignment.start,
            mainAxisAlignment:MainAxisAlignment.start,
            children: [
              Row(
                children: [
                Text('\$'+producto["precio"].toString(),style: TextStyle(fontSize: 30.0,color: Colors.black,fontWeight: FontWeight.normal)),
                Text(" 18% OFF ",style: TextStyle(fontSize: 18.0,color: Colors.green)),
                ]
              ),
              Padding(padding: const EdgeInsets.symmetric(vertical: 3.0),child: Text("en 12 x \$ ${(producto["precio"]/12).toStringAsFixed(2)} sin interés",style: TextStyle(fontSize: 14.0, color: Colors.green[600]),textAlign:TextAlign.start),),
              SizedBox(height: 12.0),
              Text("Ver los medios de pago",style: TextStyle(fontSize: 14.0,color: Colors.blue)),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ElevatedButton(onPressed: (){}, child: Text("Comprara"),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue),padding: MaterialStateProperty.all(EdgeInsets.all(20.0))),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ElevatedButton(onPressed: (){}, child: Text("Agregar al carrito",style: TextStyle(fontSize: 14.0, color: Colors.blue,fontWeight: FontWeight.bold)),style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.blue[50]),padding: MaterialStateProperty.all(EdgeInsets.all(20.0))),),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment:CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.security,size: 12.0,color: Colors.grey),
                  SizedBox(height:3.0,width: 3.0),
                  Expanded(child: Text("Compra protegida, recibí el producto que esperabas o te devolvemos tu dinero.",maxLines: 2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize:12.0,color: Colors.grey),),),
                ],
              ),
              SizedBox(height: 12.0),
              Row(
                crossAxisAlignment:CrossAxisAlignment.start ,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.spa,size: 12.0,color: Colors.grey),
                  SizedBox(height:3.0,width: 3.0),
                  Expanded(child: Text("Mercado Puntos. Sumás 12 puntos.",maxLines: 2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize:12.0,color: Colors.grey),),),
                ],
              ),
              SizedBox(height: 12.0),
              Row(
                crossAxisAlignment:CrossAxisAlignment.start ,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.assignment,size: 12.0,color: Colors.grey),
                  SizedBox(height:3.0,width: 3.0),
                  Expanded(child: Text("5 días de gatantía de fábrica.",maxLines: 2,overflow:TextOverflow.ellipsis,style: TextStyle(fontSize:12.0,color: Colors.grey),),),
                ],
              ),
            ],
          ),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(onPressed: () {},style: ButtonStyle(elevation: MaterialStateProperty.all(0.0),backgroundColor: MaterialStateProperty.all(Colors.transparent)),icon: Icon(Icons.star_border,size: 20.0,color: Colors.blue),label: Text("Agregar a favoritos",style: TextStyle(fontSize: 14.0, color: Colors.blue,fontWeight: FontWeight.w400))),
              ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton.icon(onPressed: () {},style: ButtonStyle(elevation: MaterialStateProperty.all(0.0),backgroundColor: MaterialStateProperty.all(Colors.transparent)),icon: Icon(Icons.share,size: 20.0,color: Colors.blue),label: Text("Compartir",style: TextStyle(fontSize: 14.0, color: Colors.blue,fontWeight: FontWeight.w400)),),
              ),
          ],
        ),
      ],
    );
  }
  // Un widget imagen que intenta ajustar el tamaño del niño a una relación de aspecto específica
  Widget widgetImagenProducto({ required String urlImage}) {
    return AspectRatio(
      aspectRatio: 100 / 100,
      child: urlImage != ""
          ? CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 200),
              fit: BoxFit.cover,
              imageUrl: urlImage,
              placeholder: (context, urlImage) => FadeInImage(fit: BoxFit.cover,image: AssetImage("assets/loading.gif"),placeholder: AssetImage("assets/loading.gif")),
              errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey)),
          ):Container(color: Colors.black26),
    );
  }
}
