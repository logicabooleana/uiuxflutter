/// Copyright 2020 Lógica Booleana Authors */

/// Dependencias
import 'dart:math';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class PagelistPedidoYa extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 250, 248, 248),
      drawer: Drawer(),
      appBar: appbar(),
      body: body(context: context),
    );
  }

  /// WIDGETS
  PreferredSizeWidget appbar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      brightness: Brightness.dark,
      iconTheme: IconThemeData(color: Colors.grey[800]),
      title: Row(children: [
        Text("Madero 149",
            style: TextStyle(
                fontSize: 17.0,
                color: Colors.black,
                fontWeight: FontWeight.bold)),
        Icon(
          Icons.keyboard_arrow_down,
          size: 18.0,
          color: Colors.black,
        )
      ]),
      actions: [
        Padding(
            padding: const EdgeInsets.all(12.0),
            child: Icon(Icons.notifications_none, color: Colors.grey[800]))
      ],
    );
  }

  Widget body({required BuildContext context}) {
    // Crea una serie de animaciones con el package "animate_do" */
    // ¡¡¡ Usamos un SingleChildScrollView y no un ListView para prevenir que se refresquen las vistas !!! */
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          ElasticIn(
              child: buttonBuscador(), delay: const Duration(milliseconds: 0)),
          listButtonsCategory(),
          FadeInLeft(
            child: ListHorizontalCardsPublished(),
            delay: const Duration(milliseconds: 1000),
          ),
          FadeInLeft(
              child: listHorizontalCardsSugerencias(),
              delay: const Duration(milliseconds: 1500)),
          FadeInLeft(
              child: listHorizontalCardsITemsNegocios(context: context),
              delay: const Duration(milliseconds: 2000)),
          FadeInLeft(
              child: listHorizontalCardsSugerencias(),
              delay: const Duration(milliseconds: 1500)),
        ],
      ),
    );
  }

  /// WIDGETS VIEWS
  Widget listButtonsCategory() {
    // var
    Color colorButton = Color.fromARGB(255, 242, 234, 234);

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElasticIn(
                  delay: const Duration(milliseconds: 500),
                  child: buttonCircle(
                      heroTag: "heroTag0",
                      icon: Icons.restaurant,
                      texto: "Testaurantes",
                      colorButonText: Colors.red[400]!,
                      colorButton: colorButton,
                      colorText: Colors.black)),
              ElasticIn(
                  delay: const Duration(milliseconds: 700),
                  child: buttonCircle(
                      heroTag: "heroTag1",
                      icon: Icons.shopping_basket,
                      texto: "Mercados",
                      colorButonText: Colors.green[400]!,
                      colorButton: colorButton,
                      colorText: Colors.black)),
              ElasticIn(
                  delay: const Duration(milliseconds: 900),
                  child: buttonCircle(
                      heroTag: "heroTag2",
                      icon: Icons.local_bar,
                      texto: "Bebidas",
                      colorButonText: Colors.pink[400]!,
                      colorButton: colorButton,
                      colorText: Colors.black)),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElasticIn(
                    delay: const Duration(milliseconds: 1100),
                    child: buttonCircle(
                        heroTag: "heroTag3",
                        icon: FontAwesomeIcons.candyCane,
                        texto: "Kioscos",
                        colorButonText: Colors.pinkAccent,
                        colorButton: colorButton,
                        colorText: Colors.black)),
                ElasticIn(
                    delay: const Duration(milliseconds: 1300),
                    child: buttonCircle(
                        heroTag: "heroTag4",
                        icon: Icons.local_cafe,
                        texto: "Café & Deli",
                        colorButonText: Colors.brown[400]!,
                        colorButton: colorButton,
                        colorText: Colors.black)),
                ElasticIn(
                    delay: const Duration(milliseconds: 1500),
                    child: buttonCircle(
                        heroTag: "heroTag5",
                        icon: Icons.dialpad,
                        texto: "Otros",
                        colorButonText: Colors.blue[400]!,
                        colorButton: colorButton,
                        colorText: Colors.black)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget listHorizontalCardsSugerencias() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Sugerencias para vos",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Text("Recomendados para tu ubicación",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
            ],
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 0.0),
          width: double.infinity,
          height: 300.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              cardSugerencias(
                  ubicacion: "30-45 min",
                  titulo: "Mega Boom Bacon Doble",
                  precio: "\$ 199",
                  url:
                      "https://www.mostazaweb.com.ar/wp-content/uploads/2020/08/Mega-BOOM-Bacon-Doble-2-1.jpg"),
              cardSugerencias(
                  ubicacion: "República de caseros 30-45 mins",
                  titulo: "Milanesa de ternera a la napolitana",
                  precio: "\$ 590",
                  url:
                      "https://www.conclusion.com.ar/wp-content/uploads/2018/08/Milanesas-napolitanas.jpg"),
              cardSugerencias(
                  ubicacion: "El Once Liniers 45-60 mins",
                  titulo: "Matambrito de cerdo a la pizza con 2 guarniciones",
                  precio: "\$ 410",
                  url: "https://i.ytimg.com/vi/-LPGCxY-kxw/maxresdefault.jpg"),
              cardSugerencias(
                  ubicacion: "La Payada Villa Luro 30-45 mins",
                  titulo: "Promo - 6 empanadas",
                  precio: "\$ 510",
                  url:
                      "https://simplementerecetas.com/wp-content/uploads/2019/11/Empanadas-de-carne-con-queso-e1574264107672.jpg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget listHorizontalCardsITemsNegocios({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 0.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text("Restaurantes para descubrir",
                  style: TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.black)),
              Text("Sugeridos para disfrutar nuevas experiencias",
                  style: TextStyle(
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      color: Colors.grey)),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 220.0,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: [
              cardPublicidadNegocios(
                context: context,
                titulo: "Tequewins",
                puntuacion: "4.5",
                tiempo: "30-45 min",
                urlPortadad:
                    "https://www.lavanguardia.com/files/article_main_microformat/uploads/2020/02/20/5e997b62999d2.jpeg",
                urlNegocio:
                    "https://i.pinimg.com/originals/1e/a4/4e/1ea44ec76e50f6ef37ca24eee4bd5486.jpg",
              ),
              cardPublicidadNegocios(
                context: context,
                titulo: "Heladeria Alessandro Rivadavia",
                puntuacion: "4.7",
                tiempo: "15-30 min",
                urlPortadad:
                    "https://us.cdn.eltribuno.com/112018/1541203650859.jpg",
                urlNegocio:
                    "https://media-cdn.tripadvisor.com/media/photo-s/13/80/e5/39/te-esperamos.jpg",
              ),
              cardPublicidadNegocios(
                context: context,
                titulo: "Viejo Patrón",
                puntuacion: "4.2",
                tiempo: "40-60 min",
                urlPortadad:
                    "https://okdiario.com/img/2018/08/20/cordero-asado-con-hortalizas-655x368.jpg",
                urlNegocio:
                    "https://media-cdn.tripadvisor.com/media/photo-s/15/c1/94/fe/our-restaurant-fire-side.jpg",
              ),
            ],
          ),
        ),
      ],
    );
  }

  ///  WIDGETS COMPONENTS
  Widget dotsIndicator(
      {required PageController pageController, required List pages}) {
    return DotsIndicator(
      controller: pageController,
      itemCount: pages.length,
      onPageSelected: (int page) {
        pageController.animateToPage(page,
            duration: const Duration(milliseconds: 300), curve: Curves.ease);
      },
    );
  }

  Widget buttonBuscador() {
    return Container(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(Icons.search, color: Colors.grey[600]),
          label: Text("¿A dónde quieres pedir?",
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: Colors.grey[600], fontStyle: FontStyle.normal)),
          style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                  Color.fromARGB(255, 242, 234, 234)),
              shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25)))),
        ),
      ),
    );
  }

  Widget buttonCircle(
      {required String heroTag,
      required String texto,
      required IconData icon,
      Color colorText = Colors.grey,
      Color colorButton = Colors.white,
      Color colorButonText = Colors.grey}) {
    double size = 75.0;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
              width: size,
              height: size,
              child: FloatingActionButton(
                heroTag: heroTag,
                onPressed: () {},
                elevation: 0.0,
                child: Icon(icon, color: colorButonText, size: 30.0),
                backgroundColor: colorButton,
              )),
          Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                  width: size - 5,
                  child: Text(texto,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: colorText,
                          fontSize: 11.0,
                          fontWeight: FontWeight.bold)))),
        ],
      ),
    );
  }

  Widget cardSugerencias(
      {required String url,
      String ubicacion = "",
      String titulo = "",
      String precio = ""}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, left: 8.0),
      child: Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: InkWell(
          child: Container(
            color: Colors.white,
            width: 200.0,
            height: 250.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                    width: 200.0,
                    height: 175.0,
                    child: CachedNetworkImage(
                        fadeInDuration: Duration(milliseconds: 200),
                        fit: BoxFit.cover,
                        imageUrl: url,
                        placeholder: (context, urlImage) =>
                            Container(color: Colors.grey),
                        errorWidget: (context, urlImage, error) =>
                            Center(child: Container(color: Colors.grey)))),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        ubicacion != ""
                            ? Text(ubicacion,
                                style: TextStyle(
                                    fontSize: 12.0, color: Colors.grey[600]),
                                maxLines: 1)
                            : Container(),
                        titulo != ""
                            ? Text(titulo,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                maxLines: 2)
                            : Container(),
                        precio != ""
                            ? Text(precio,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                maxLines: 1)
                            : Container(),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget cardPublicidadNegocios(
      {required BuildContext context,
      required String urlPortadad,
      required String urlNegocio,
      String titulo = "",
      String puntuacion = "0",
      String tiempo = ""}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, left: 8.0),
      child: Card(
        color: Colors.white,
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        elevation: 5.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                width: 300.0,
                height: 125.0,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CachedNetworkImage(
                    fadeInDuration: Duration(milliseconds: 200),
                    fit: BoxFit.cover,
                    imageUrl: urlPortadad,
                    placeholder: (context, urlImage) =>
                        Container(color: Colors.grey),
                    errorWidget: (context, urlImage, error) =>
                        Center(child: Container(color: Colors.grey)))),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Card(
                      elevation: 0.0,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                      child: Container(
                          width: 40.0,
                          height: 40.0,
                          decoration: BoxDecoration(shape: BoxShape.circle),
                          child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 200),
                              fit: BoxFit.cover,
                              imageUrl: urlNegocio,
                              placeholder: (context, urlImage) =>
                                  Container(color: Colors.grey),
                              errorWidget: (context, urlImage, error) => Center(
                                  child: Container(color: Colors.grey)))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        titulo != ""
                            ? Text(titulo,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold))
                            : Container(),
                        Row(
                          children: [
                            Icon(Icons.star, size: 12.0, color: Colors.green),
                            Text(puntuacion,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                            Text("  ",
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.green,
                                    fontWeight: FontWeight.bold)),
                            Text(tiempo,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

///  CLASS WIDGETS
class ListHorizontalCardsPublished extends StatefulWidget {
  @override
  _ListHorizontalCardsPublishedState createState() =>
      _ListHorizontalCardsPublishedState();
}

class _ListHorizontalCardsPublishedState
    extends State<ListHorizontalCardsPublished> {
  // var
  int _current = 0;

  @override
  Widget build(BuildContext context) {
    List listItem = [
      cardPublicidad(
          url:
              "https://imagenes.montevideo.com.uy/imgnoticias/201707/_W933_80/619214.jpg"),
      cardPublicidad(
          url:
              "https://image.freepik.com/vector-gratis/pizza-e-ingredientes-pizza-sobre-fondo-negro-madera-menu-pizza-objeto-embalaje-publicidad-menu_162867-2.jpg"),
      cardPublicidad(
          url:
              "https://www.webretail.com.ar/v2/wp-content/uploads/2019/09/Mostaza-Hamburguesa.jpg"),
    ];

    return Container(); // TODO : dependencia 'Swiper' descontinuado
    /* return Column(
      crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,height: 150.0,
          child: new Swiper(index: _current,
            itemBuilder: (BuildContext context, int index) =>listItem[index],
            itemCount: listItem.length,viewportFraction: 0.8,scale: 0.9,
            onIndexChanged: (value) {
              setState(() {
                _current=value;
              });
            },
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: listItem.map((url) {
            int index = listItem.indexOf(url);
            return Container(
              width: 8.0,height: 8.0,
              margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
              decoration: BoxDecoration(shape: BoxShape.circle,color: _current == index? Colors.grey: Colors.grey[300]),
            );
          }).toList(),
        ),
      ],
    ); */
  }

  Widget cardPublicidad({required String url}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: InkWell(
          onTap: () {},
          child: Container(
            width: 300.0,
            height: 150.0,
            decoration: BoxDecoration(shape: BoxShape.circle),
            child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.cover,
                imageUrl: url,
                placeholder: (context, urlImage) =>
                    Container(color: Colors.grey),
                errorWidget: (context, urlImage, error) =>
                    Center(child: Container(color: Colors.grey))),
          ),
        ),
      ),
    );
  }
}

/// Un indicador que muestra la página actualmente seleccionada de un PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator(
      {required this.controller,
      required this.itemCount,
      required this.onPageSelected,
      this.color: Colors.white})
      : super(listenable: controller);
  // El PageController que representa este DotsIndicator.
  final PageController controller;
  // La cantidad de elementos administrados por PageController
  final int itemCount;
  // Llamado cuando se toca un punto
  final ValueChanged<int> onPageSelected;

  // El color de los puntos.
  // Defaults to `Colors.white`.
  final Color color;
  // El tamaño base de los puntos
  static const double _kDotSize = 8.0;
  // El aumento en el tamaño del punto seleccionado.
  static const double _kMaxZoom = 2.0;
  // La distancia entre el centro de cada punto
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(max(0.0,
        1.0 - ((controller.page ?? controller.initialPage) - index).abs()));
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,
      height: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(onTap: () => onPageSelected(index)),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}
