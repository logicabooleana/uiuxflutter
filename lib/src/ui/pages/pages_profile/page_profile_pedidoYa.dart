// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../utils/widgets/widgets_utils_app.dart';

class PageProfilePedidoYa extends StatelessWidget {
  const PageProfilePedidoYa({Key? key}) : super(key: key);

  Widget buttonRoundAppBar(
          {required BuildContext context,
          required IconData icon,
          required EdgeInsets edgeInsets}) =>
      Material(
          color: Colors.transparent,
          child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Ink(
                    decoration: ShapeDecoration(
                        color: Brightness.dark == Theme.of(context).brightness
                            ? Colors.black
                            : Colors.white,
                        shape: CircleBorder()),
                    child: IconButton(
                        icon: Icon(icon),
                        color: Brightness.dark == Theme.of(context).brightness
                            ? Colors.white
                            : Colors.black,
                        onPressed: () {}),
                  ))));
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).brightness == Brightness.light
            ? Color.fromARGB(255, 250, 248, 248)
            : Theme.of(context).scaffoldBackgroundColor,
        body: body(context: context));
  }

  /// WIDGETS VIEWS
  Widget body({required BuildContext context}) {
    return CustomScrollView(
      slivers: <Widget>[
        sliverAppBar(context: context),
        sliverFillRemaining(context: context),
      ],
    );
  }

  Widget sliverAppBar({required BuildContext context}) {
    Color colorAppBar = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Theme.of(context).scaffoldBackgroundColor;
    final screenSize = MediaQuery.of(context).size;
    // Una barra de aplicaciones de diseño de materiales que se integra con CustomScrollView */
    return SliverAppBar(
      brightness: Brightness.dark,
      primary:
          true, // Si esta barra de aplicaciones se muestra en la parte superior de la pantalla */
      pinned:
          true, // Si la barra de la aplicación debe permanecer visible al comienzo de la vista de desplazamiento */
      expandedHeight: screenSize.height *
          0.40, // El tamaño de la barra de aplicaciones cuando está completamente expandido */
      title: SABT(
          child: Text("Mostaza Liniers",
              style: TextStyle(
                  color: Colors
                      .white))), // solución SABT() : Envuelvo el titlewidget normal con otro widget que solo muestra el título si detecta una barra de aplicación contraída y, de lo contrario, oculta el título. */
      iconTheme: IconThemeData(color: Colors.white),
      backgroundColor: colorAppBar,
      leading: buttonRoundAppBar(
          context: context,
          icon: Icons.arrow_back,
          edgeInsets: EdgeInsets.all(8.0)),
      actions: [
        WidgetsUtilsApp().buttonThemeBrightness(context: context),
        buttonRoundAppBar(
            context: context,
            icon: Icons.share,
            edgeInsets: EdgeInsets.only(right: 2.0, top: 8.0, bottom: 8.0)),
        buttonRoundAppBar(
            context: context,
            icon: Icons.new_releases,
            edgeInsets: EdgeInsets.only(right: 2.0, top: 8.0, bottom: 8.0)),
      ],
      flexibleSpace: flexibleSpaceBar(context: context),
    );
  }

  /// WIDGETS COMPONENT
  Widget flexibleSpaceBar({required BuildContext context}) {
    const String url_image =
        "https://vivo247.com/wp-content/uploads/2020/03/mostaza.jpg";
    Color colorFondo = Theme.of(context).scaffoldBackgroundColor;

    return FlexibleSpaceBar(
      collapseMode: CollapseMode.pin,
      background: Stack(
        // Un widget que coloca a sus hijos en relación con los bordes de su caja. */
        fit: StackFit
            .expand, // dimensionar los niños no posicionados en la pila. */
        children: [
          CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 200),
              fit: BoxFit.cover,
              imageUrl: url_image,
              placeholder: (context, urlImage) =>
                  Center(child: Container(color: Colors.grey)),
              errorWidget: (context, urlImage, error) =>
                  Center(child: Container(color: Colors.grey))),
          Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomLeft,
                      colors: [
                Colors.transparent,
                Theme.of(context).brightness == Brightness.dark
                    ? colorFondo.withOpacity(0.5)
                    : Colors.blueGrey[600]!.withOpacity(0.5),
                Theme.of(context).brightness == Brightness.dark
                    ? colorFondo.withOpacity(0.90)
                    : Colors.blueGrey[700]!.withOpacity(0.90),
                Theme.of(context).brightness == Brightness.dark
                    ? colorFondo
                    : Colors.blueGrey[900]!
              ]))),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Container()),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      clip(
                          text: "Delivy",
                          backgroundColor: Colors.red[200]!,
                          colorIcon: Colors.red,
                          colorText: Colors.red,
                          iconData: Icons.check,
                          iconVisibility: true),
                      Text("Mostaza Liniers",
                          style: TextStyle(
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white)),
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(0.0),
                  child: ElevatedButton.icon(
                      style: ButtonStyle(
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
                          padding:MaterialStateProperty.all(EdgeInsets.all(5.0)),
                          elevation: MaterialStateProperty.all(0.0),
                          backgroundColor: MaterialStateProperty.all(Colors.white)),
                      icon: Icon(Icons.search, color: Colors.grey[400]),
                      label: Text("Busca producto por nombre",
                          style: TextStyle(
                              color: Colors.grey[400],
                              fontFamily: 'Raleway',
                              fontStyle: FontStyle.normal)),
                      onPressed: () {}),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget sliverFillRemaining({required BuildContext context}) {
    // Una astilla que coloca varios elementos secundarios de caja en una matriz lineal a lo largo del eje principal. */
    return SliverList(
      // Un delegado que proporciona a los niños astillas utilizando una lista explícita. */
      delegate: SliverChildListDelegate(
        [
          FadeInLeft(
              child: widgetContentOpiniones(context: context),
              delay: const Duration(milliseconds: 0)),
          FadeInLeft(
              child: widgetContentPlatosRecomendados(context: context),
              delay: const Duration(milliseconds: 500)),
          FadeInLeft(
              child: listProductBusiness(context: context),
              delay: const Duration(milliseconds: 1000)),
        ],
      ),
    );
  }

  /// WIDGETS VISTAS
  Widget widgetContentOpiniones({required BuildContext context}) {
    // Widgets
    Widget point(
            {required String puntaje,
            required String text,
            Color color = Colors.green}) =>
        Column(children: [
          Row(children: [
            Icon(Icons.star, size: 14, color: color),
            Text(puntaje,
                style: TextStyle(
                    fontSize: 16, fontWeight: FontWeight.bold, color: color))
          ]),
          Text(text,
              style: TextStyle(
                  fontSize: 10, fontWeight: FontWeight.normal, color: color))
        ]);
    // Este widget contiene informacion de la tienda (calificaciones y opiones)
    return Container(
      color: Theme.of(context).brightness == Brightness.light
          ? Colors.white
          : Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              point(text: "VELOCIDAD", puntaje: "4.8"),
              point(text: "COMIDA", puntaje: "4.5"),
              point(text: "SERVICIO", puntaje: "4.5"),
              clip(
                  text: "232 opiniones",
                  iconVisibility: true,
                  iconData: Icons.arrow_right,
                  backgroundColor:
                      Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.grey[200]!,
                  colorText: Colors.grey[600]!,
                  colorIcon: Colors.grey[600]!),
            ]),
      ),
    );
  }

  Widget widgetContentPlatosRecomendados({required BuildContext context}) {
    // Este widget contiene una lista de componentes
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            children: [
              Text("Platos recomendados",
                  style: TextStyle(
                      fontSize: 16.0,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white
                          : Colors.black,
                      fontWeight: FontWeight.bold)),
              SizedBox(width: 8.0),
              clip(
                  text: "FOTOS REALES",
                  iconVisibility: true,
                  iconData: Icons.check_circle,
                  backgroundColor: Colors.grey[200]!,
                  colorText: Colors.grey[600]!,
                  colorIcon: Colors.grey[600]!)
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 310.0,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: [
              cardProduct(
                  title: "Mega Cuarto + Papas Regulares",
                  description:
                      "Doble y Mega Medallón de carne con queso cheddar doble, cebollita y salsa ketchup",
                  price: "\$590",
                  bestSeller: true,
                  urlImage:
                      "https://www.mostaza.com.py/uploads/menues/MENU_0000s_0009_extreme%20bacon(1).jpg"),
              cardProduct(
                  title: "Mega Doble Cuarto + Papas Regulares",
                  price: "\$590",
                  urlImage:
                      "https://images.rappi.com.ar/products/1562839-1600271699287.jpg"),
              cardProduct(
                  title: "Mega Boom Bacon & Cheddar + Papas Regulares",
                  price: "\$590",
                  urlImage:
                      "https://cdn.needish.com/is-prod-deals/vGxHOkpmzX61JFg03biqyw/scale/900x600.jpg"),
            ],
          ),
        ),
      ],
    );
  }

  Widget listProductBusiness({required BuildContext context}) {
    // Este widget contiene una lista de componentes
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Text("Mega Cuarto Week desde 259 - Hasta 40% OFF",
              style: TextStyle(
                  fontSize: 18.0,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white
                      : Colors.black,
                  fontWeight: FontWeight.bold)),
        ),
        Container(
          width: double.infinity,
          height: 90.0,
          child: CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 200),
              fit: BoxFit.cover,
              imageUrl:
                  "https://vivo247.com/wp-content/uploads/2020/03/mostaza.jpg",
              placeholder: (context, urlImage) => Container(color: Colors.grey),
              errorWidget: (context, urlImage, error) =>
                  Center(child: Container(color: Colors.grey))),
        ),
        cardProduct_vertical(
          titulo: "Mega Cuerto",
          descripcion:
              "Mega Medallón de carne con queso cheddar, cebollita y ketchup",
          precio: "\$259",
          masVendido: true,
          urlIamgen:
              "https://www.mostazaweb.com.ar/wp-content/uploads/2020/08/Mega-Cuarto-Doble-3.jpg",
        ),
        cardProduct_vertical(
            titulo: "Mega Cuerto + Papas Regulares",
            descripcion:
                "Mega Medallón de carne con queso cheddar, cebollita y ketchup acompañado de una procion de papas",
            precio: "\$369",
            masVendido: false,
            urlIamgen:
                "https://images.rappi.com.ar/products/1562839-1600271699287.jpg"),
        cardProduct_vertical(
            titulo: "Mega Cuerto Doble",
            descripcion:
                "Doble y Mega Medallón de carne con queso cheddar doble, cebollita y salsa ketchup",
            precio: "\$379",
            masVendido: false,
            urlIamgen:
                "https://www.mostaza.com.py/uploads/menues/MENU_0000s_0009_extreme%20bacon(1).jpg"),
        cardProduct_vertical(
          titulo: "Mega Cuerto",
          descripcion:
              "Mega Medallón de carne con queso cheddar, cebollita y ketchup",
          precio: "\$259",
          masVendido: true,
          urlIamgen:
              "https://www.mostazaweb.com.ar/wp-content/uploads/2020/08/Mega-Cuarto-Doble-3.jpg",
        ),
        cardProduct_vertical(
            titulo: "Mega Cuerto + Papas Regulares",
            descripcion:
                "Mega Medallón de carne con queso cheddar, cebollita y ketchup acompañado de una procion de papas",
            precio: "\$369",
            masVendido: false,
            urlIamgen:
                "https://images.rappi.com.ar/products/1562839-1600271699287.jpg"),
        cardProduct_vertical(
            titulo: "Mega Cuerto Doble",
            descripcion:
                "Doble y Mega Medallón de carne con queso cheddar doble, cebollita y salsa ketchup",
            precio: "\$379",
            masVendido: false,
            urlIamgen:
                "https://www.mostaza.com.py/uploads/menues/MENU_0000s_0009_extreme%20bacon(1).jpg"),
      ],
    );
  }

  /// WIDGETS
  Widget cardProduct(
      {required String urlImage,
      required String title,
      String description = "",
      required String price,
      bool bestSeller = false}) {
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
                Stack(
                  children: [
                    Container(
                        width: 200.0,
                        height: 175.0,
                        child: CachedNetworkImage(
                            fadeInDuration: Duration(milliseconds: 200),
                            fit: BoxFit.cover,
                            imageUrl: urlImage,
                            placeholder: (context, urlImage) =>
                                Container(color: Colors.grey),
                            errorWidget: (context, urlImage, error) =>
                                Center(child: Container(color: Colors.grey)))),
                    bestSeller
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.stars, color: Colors.orange[400]))
                        : Container(),
                  ],
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        title != ""
                            ? Text(title,
                                style: TextStyle(
                                    fontSize: 15.0,
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal),
                                maxLines: 2)
                            : Container(),
                        description != ""
                            ? Text(description,
                                style: TextStyle(
                                    fontSize: 12.0,
                                    color: Colors.grey[600],
                                    fontWeight: FontWeight.normal),
                                maxLines: 2)
                            : Container(),
                        price != ""
                            ? Text(price,
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

  Widget cardProduct_vertical(
      {bool masVendido = false,
      required String urlIamgen,
      required String titulo,
      String descripcion = "",
      String precio = ""}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0, top: 8.0, left: 8.0),
      child: Card(
        elevation: 5.0,
        clipBehavior: Clip.antiAlias,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        child: InkWell(
          onTap: () {},
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.all(12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          masVendido
                              ? Chip(
                                  avatar: Icon(
                                    Icons.stars,
                                    color: Colors.blue,
                                    size: 18.0,
                                  ),
                                  label: Text("Más vendido",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontWeight: FontWeight.normal,
                                          fontSize: 10.0)),
                                  backgroundColor: Colors.blue[200])
                              : Container(),
                          Text(titulo,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: 8.0),
                          descripcion != ""
                              ? Text(descripcion,
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontWeight: FontWeight.normal))
                              : Container(),
                          SizedBox(height: 8.0),
                          precio != ""
                              ? Text(precio,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold))
                              : Container(),
                        ],
                      ),
                    ),
                    urlIamgen != ""
                        ? Container(
                            margin: EdgeInsets.only(left: 5.0),
                            width: 80.0,
                            height: 80.0,
                            child: CachedNetworkImage(
                                fadeInDuration: Duration(milliseconds: 200),
                                fit: BoxFit.cover,
                                imageUrl: urlIamgen,
                                placeholder: (context, urlImage) =>
                                    Container(color: Colors.grey),
                                errorWidget: (context, urlImage, error) =>
                                    Center(
                                        child: Container(color: Colors.grey))),
                          )
                        : Container(),
                  ],
                ),
              ),
              Divider(
                thickness: 1.0,
                color: Colors.grey[100],
                height: 0.0,
                endIndent: 12.0,
                indent: 12.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardSugerencias(
      {required String url, String titulo = "", String precio = ""}) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Column(
        children: [
          Card(
            elevation: 0.0,
            clipBehavior: Clip.antiAlias,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            child: InkWell(
              child: Container(
                width: 200.0,
                height: 200.0,
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
          Container(
            width: 200.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                titulo != ""
                    ? Text(titulo,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.grey,
                            fontWeight: FontWeight.normal))
                    : Container(),
                precio != ""
                    ? Text(precio,
                        style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal))
                    : Container(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

///  CLASS
class SABT extends StatefulWidget {
  final Widget child;
  const SABT({
    Key? key,
    required this.child,
  }) : super(key: key);
  @override
  _SABTState createState() {
    return new _SABTState();
  }
}

class _SABTState extends State<SABT> {
  late ScrollPosition _position;
  bool _visible = false;
  @override
  void dispose() {
    _removeListener();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _removeListener();
    _addListener();
  }

  void _addListener() {
    _position = Scrollable.of(context)!.position;
    _position.addListener(_positionListener);
    _positionListener();
  }

  void _removeListener() {
    _position.removeListener(_positionListener);
  }

  void _positionListener() {
    final FlexibleSpaceBarSettings settings =
        context.dependOnInheritedWidgetOfExactType<FlexibleSpaceBarSettings>()!;
    bool visible = settings.currentExtent <= settings.minExtent;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: _visible,
      child: widget.child,
    );
  }
}
