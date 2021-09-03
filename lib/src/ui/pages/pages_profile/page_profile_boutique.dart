// Copyright 2020 Logica Booleana Authors

// import
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en el apartado => Dependencias
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

// README
// Esta es una ui creada para una tienda online de ropa de moda
// FEATURES
// ui created by @logica.booleana
// theme: dark/light
// animation: false
// interactivity: true

// Data
List<String> list = [
  "https://katherinecalnan.com/wp-content/uploads/2014/12/fashion-photographer-canada-women.jpg",
  "https://i.pinimg.com/originals/52/03/fa/5203fab2aa8646688077635863cda0bb.jpg",
  "https://img.freepik.com/foto-gratis/retrato-bella-modelo-sonriente-vestida-pantalones-cortos-verano-hipster-jeans-ropa_158538-3201.jpg?size=626&ext=jpg",
];

// Creamos un obj
class Product {
  // ignore: non_constant_identifier_names
  final String id, title, price, description, url_image;
  // ignore: non_constant_identifier_names
  Product(
      {required this.id,
      required this.title,
      this.description = "",
      this.price = "",
      this.url_image = ""});
  Product.jsonConvert(Map<dynamic, dynamic> map)
      : this.id = map['id'],
        this.title = map['title'],
        this.price = map['price'],
        this.description = map['description'],
        this.url_image = map['url_image'];
}

class PageProfileBoutique extends StatefulWidget {
  PageProfileBoutique({Key? key}) : super(key: key);

  @override
  _PageProfileBoutiqueState createState() => _PageProfileBoutiqueState();
}

class _PageProfileBoutiqueState extends State<PageProfileBoutique> {
  // var
  late Product product;
  Color colorIcon = Colors.white;
  Color colorIconText = Colors.black;
  Color colorText = Colors.black;
  Color colorAccent = Colors.purple;
  MaterialColor colorCanvas = Colors.grey;
  late MaterialColor colorFond;
  int positionWaist = 0, positionColor = 1;

  @override
  Widget build(BuildContext context) {
    // set
    product = Product(
        id: "35346",
        title: "berrylush",
        description: "Precio incluido",
        price: "430",
        url_image: list[(positionColor - 1)]);
    // get - values
    colorText = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    colorIcon = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;
    colorIconText = Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;

    return Scaffold(
      backgroundColor: colorCanvas[
          Theme.of(context).brightness == Brightness.dark ? 900 : 100],
      body: body(context: context),
      floatingActionButton: FloatingActionButton.extended(
          elevation: 3.0,
          backgroundColor: colorAccent,
          foregroundColor: Colors.black,
          onPressed: () {},
          icon: Icon(Icons.shopping_bag_outlined, color: Colors.white),
          label: Text('Comprar', style: TextStyle(color: Colors.white))),
    );
  }

  // WIDGETS VIEWS
  Widget body({required BuildContext context}) {
    return NestedScrollView(
      headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
        return <Widget>[
          sliverAppBar(context: context),
        ];
      },
      body: description(context: context),
    );
  }

  SliverAppBar sliverAppBar({required BuildContext context}) {
    Color colorAppBar = Theme.of(context).brightness == Brightness.light
        ? Colors.white
        : Colors.black;
    final screenSize = MediaQuery.of(context).size;

    return SliverAppBar(
      backgroundColor: colorCanvas[Theme.of(context).brightness == Brightness.dark ? 900 : 100],
      pinned: false,stretch: true,snap: false, toolbarHeight: 70.0,
      expandedHeight: screenSize.height * 0.5, // El tamaño de la barra de aplicaciones cuando está completamente expandido */
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        centerTitle: false,
        title: Text('',style: TextStyle(color: Colors.white)),
        // muestra una tarjeta redondeada con una imagen que ocupa el %40 de la pantalla en el FlexibleSpaceBar en la propiedad background
        background: Card(
            color: Colors.transparent,
            elevation: 8.0,
            clipBehavior: Clip.antiAlias,
            margin: EdgeInsets.only(bottom: 20.0),
            shape: new RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: CachedNetworkImage(
                imageUrl: product.url_image,
                fadeInDuration: Duration(milliseconds: 500),
                fit: BoxFit.cover,
                progressIndicatorBuilder: (context, url, downloadProgress) =>
                    Container(color: Colors.grey[300]),
                errorWidget: (context, url, error) =>
                    Center(child: Icon(Icons.error)))),
      ),
      leading: buttonRoundAppBar(
          onPressed: () {
            Navigator.of(context).pop();
          },
          context: context,
          icon: Icons.arrow_back,
          edgeInsets: EdgeInsets.all(8.0)),
      actions: [
        buttonRoundAppBar(
            onPressed: () {},
            context: context,
            icon: Icons.new_releases,
            child: WidgetsUtilsApp().buttonThemeBrightness(context: context),
            edgeInsets: EdgeInsets.only(right: 2.0, top: 8.0, bottom: 8.0)),
        buttonRoundAppBar(
            onPressed: () {},
            context: context,
            icon: Icons.shopping_bag_outlined,
            edgeInsets: EdgeInsets.only(right: 2.0, top: 8.0, bottom: 8.0)),
      ],
    );
  }

  Widget description({required BuildContext context}) {
    return Padding(
      padding: const EdgeInsets.only(top: 50.0),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Row(
              children: [
                Expanded(
                    child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(product.title,
                        style:
                            TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
                    Text(product.description,
                        style: TextStyle(fontWeight: FontWeight.normal)),
                  ],
                )),
                Text("\$" + product.price,style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 12),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Elegir talla",
                          style: TextStyle(fontWeight: FontWeight.normal)),
                      chekButonWaistsGroup(),
                    ],
                  ),
                ),
                chekButonColorGroup(),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Text(
                "La Remera Mujer Fila Cropped Logo Heritage es de modelaje cropped confort, en tejdo de punto de algodón. Estampada en pecho con Logo Fila Crew.",
                style: TextStyle(fontWeight: FontWeight.normal)),
          ),
        ],
      ),
    );
  }

  // WIDGETS COMPONENTS
  Widget chekButonWaistsGroup() {
    Color colorAccent = Colors.pink.shade400;
    return Row(
      children: [
        MyCheckbox(
          onChanged: (s) => setState(() => positionWaist = 0),
          checkedFillColor: colorAccent,
          value: positionWaist == 0,
          checkedIcon: Text("S", style: TextStyle(color: Colors.white)),
          uncheckedIcon: Text("S", style: TextStyle(color: Colors.white)),
        ),
        MyCheckbox(
            onChanged: (s) => setState(() => positionWaist = 1),
            checkedFillColor: colorAccent,
            value: positionWaist == 1,
            checkedIcon: Text("M", style: TextStyle(color: Colors.white)),
            uncheckedIcon: Text("M", style: TextStyle(color: Colors.white))),
        MyCheckbox(
          onChanged: (s) => setState(() => positionWaist = 2),
          checkedFillColor: colorAccent,
          value: positionWaist == 2,
          checkedIcon: Text("L", style: TextStyle(color: Colors.white)),
          uncheckedIcon: Text("L", style: TextStyle(color: Colors.white)),
        ),
        MyCheckbox(
          onChanged: (s) => setState(() => positionWaist = 3),
          checkedFillColor: colorAccent,
          value: positionWaist == 3,
          checkedIcon: Text("XL", style: TextStyle(color: Colors.white)),
          uncheckedIcon: Text("XL", style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }

  Widget chekButonColorGroup() {
    return Column(
      children: [
        Transform.scale(
            scale: positionColor == 1 ? 1.5 : 1.0,
            child: Radio(
                value: positionColor == 1 ? 1 : 0,
                groupValue: 1,
                activeColor: Colors.black,
                fillColor: MaterialStateProperty.all(Colors.black),
                onChanged: (s) => setState(() => positionColor = 1))),
        Transform.scale(
            scale: positionColor == 2 ? 1.5 : 1.0,
            child: Radio(
                value: positionColor == 2 ? 1 : 0,
                groupValue: 1,
                activeColor: Colors.purple,
                fillColor: MaterialStateProperty.all(Colors.purple),
                onChanged: (s) => setState(() => positionColor = 2))),
        Transform.scale(
            scale: positionColor == 3 ? 1.5 : 1.0,
            child: Radio(
                value: positionColor == 3 ? 1 : 0,
                groupValue: 1,
                activeColor: Colors.grey,
                fillColor: MaterialStateProperty.all(Colors.grey),
                onChanged: (s) => setState(() => positionColor = 3))),
      ],
    );
  }

  Widget button(
      {required String text,
      Color colorText = Colors.white,
      Color colorButton = Colors.purple,
      double padding = 12}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: padding, vertical: padding),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.all(20.0),
          onPrimary: Colors.white,
          primary: colorButton,
          shadowColor: colorButton,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
              side: BorderSide(color: colorButton)),
          side: BorderSide(color: colorButton),
        ),
        child: Text("Iniciar sesión".toUpperCase(),
            style: TextStyle(
                color: colorText, fontSize: 18.0, fontWeight: FontWeight.bold)),
        onPressed: () {},
      ),
    );
  }

  Widget buttonRoundAppBar(
          {required void Function() onPressed,
          required BuildContext context,
          Widget? child,
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
                      child: child == null
                          ? IconButton(
                              icon: Icon(icon),
                              color: Brightness.dark ==
                                      Theme.of(context).brightness
                                  ? Colors.white
                                  : Colors.black,
                              onPressed: onPressed)
                          : child))));
}

// Checkbox personalizado
// Le podemos pasar cualquier widget como icono
class MyCheckbox extends StatefulWidget {
  final double size;
  final bool value;
  final ValueChanged<bool> onChanged;
  final Color checkedIconColor;
  final Color checkedFillColor;
  final Widget checkedIcon;
  final Color uncheckedIconColor;
  final Color uncheckedFillColor;
  final Widget uncheckedIcon;

  const MyCheckbox({
    this.size = 50,
    required this.value,
    required this.onChanged,
    this.checkedIconColor = Colors.white,
    this.checkedFillColor = Colors.green,
    required this.checkedIcon,
    this.uncheckedIconColor = Colors.white,
    this.uncheckedFillColor = Colors.grey,
    required this.uncheckedIcon,
  });

  @override
  _MyCheckboxState createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  late bool _checked;
  late CheckStatus _status;

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void didUpdateWidget(MyCheckbox oldWidget) {
    super.didUpdateWidget(oldWidget);
    _init();
  }

  void _init() {
    _checked = widget.value;

    if (_checked) {
      _status = CheckStatus.checked;
    } else {
      _status = CheckStatus.unchecked;
    }
  }

  Widget _buildIcon() {
    late Widget child;

    switch (_status) {
      case CheckStatus.empty:
        break;
      case CheckStatus.checked:
        child = widget.checkedIcon;
        break;
      case CheckStatus.unchecked:
        child = widget.uncheckedIcon;
        break;
    }

    return Container(
      width: widget.size,
      height: widget.size,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(2)),
        color:
            widget.value ? widget.checkedFillColor : widget.uncheckedFillColor,
        border: Border.all(
            color: widget.value
                ? widget.checkedFillColor
                : widget.uncheckedFillColor,
            width: 0),
      ),
      child: Center(child: child),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 12.0, bottom: 12.0, top: 12.0),
      child: IconButton(
        padding: EdgeInsets.all(0),
        icon: _buildIcon(),
        onPressed: () => widget.onChanged(_checked),
      ),
    );
  }
}

enum CheckStatus { empty, checked, unchecked }
