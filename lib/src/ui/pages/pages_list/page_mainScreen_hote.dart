// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'dart:ui';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias */
import 'package:carousel_slider/carousel_slider.dart';
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:neon/neon.dart';

// README
// Esta es una ui creada para un motel que muestra infomación básica del motel y dezplazando hacia abajo muestra las habitaciones disponibles por cátegoria
// FEATURES
// ui created by @logica.booleana
// theme: dark/light
// animation: true
// interactivity: true

class PageMainScreenHotel extends StatefulWidget {
  PageMainScreenHotel({Key? key}) : super(key: key);

  @override
  _PageMainScreenHotelState createState() => _PageMainScreenHotelState();
}

class _PageMainScreenHotelState extends State<PageMainScreenHotel>
    with SingleTickerProviderStateMixin {
  // datos
  final List categories = [
    {
      'name': 'Home',
      'price': '',
      'color': Color.fromRGBO(95, 60, 122, 1.0),
    },
    {
      'name': 'Simple 🛌',
      'price': '\$1200',
      'color': Color.fromRGBO(56, 150, 150, 1.0),
      'listItems': [
        {
          "urlImage":
              "https://media-cdn.tripadvisor.com/media/photo-s/0c/ab/d2/ae/la-habitacion-por-la.jpg",
          "num": "01",
          "disponibilidad": true,
          'favorite': 20,
        },
        {
          "urlImage":
              "https://herculesboutiquehotel.com/wp-content/uploads/2019/02/Habitacion-San-Valentin-400x250.jpeg",
          "num": "02",
          "disponibilidad": true,
          'favorite': 46,
        },
        {
          "urlImage":
              "https://motelesmonterrey.com/wp-content/uploads/2019/05/Motel-Bego%C3%B1a-Monterrey-Habitaci%C3%B3n-Sencilla-1.jpg",
          "num": "03",
          "disponibilidad": false,
          'favorite': 19,
        },
        {
          "urlImage":
              "https://www.motelesdemonterrey.com/fotos/monterrey/hotelbegona/hotelbegona.jpg",
          "num": "04",
          "disponibilidad": false,
          'favorite': 26,
        },
      ],
    },
    {
      'name': 'Intermedia  💜',
      'price': '\$1250',
      'color': Color.fromRGBO(205, 41, 112, 1.0),
      'listItems': [
        {
          "urlImage":
              "https://cdn6.campograndenews.com.br/uploads/noticias/2020/03/10/3cvk2rjjqh440.jpg",
          "num": "05",
          "disponibilidad": true,
          'favorite': 20,
        },
        {
          "urlImage":
              "https://i.pinimg.com/originals/0a/18/6d/0a186d03cbd6abf834b65e14a5f9ac28.jpg",
          "num": "06",
          "disponibilidad": true,
          'favorite': 46,
        },
        {
          "urlImage":
              "https://media-cdn.tripadvisor.com/media/photo-s/07/e2/56/66/moteis-fantasy-3.jpg",
          "num": "07",
          "disponibilidad": true,
          'favorite': 19,
        },
        {
          "urlImage":
              "https://media-cdn.tripadvisor.com/media/photo-s/07/e2/57/86/moteis-fantasy-3.jpg",
          "num": "08",
          "disponibilidad": true,
          'favorite': 26,
        },
      ],
    },
    {
      'name': 'Especial  🥋',
      'price': '\$1290',
      'color': Color.fromRGBO(255, 160, 36, 1.0),
      'listItems': [
        {
          "urlImage":
              "https://www.hoteleskinky.com/img/hotel/blog/moteles-en-interlomas-para-darle-un-twist-a-tu-dia/moteles-en-interlomas-para-darle-un-twist-a-tu-dia.jpg",
          "num": "09",
          "disponibilidad": true,
          'favorite': 20,
        },
        {
          "urlImage":
              "https://img3.findglocal.com/075/953/1062551960759534.jpg",
          "num": "10",
          "disponibilidad": true,
          'favorite': 46,
        },
        {
          "urlImage":
              "https://motelespuebla.com/wp-content/uploads/2019/10/Motel-Majestic-Puebla-Jacuzzi-4-1024x683.jpg",
          "num": "11",
          "disponibilidad": true,
          'favorite': 19,
        },
        {
          "urlImage":
              "https://images.squarespace-cdn.com/content/v1/594d584f414fb58b21c60ee3/1549148544665-JI6AUDRJJ0490GO13WPK/Motel+medellin+grupal.jpg",
          "num": "12",
          "disponibilidad": true,
          'favorite': 26,
        },
      ],
    },
  ];

  // variables
  Color colorPrimary = Colors.deepPurple;
  final PageController _pageController = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dynamic color1 = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[900]
        : colorPrimary;
    dynamic colorAccent = Theme.of(context).brightness == Brightness.dark
        ? Colors.grey[900]
        : Colors.purple;

    return Theme(
      data: ThemeData(brightness: Brightness.dark),
      // Use AnimatedContainer : para suaviza la transición cuando cambia el color de fondo
      child: AnimatedContainer(
        duration: const Duration(seconds: 1),
        curve: Curves.fastOutSlowIn,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomCenter,
                stops: [0.0, 0.3],
                colors: [colorAccent, color1])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: appBar(context: context),
          body: body(context: context),
        ),
      ),
    );
  }

  PreferredSizeWidget appBar({required BuildContext context}) {
    return AppBar(
      backgroundColor: Colors.black12,
      leading: Container(),
      leadingWidth: 0,
      title: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Icon(Icons.favorite)),
              Padding(
                  padding: const EdgeInsets.only(left: 5, bottom: 5),
                  child: Icon(Icons.favorite, color: Colors.white60)),
            ],
          ),
          SizedBox(width: 5),
          Text("MOTEL", style: TextStyle(color: Colors.white)),
          Padding(
            padding: const EdgeInsets.all(8.0),
            // NEON : Un complemento de Flutter que te permite usar hermosos letreros de neón
            child: Neon(
                text: '24Hs',
                color: Colors.red,
                fontSize: 14,
                font: NeonFont.TextMeOne,
                flickeringText: false,
                flickeringLetters: [0, 1],
                glowing: false),
          )
        ],
      ),
      centerTitle: true,
      actions: [
        WidgetsUtilsApp()
            .buttonThemeBrightness(context: context, color: Colors.white),
      ],
    );
  }

  Widget body({required BuildContext context}) {
    List<Widget> views = [
      _pageMainScreem(context: context),
      _viewCarouselCars(
          context: context,
          obj: categories[1],
          titleAnterio: 'home',
          titleSiguiente: categories[2]['name']),
      _viewCarouselCars(
          context: context,
          obj: categories[2],
          titleAnterio: categories[1]['name'],
          titleSiguiente: categories[3]['name']),
      _viewCarouselCars(
          context: context,
          obj: categories[3],
          titleAnterio: categories[2]['name'],
          titleSiguiente: ''),
    ];
    // PageView : Una lista desplazable que funciona página por página
    return PageView.builder(
      controller: _pageController,
      scrollDirection: Axis.vertical,
      itemCount: views.length,
      onPageChanged: (value) {
        // cambiar el color del degradado con cada página en modo oscuro
        setState(() => colorPrimary = categories[value]['color']);
      },
      itemBuilder: (context, index) => views[index],
    );
  }

  Widget _pageMainScreem({required BuildContext context}) {
    // page - menú principal
    return Column(
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 25),
                  child: Text(
                      "Nuestro Hotel les brinda el tiempo y las mejores condiciones en cuanto a estructura y servicio para que usted pueda disfrutar y pasar un buen momento. Habitaciones standard y Especiales.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 16.0))),
              Expanded(
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          iconButtonText(
                              context: context,
                              text: "Menú",
                              iconData: Icons.menu_book,
                              color: Colors.purple),
                          iconButtonText(
                              context: context,
                              text: "Ubicación",
                              iconData: Icons.room,
                              color: Colors.purple),
                          iconButtonText(
                              context: context,
                              text: "Comparte",
                              iconData: Icons.share,
                              color: Colors.purple),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text('TURNOS', style: TextStyle(fontSize: 18)),
                            Text('Turno de 3hs de Domingos a Domingos',
                                style: TextStyle(fontSize: 14)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Divider(),
                      ),
                      button(
                          text:
                              "${categories[1]['name']}  ${categories[1]['price']}",
                          colorButton: categories[1]['color'],
                          colorText: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (_pageController.hasClients) {
                                _pageController.animateToPage(1,
                                    duration:
                                        const Duration(milliseconds: 1000),
                                    curve: Curves.linear);
                              }
                            });
                          }),
                      button(
                          text:
                              "${categories[2]['name']}  ${categories[2]['price']}",
                          colorButton: categories[2]['color'],
                          colorText: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (_pageController.hasClients) {
                                _pageController.animateToPage(2,
                                    duration:
                                        const Duration(milliseconds: 1400),
                                    curve: Curves.linear);
                              }
                            });
                          }),
                      button(
                          text:
                              "${categories[3]['name']}  ${categories[3]['price']}",
                          colorButton: categories[3]['color'],
                          colorText: Colors.white,
                          onPressed: () {
                            setState(() {
                              if (_pageController.hasClients) {
                                _pageController.animateToPage(3,
                                    duration:
                                        const Duration(milliseconds: 1700),
                                    curve: Curves.linear);
                              }
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Text("Habitaciones", textAlign: TextAlign.center),
        Icon(Icons.keyboard_arrow_down),
      ],
    );
  }

  Widget _viewCarouselCars({
    required BuildContext context,
    required Map obj,
    String titleAnterio = '',
    String titleSiguiente = '',
  }) {
    // var
    List<Map<dynamic, dynamic>> listItemss = obj["listItems"];

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // indicador con un icono y texto en la parte superior de la vista
            Column(
              children: [
                Icon(Icons.keyboard_arrow_up,
                    size: 30.0, color: Colors.white54),
                Text(titleAnterio,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white54)),
              ],
            ),
            // texto que indica el nombre de la cátegoria
            Center(
                child: Padding(
                    padding: const EdgeInsets.only(top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(obj["name"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold)),
                      ],
                    ))),
            // carrusel de tarjetas expandido
            Expanded(
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    enlargeCenterPage: true,
                    viewportFraction: 0.7,
                    height: double.infinity,
                    enableInfiniteScroll: listItemss.length == 1 ? false : true,
                    autoPlay: listItemss.length == 1 ? false : true),
                itemCount: listItemss.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.only(
                        bottom: 12.0, left: 12.0, right: 12.0, top: 50),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // card
                        CardRoom(context: context, obj: listItemss[index]),
                        // button
                        button(
                            padding: EdgeInsets.symmetric(
                                vertical: 14.0, horizontal: 14.0),
                            borderRadius: 30.0,
                            text: listItemss[index]["disponibilidad"]
                                ? 'RESERVAR'
                                : 'OCUPADA',
                            colorButton: listItemss[index]["disponibilidad"]
                                ? Colors.white30
                                : Colors.transparent,
                            colorText: Colors.white,
                            onPressed: listItemss[index]["disponibilidad"]
                                ? () {}
                                : null),
                      ],
                    ),
                  );
                },
              ),
            ),
            // indicador con un  icono y texto en la parte inferior de la vista
            titleSiguiente == ''
                ? Container()
                : Column(
                    children: [
                      Text(titleSiguiente,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white54)),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white54,
                        size: 30.0,
                      ),
                    ],
                  ),
          ],
        ),
      ],
    );
  }

  /// WIDGETS COMPONENTS
  Widget button(
      {required String text,
      double fontSize = 18.0,
      double borderRadius = 10.0,
      Color colorText = Colors.white,
      Color colorButton = Colors.purple,
      EdgeInsets? padding,
      required Function()? onPressed}) {
    if (padding == null) padding = EdgeInsets.all(20.0);

    return Padding(
      padding: padding,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          elevation: 0.0,
          padding: padding,
          onPrimary: Colors.white,
          primary: colorButton,
          shadowColor: colorButton,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              side: BorderSide(color: colorButton)),
          side: BorderSide(color: colorButton),
        ),
        child: Text(text.toUpperCase(),
            style: TextStyle(
                color: colorText,
                fontSize: fontSize,
                fontWeight: FontWeight.bold)),
        onPressed: onPressed,
      ),
    );
  }

  Widget iconButtonText(
      {double size = 50,
      required BuildContext context,
      required String text,
      IconData iconData = Icons.view_headline,
      MaterialColor color = Colors.blue,
      double borderRadius = 12.0}) {
    // IconButton con texto inferior

    TextStyle textStyle = TextStyle(
        color: Theme.of(context).brightness == Brightness.dark
            ? Colors.white
            : color[100],
        fontSize: size * 0.3);

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Material(
              color: Colors.transparent,
              child: Ink(
                  width: size,
                  height: size,
                  decoration: BoxDecoration(
                      color: color[100],
                      borderRadius: BorderRadius.circular(borderRadius)),
                  child: InkWell(
                      customBorder: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(12))),
                      splashColor: Colors.black12,
                      onTap: () {},
                      child: Icon(iconData, color: color, size: size * 0.5)))),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(text, style: textStyle, textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Widget backgroundimageBlur(
      {required String urlImage, double sigmaYXBlur = 5}) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ImageFiltered(
          imageFilter:
              ImageFilter.blur(sigmaY: sigmaYXBlur, sigmaX: sigmaYXBlur),
          child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 300),
              fit: BoxFit.cover,
              imageUrl: urlImage,
              placeholder: (context, urlImage) =>
                  Center(child: Container(color: Colors.grey[900])),
              errorWidget: (context, urlImage, error) =>
                  Center(child: Container(color: Colors.grey[900])))),
    );
  }

  Widget imageFondo({required String urlImage, double sigmaYXBlur = 5}) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      child: ImageFiltered(
          imageFilter:
              ImageFilter.blur(sigmaY: sigmaYXBlur, sigmaX: sigmaYXBlur),
          child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 300),
              fit: BoxFit.contain,
              imageUrl: urlImage,
              placeholder: (context, urlImage) =>
                  Center(child: CircularProgressIndicator()),
              errorWidget: (context, urlImage, error) =>
                  Center(child: Container(color: Colors.grey[900])))),
    );
  }
}

class CardRoom extends StatefulWidget {
  CardRoom({required this.context, required this.obj});

  // tarjeta expandido lo maximó posible
  bool like = false;
  final BuildContext context;
  final dynamic obj;

  @override
  _CardRoomState createState() => _CardRoomState();
}


class _CardRoomState extends State<CardRoom> {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: double.infinity,
      height: 300,
      child: Card(
        clipBehavior: Clip.antiAlias,
        elevation: 12.0,
        color: Colors.white38,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        child: Stack(fit: StackFit.expand,
          children: [
            // imagen con bordes redondeados
            Expanded(
              child: CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 300),
                  fit: BoxFit.cover,
                  imageUrl: widget.obj["urlImage"],
                  placeholder: (context, urlImage) =>
                      Center(child: CircularProgressIndicator()),
                  errorWidget: (context, urlImage, error) =>
                      Center(child: Container(color: Colors.grey[900]))),
            ),
            Column(
              children: [
                Expanded(child: Container()),
                // cantidad y boton de 'me gusta'y el numero de la habitación
                Container(
                  width: double.infinity,
                  margin:EdgeInsets.only(bottom: 12,right: 8,left: 8) ,
                  decoration: BoxDecoration(
                    color: Colors.white30,
                    borderRadius: BorderRadius.all(Radius.circular(20))
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // tres CircleAvatar superpuestos
                          Stack(
                            alignment: AlignmentDirectional.centerStart,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 16, top: 8.0),
                                child: CircleAvatar(maxRadius: 10.0,minRadius: 10.0,backgroundColor: Colors.grey[300]),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 8, top: 8.0),
                                child: CircleAvatar(maxRadius: 10.0,minRadius: 10.0,backgroundColor: Colors.grey[400]),),
                              Padding(
                                padding: const EdgeInsets.only(right: 14, top: 8.0),
                                child: CircleAvatar(maxRadius: 10.0,minRadius: 10.0,backgroundColor: Colors.grey)),
                            ],
                          ),
                          // cantidad de ' me gusta'
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 8.0, right: 12.0, top: 8.0),
                            child: Text(
                              'y a ${widget.obj["favorite"]} personas le gusto',
                              style: const TextStyle(overflow: TextOverflow.ellipsis,
                                  color: Colors.white, fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          IconButton(
                              onPressed: () => setState(() => widget.like = !widget.like ),
                              icon: Icon( widget.like?Icons.favorite:Icons.favorite_border_outlined,size: 30.0,color: widget.like ? Colors.red : Colors.white)),
                          Text(widget.obj["num"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24.0,
                                  fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
