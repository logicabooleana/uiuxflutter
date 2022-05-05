// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PageListGuideAr extends StatelessWidget {
  // var
  final List listLocations = [
    {
      "listItems": [
        {
          "urlImage":
              "https://www.buenosaires.gob.ar/sites/gcaba/files/field/image/20190218_9dejulio_dji_0388_2.jpg",
          "description": "El Obelisco de Buenos Aires",
          "location": "Ciudad Autónoma de Buenos Aires",
        },
        {
          "urlImage":
              "https://www.elportalinmobiliario.com.mx/cnt-articulos/2020/07/156970.jpg",
          "description": "La Boca",
          "location": "Ciudad Autónoma de Buenos Aires",
        },
        {
          "urlImage": "https://mapio.net/images-p/1172789.jpg",
          "description": "Presa Ingeniero Carlos F. Roggero",
          "location":
              "Provincia de Buenos Aires, dividida en 	Moreno, Marcos Paz, Merlo y General Rodríguez",
        },
        {
          "urlImage":
              "https://upload.wikimedia.org/wikipedia/commons/b/b6/Casa_Rosada%2C_frente.jpg",
          "description": "La Casa Rosada es la sede del Poder Ejecutivo",
          "location": " Ciudad Autónoma de Buenos Aires",
        },
      ],
      "title": "Buesnos Aires",
      "description":
          "Buenos Aires es la gran capital cosmopolita de Argentina. Su centro es la Plaza de Mayo, rodeada de imponentes edificios del siglo XIX, incluida la Casa Rosada, el icónico palacio presidencial",
    },
    {
      "listItems": [
        {
          "urlImage":
              "https://aws.traveler.es/prod/designs/v1/assets/940x627/158844.jpg",
          "description": "Parque Nacional Iguazú",
          "location": "Puerto Iguazú",
        },
        {
          "urlImage":
              "https://www.misiones.tur.ar/upload/seccion/4a50e87c8e96170e5f7348a10eb54b0140d9ce46.JPG",
          "description": "La Ruta de la Selva y la Huella Guaraní",
          "location":
              "Misiones cuenta con un millón y medio de hectáreas bajo Manejo Sustentables, divididas en más de 70 Áreas Naturales Protegidas",
        },
        {
          "urlImage":
              "https://universes.art/fileadmin/_migrated/gridelement_uploads/mobile/06-IMG_4610-800-700.jpg",
          "description": "San Ignacio",
          "location": "ruta nacional N° 12 en la provincia de Misiones",
        },
      ],
      "title": "Misiones",
      "description":
          "Cataratas, suelo rojizo, selva generosa: emblemas de un territorio incomparable, cuyo nombre recuerda a los pueblos jesuíticos, sin negar las raíces de la América indígena",
    },
    {
      "listItems": [
        {
          "urlImage":
              "https://www.tangol.com/blog/Fotos/Notas/pasarelas-del-glaciar-perito-moreno_15_202008140713460.PNG",
          "description": "Glaciar Perito Moreno",
          "location": "Santa Cruz",
        },
      ],
      "title": "Santa Cruz",
      "description":
          "Santa Cruz es una provincia en la Patagonia argentina en el sur del país",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.white,
      appBar: appbar(context: context),
      body: body(context: context),
    );
  }

  /// WIDGETS VIEWS
  PreferredSizeWidget appbar({required BuildContext context}) {
    // no necesita una AppBar, solo aplicar color a la barra de estado del sistema
    Color colorAppBar = Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    Brightness brightness = Theme.of(context).brightness == Brightness.dark
        ? Brightness.dark
        : Brightness.light;

    return PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(backgroundColor: colorAppBar, brightness: brightness));
  }

  Widget body({required BuildContext context}) {
    return Stack(
      children: [
        PageView.builder(
          scrollDirection: Axis.vertical,
          itemCount: listLocations.length,
          itemBuilder: (context, index) {
            return _createLocationView(context: context, objects: listLocations, position: index);
          },
        ),
        _createAppBarButton(
            context: context, brightness: Theme.of(context).brightness),
      ],
    );
  }

  Widget _createAppBarButton({
    required BuildContext context,
    required Brightness brightness,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buttonLateral(
            context: context,
            iconData: Icons.dehaze,
            onTap: () {},
            isDark: brightness == Brightness.light,
            sizeIcon: 35.0),
        _buttonLateral(
            context: context,
            iconData: Icons.search,
            onTap: () {},
            leftDirection: true,
            isDark: brightness == Brightness.light,
            sizeIcon: 35.0),
      ],
    );
  }

  Widget _createLocationView(
      {required BuildContext context,
      required List<dynamic> objects,
      required int position}) {
    // var
    String titleAnterio = position == 0
        ? ""
        : objects[position - 1][
            "title"]; // Le asignamos la información del objeto anterior y en el caso que este en la posición sea 0 devolvera un texto vacio
    String titleSiguiente = position + 1 == objects.length
        ? "final"
        : objects[position + 1][
            "title"]; // hace lo mismo solo si esta en la posición final  en el texto inferior
    Map obj = objects[position];
    List<Map<dynamic, dynamic>> listItemss = obj["listItems"];

    return Stack(
      alignment: AlignmentDirectional.topCenter,
      children: [
        Theme.of(context).brightness == Brightness.dark
            ? backgroundimageBlur(
                urlImage: listItemss[0]["urlImage"], sigmaYXBlur: 9)
            : Container(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: double.infinity,height: 60),
            Column(
              children: [
                position == 0 ? Container() : Icon(Icons.keyboard_arrow_up_sharp),
                Text(titleAnterio, textAlign: TextAlign.center),
              ],
            ),
            Center(
                child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(obj["title"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 24.0, fontWeight: FontWeight.bold)),
                        Text(obj["description"],
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20.0)),
                      ],
                    ))),
            Container(
              padding: const EdgeInsets.only(bottom: 50.0),
              child: CarouselSlider.builder(
                options: CarouselOptions(
                    height: 400,
                    enableInfiniteScroll: listItemss.length == 1 ? false : true,
                    autoPlay: listItemss.length == 1 ? false : true),
                itemCount: listItemss.length,
                itemBuilder: (context, index, realIndex) {
                  return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  listItemss[index]["description"],
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 24.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            )),
                        Expanded(
                            child: imageFondo(
                                urlImage: listItemss[index]["urlImage"],
                                sigmaYXBlur: 0)),
                        Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 12.0),
                            child: Text(
                              listItemss[index]["location"],
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 12.0, fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  );
                },
              ),
            ),
            Column(
              children: [
                Text(titleSiguiente, textAlign: TextAlign.center),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
      ],
    );
  }

  /// WIDGETS COMPONENTS
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

  Widget _buttonLateral(
      {required BuildContext context,
      required IconData iconData,
      required Function onTap,
      bool rightDirection = false,
      bool leftDirection = false,
      bool isDark = false,
      double sizeIcon: 25.0}) {
    BorderRadius borderRadius = BorderRadius.only(
        bottomRight: Radius.circular(50.0), topRight: Radius.circular(50.0));
    if (rightDirection) {
      borderRadius = BorderRadius.only(
          bottomRight: Radius.circular(50.0), topRight: Radius.circular(50.0));
    }
    if (leftDirection) {
      borderRadius = BorderRadius.only(
          bottomLeft: Radius.circular(50.0), topLeft: Radius.circular(50.0));
    }
    if (leftDirection == false && rightDirection == false) {
      rightDirection = true;
      borderRadius = BorderRadius.only(
          bottomRight: Radius.circular(50.0), topRight: Radius.circular(50.0));
    }

    return Padding(
      padding: const EdgeInsets.only(top: 20.0, bottom: 50.0),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: Container(
          height: sizeIcon + 20,
          width: sizeIcon + 30,
          child: Material(
            color: isDark ? Colors.black : Colors.white,
            child: InkWell(
              child: Row(
                children: [
                  rightDirection == true
                      ? Expanded(child: Container())
                      : Container(),
                  Center(
                      child: Padding(
                          padding: EdgeInsets.only(
                              right: rightDirection ? 15.0 : 0.0,
                              left: leftDirection ? 15.0 : 0.0),
                          child: Icon(iconData,
                              color: isDark ? Colors.white : Colors.black))),
                  leftDirection == true
                      ? Expanded(child: Container())
                      : Container(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget clip(
          {double size = 24.0,
          required String text,
          IconData iconData = Icons.check_circle,
          bool iconVisibility = false,
          Color backgroundColor = Colors.blue,
          Color colorText = Colors.white,
          Color colorIcon = Colors.white}) =>
      Chip(
          backgroundColor: backgroundColor,
          shape: StadiumBorder(side: BorderSide(color: backgroundColor)),
          label: Text(text,
              style: TextStyle(fontWeight: FontWeight.bold, color: colorText)),
          avatar: iconVisibility ? Icon(iconData, color: colorIcon) : null,
          elevation: 0.0);
  Widget cardPhotoMovie(
      {required String url,
      double circleBoder = 0.0,
      double width = 150.0,
      double height = 150.0}) {
    return Card(
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(circleBoder)),
      child: InkWell(
        child: Container(
          width: width,
          height: height,
          child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 200),
              fit: BoxFit.cover,
              imageUrl: url,
              placeholder: (context, urlImage) => Container(color: Colors.grey),
              errorWidget: (context, urlImage, error) =>
                  Center(child: Container(color: Colors.grey))),
        ),
      ),
    );
  }
}
