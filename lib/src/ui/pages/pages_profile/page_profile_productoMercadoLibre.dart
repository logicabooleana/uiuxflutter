/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

///  DESCRIPCIÓN
// Recreamos el perfil de un producto de una app de ventas online

// var
Map producto = {
  "url":
      "https://www.apple.com/newsroom/images/product/os/macos/standard/Apple-previews-macOS-Catalina-screen-06032019_big.jpg.large.jpg",
  "descripcion":
      "Apple Macbook Air (13 pulgadas, 2020, Chip M1, 256 GB de SSD, 8 GB de RAM) - Gris espacial",
  "precio": 186.633,
};

class PageProfileProductoMercadoLibre extends StatelessWidget {
  const PageProfileProductoMercadoLibre({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: appBar(),
      body: body(),
    );
  }

  PreferredSizeWidget appBar() {
    return AppBar(
      title: Text("Producto",
          style: TextStyle(color: Colors.black, fontFamily: 'OpenSans')),
      backgroundColor: Colors.yellow[600],
      leading: Icon(Icons.view_headline, color: Colors.black),
      actions: [
        Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(Icons.star_border, color: Colors.black87)),
        Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(Icons.search, color: Colors.black87)),
        Padding(
            padding: const EdgeInsets.all(6.0),
            child: Icon(Icons.shopping_cart, color: Colors.black87)),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(20.0),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Icon(Icons.location_on, size: 14.0, color: Colors.black45),
              Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text("Enviar a Capital Federal",
                    style: TextStyle(color: Colors.black45, fontSize: 14.0)),
              ),
              Icon(Icons.arrow_forward_ios, size: 14.0, color: Colors.black45),
            ],
          ),
        ),
      ),
    );
  }

  Widget body() {
    return ListView(
      padding: EdgeInsets.all(12),
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text("Nuevo | 1787 vendidos",
                    style: TextStyle(fontSize: 12.0, color: Colors.black45)),
              ),
              Text(producto["descripcion"],
                  style: TextStyle(fontSize: 16.0, color: Colors.black)),
              RatingBar.builder(
                  itemSize: 14.0,
                  initialRating: 3,
                  minRating: 1,
                  direction: Axis.horizontal,
                  allowHalfRating: true,
                  itemCount: 5,
                  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                  itemBuilder: (context, _) =>
                      Icon(Icons.star, color: Colors.blue),
                  onRatingUpdate: (rating) {}),
            ],
          ),
        ),
        widgetImagenProducto(urlImage: producto["url"]),
        buttonOptions(name: 'Capacidad:',item: '8 GB RAM | 256 SSD'),
        SizedBox(height:8),
        buttonOptions(name: 'Color:',item: 'Gris Espacial'),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(children: [
                Text('\$' + producto["precio"].toString(),
                    style: TextStyle(
                        fontSize: 30.0,
                        color: Colors.grey[800],
                        fontWeight: FontWeight.normal)),
                Text(" 18% OFF ",
                    style: TextStyle(fontSize: 18.0, color: Colors.green)),
              ]),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 3.0),
                child: Text(
                    "en 12 x \$ ${(producto["precio"] / 12).toStringAsFixed(2)} sin interés",
                    style: TextStyle(fontSize: 14.0, color: Colors.grey[800]),
                    textAlign: TextAlign.start),
              ),
              SizedBox(height: 12.0),
              Text("Ver todos los medios de pago",style: TextStyle(fontSize: 14.0, color: Colors.blue)),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 12),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.local_shipping_outlined,color: Colors.green[400],size: 16),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text: 'Llega gratis ', 
                                    style: TextStyle(color: Colors.green[400]),
                                    children: <TextSpan>[
                                      TextSpan(text: 'mañana sabado', style: TextStyle(color: Colors.green[400],fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text('Ver más formas de entrega',style: TextStyle(color: Colors.blue[400]),)
                              ],
                            ),
                          
                        ]),
                      ],
                    ),
                    SizedBox(height: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.turn_left_rounded,color: Colors.green[400],size: 16),
                            SizedBox(width: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Devolver gratis',style: TextStyle(color: Colors.green[400])),
                                SizedBox(height: 5),
                                Text('Ténes 30 días desde que lo recibís',style: TextStyle(color: Colors.grey[400]),),
                                SizedBox(height: 5),
                                Text('Conocer más',style: TextStyle(color: Colors.blue[400]),)
                              ],
                            ),
                          
                        ]),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        Text("Stock disponible",style: TextStyle(color: Colors.black),),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0,vertical:20),
          child: Card(
            margin: const EdgeInsets.all(0),
            color: Colors.grey[200],elevation: 0,
            child: ListTile(dense: false,
              contentPadding: EdgeInsets.symmetric(horizontal: 12,vertical: 0),
              trailing: Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 14),
              title: Text.rich(
                TextSpan(
                  text: 'Cantidad: 1 ', 
                  style: TextStyle(color: Colors.grey[800]),
                  children: <TextSpan>[
                    TextSpan(text: '(112 disponibles)', style: TextStyle(color: Colors.grey[400],fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Comprar"),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(8),
              shadowColor: MaterialStateProperty.all(Colors.blue),
                backgroundColor: MaterialStateProperty.all(Colors.blue),
                padding: MaterialStateProperty.all(EdgeInsets.all(20.0))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0),
          child: ElevatedButton(
            onPressed: () {},
            child: Text("Agregar al carrito",
                style: TextStyle(
                    fontSize: 14.0,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold)),
            style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
                backgroundColor: MaterialStateProperty.all(Colors.blue[50]),
                padding: MaterialStateProperty.all(EdgeInsets.all(20.0))),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20.0),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.security, size: 12.0, color: Colors.grey),
                  SizedBox(height: 3.0, width: 3.0),
                  Expanded(
                    child: Text(
                      "Compra protegida, recibí el producto que esperabas o te devolvemos tu dinero.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.spa, size: 12.0, color: Colors.grey),
                  SizedBox(height: 3.0, width: 3.0),
                  Expanded(
                    child: Text(
                      "Mercado Puntos. Sumás 12 puntos.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12.0),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Icon(Icons.assignment, size: 12.0, color: Colors.grey),
                  SizedBox(height: 3.0, width: 3.0),
                  Expanded(
                    child: Text(
                      "5 días de gatantía de fábrica.",
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 12.0, color: Colors.grey),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(onPressed: (){}, icon: Icon(Icons.favorite_border_rounded), label: Text("Agregar a favoritos")),
              TextButton.icon(onPressed: (){}, icon: Icon(Icons.share), label: Text("Compartir")),
              
            ],
          ),
        ),
      ],
    );
  }

  // Un widget imagen que intenta ajustar el tamaño del niño a una relación de aspecto específica
  Widget widgetImagenProducto({required String urlImage}) {
    return urlImage != ""
        ? CachedNetworkImage(
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
            imageUrl: urlImage,
            placeholder: (context, urlImage) => FadeInImage(
                fit: BoxFit.cover,
                image: AssetImage("assets/loading.gif"),
                placeholder: AssetImage("assets/loading.gif")),
            errorWidget: (context, urlImage, error) =>
                Center(child: Container(color: Colors.grey)),
          )
        : Container(color: Colors.black26);
  }

  buttonOptions({String name='',String item = 'ítem'}) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
          color: Colors.grey[200],
          borderRadius: BorderRadius.all(Radius.circular(5.0))),
      child: InkWell(
        onTap: () {},
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(children: [
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Opacity(
                    opacity: 0.7,
                    child: Text(name,
                        style: TextStyle(color: Colors.black))),
                Text(item,
                    style: TextStyle(color: Colors.black)),
              ],
            )),
            Icon(Icons.arrow_forward_ios, color: Colors.blue, size: 14),
          ]),
        ),
      ),
    );
  }
}
