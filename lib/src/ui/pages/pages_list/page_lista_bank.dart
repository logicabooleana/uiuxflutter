/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'dart:math';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:flutter/material.dart';

// var
List<MaterialColor> colores = [
  Colors.amber,
  Colors.blue,
  Colors.blueGrey,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.green,
  Colors.grey,
  Colors.indigo,
  Colors.red,
  Colors.lime,
  Colors.pink,
  Colors.amber,
  Colors.blue,
  Colors.blueGrey,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.green,
  Colors.grey,
  Colors.indigo,
  Colors.red,
  Colors.lime,
  Colors.pink,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.green,
  Colors.grey,
  Colors.indigo,
  Colors.red,
  Colors.lime,
  Colors.pink,
  Colors.amber,
  Colors.blue,
  Colors.blueGrey,
  Colors.brown,
  Colors.cyan,
  Colors.deepOrange,
  Colors.deepPurple,
  Colors.green,
];

class PagelistaBank extends StatelessWidget {
  const PagelistaBank({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context: context),
      body: body(context: context),
      bottomNavigationBar:
          bottomNavigationBar(context: context, colorAccent: Colors.deepPurple),
    );
  }

  /// WIDGETS VIEWS
  PreferredSizeWidget appBar({required BuildContext context}) {
    // var
    final colorAccent = Theme.of(context).textTheme.bodyText1?.color;

    return AppBar(
      iconTheme: Theme.of(context).iconTheme.copyWith(color: colorAccent),
      elevation: 0,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      title: Text(
        'Mi saldo',
        style: TextStyle(
          color: Colors.deepPurple.withOpacity(0.8),
        ),
      ),
      centerTitle: true,
      leading: Icon(Icons.search),
      actions: [
        WidgetsUtilsApp().buttonThemeBrightness(context: context),
      ],
    );
  }

  Widget body({required BuildContext context}) {
    // var
    TextStyle textStyle1 = TextStyle(
        color: Colors.deepPurple.withOpacity(0.8),
        fontSize: 24.0,
        fontWeight: FontWeight.bold);
    TextStyle textStyle2 = TextStyle(
        color: Colors.deepPurple, fontSize: 45.0, fontWeight: FontWeight.bold);

    return ListView(
      scrollDirection: Axis.vertical,
      children: [
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("\$  ", style: textStyle1),
                  Text("16.000", style: textStyle2),
                  Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: Text("90", style: textStyle1)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  iconButtonText(
                      context: context,
                      text: "Préstamos",
                      iconData: Icons.attach_money,
                      color: Colors.deepPurple),
                  SizedBox(width: 12),
                  iconButtonText(
                      context: context,
                      text: "Depositar",
                      iconData: Icons.arrow_downward,
                      color: Colors.yellow),
                  SizedBox(width: 12),
                  iconButtonText(
                      context: context,
                      text: "Inversiones",
                      iconData: Icons.repeat,
                      color: Colors.green),
                ],
              ),
            ),
          ],
        ),
        itemRegisterMovimiento(
            context: context,
            title: "Recarga Personal",
            descripcion: 'hace un instaten',
            price: -150.0,
            icon: Icons.phone_android),
        itemRegisterMovimiento(
            context: context,
            title: "Cambio de moneda",
            descripcion: 'ayer',
            price: 152.0,
            icon: Icons.compare_arrows),
        itemRegisterMovimiento(
            context: context,
            title: "Transferencia bancaria",
            descripcion: 'ayer',
            price: -500.0,
            icon: Icons.atm),
        itemRegisterMovimiento(
            context: context,
            title: "Recarga Personal",
            descripcion: 'ante ayer',
            price: -150.0,
            icon: Icons.phone_android),
        itemRegisterMovimiento(
            context: context,
            title: "Mercadopago*zoeymile",
            descripcion: 'hace una semana',
            price: -2000.0,
            icon: Icons.attach_money),
        itemRegisterMovimiento(
            context: context,
            title: "Extracción en autoservicio",
            price: -3500.0,
            icon: Icons.attach_money),
        itemRegisterMovimiento(
            context: context,
            title: "Jub rec coelsa",
            descripcion: 'hace una semana',
            price: 20587.0,
            icon: Icons.business),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextButton(onPressed: () {}, child: Text('Mostrar más')),
        )
      ],
    );
  }

  /// WIDGETS COMPONENTS
  Widget iconButtonText(
      {double size = 50,
      required BuildContext context,
      required String text,
      IconData iconData = Icons.view_headline,
      MaterialColor color = Colors.blue,
      double borderRadius = 12.0}) {
    // IconButton con texto inferior

    TextStyle textStyle = TextStyle(
        fontSize: size * 0.3,
        color: Theme.of(context).textTheme.bodyText1?.color?.withOpacity(0.6));

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
                      child: Icon(iconData, color: color, size: size * 0.7)))),
          Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(text, style: textStyle, textAlign: TextAlign.center)),
        ],
      ),
    );
  }

  Widget itemRegisterMovimiento(
      {required BuildContext context,
      IconData icon = Icons.attach_money,
      required String title,
      String descripcion = "",
      double price = 0.0}) {
    // var
    bool positive = price < 0
        ? false
        : true; // Definimos si el precio es positvo o negativo
    MaterialColor colorRamdom = colores[Random().nextInt(colores.length)];

    return Column(
      children: [
        ListTile(
          leading: Container(
              width: 40.0,
              height: 40.0,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle, color: colorRamdom[100]),
              child: Icon(icon, size: 20.0, color: colorRamdom[400])),
          title: Text(title, style: TextStyle(fontSize: 18.0)),
          dense: false,
          subtitle: descripcion != "" ? Text(descripcion) : null,
          trailing: Container(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
                child: Text((positive ? "+" : "") + price.toString(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0,
                        color: positive ? Colors.greenAccent[400] : null)),
              ),
              decoration: BoxDecoration(
                  color: positive ? Colors.greenAccent[100] : null,
                  borderRadius: BorderRadius.circular(10.0))),
        ),
        Divider(thickness: 1),
      ],
    );
  }

  Widget bottomNavigationBar(
      {required BuildContext context,
      MaterialColor colorAccent = Colors.blue}) {
    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: Theme.of(context).canvasColor),
      child: Column(mainAxisSize: MainAxisSize.min,
        children: [
          Divider(thickness: 0.1,height: 0),
          BottomNavigationBar(
            elevation: 10.0,
            showSelectedLabels: false,
            showUnselectedLabels: false,
            items: <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(Icons.home, size: 24.0), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.credit_card, size: 24.0), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.account_balance_wallet, size: 24.0), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.assessment, size: 24.0), label: ""),
              BottomNavigationBarItem(
                  icon: Icon(Icons.perm_contact_calendar, size: 24.0), label: ""),
            ],
            currentIndex: 0,
            selectedItemColor: colorAccent,
            unselectedItemColor: colorAccent[200],
          ),
        ],
      ),
    );
  }
}
