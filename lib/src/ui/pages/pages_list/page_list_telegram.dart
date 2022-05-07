/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias

// var
const List lista_contacto = [
  "Gimena Balcarce",
  "Mario Gutierrez",
  "Iván Lopez",
  "Juana Silvera",
  "ALberto Alonso",
  "Carolina Maldonado",
  "Jimena Silensi",
  "Leonardo Lopez",
  "Maria Alonso",
  "Kiara Ditomassi",
  "Juan Baez",
  "Gimena Balcarce",
  "Mario Gutierrez",
  "Iván Lopez",
  "Juana Silvera",
  "ALberto Alonso",
  "Carolina Maldonado",
  "Jimena Silensi",
  "Leonardo Lopez",
  "Maria Alonso",
  "Kiara Ditomassi",
  "Juan Baez",
];

class PagelistTelegram extends StatefulWidget {
  const PagelistTelegram({Key? key}) : super(key: key);

  @override
  State<PagelistTelegram> createState() => _PagelistTelegramState();
}

class _PagelistTelegramState extends State<PagelistTelegram> {
  // var
  Color colorDivider = Colors.grey;
  bool _showFab = true;
  late Size size;

  @override
  Widget build(BuildContext context) {

    // get values 
    colorDivider = Theme.of(context).brightness==Brightness.dark?Colors.black26:Colors.grey.withOpacity(0.2);
    size = MediaQuery.of(context).size;
    const duration = Duration(milliseconds: 300);

    return Scaffold(
      body: NotificationListener<UserScrollNotification>(
          onNotification: (notification) {
            final ScrollDirection direction = notification.direction;
            setState(() {
              if (direction == ScrollDirection.reverse) {
                _showFab = false;
              } else if (direction == ScrollDirection.forward) {
                _showFab = true;
              }
            });
            return true;
          },
          child: CustomScrollView(
            /* CustomScrollView :Un ScrollView que crea efectos de desplazamiento personalizados usando astillas. */
            slivers: <Widget>[
              sliverAppBar(context: context, title: "Telegran"),
              widgetWelcome(context: context),
              SliverToBoxAdapter(child: Divider(thickness: 14,color: colorDivider,)),
              sliverList(lista_contacto),
            ],
          )),
      floatingActionButton: AnimatedSlide(
        duration: duration,
        offset: _showFab ? Offset.zero : Offset(0, 2),
        child: AnimatedOpacity(
          duration: duration,
          opacity: _showFab ? 1 : 0,
          child: FloatingActionButton(
            backgroundColor: Colors.blue,
            child: Icon(
              Icons.edit,
              color: Colors.white,
            ),
            onPressed: () {},
          ),
        ),
      ),
    );
  }

  // WIDGETS

  // Devuelve Una barra de aplicaciones de diseño de materiales que se integra con CustomScrollView  */
  SliverAppBar sliverAppBar(
      {required BuildContext context, required String title}) {
    return SliverAppBar(
      primary:
          true, // Si esta barra de aplicaciones se muestra en la parte superior de la pantalla */
      pinned: true,
      excludeHeaderSemantics: true,
      title: Text(
        title,
        style: TextStyle(color: Colors.white),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.search),
        )
      ],
    );
  }

  // Una astilla que coloca múltiples hijos de caja en una matriz lineal a lo largo del eje principal
  SliverList sliverList(List listNombres) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        // Para ello, se utiliza un delegado para crear elementos a medida que se desplazan por la pantalla
        (context, index) {
          if (index == 0) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
                  child: Text('Tus contactos de Telegran',
                      style: TextStyle(fontSize: 16, color: Colors.blue)),
                ),
                getItem(listNombres[index]),
              ],
            );
          }
          return getItem(listNombres[index]);
        },
        childCount: listNombres.length,
      ),
    );
  }

  // Crea un item de un usaurio de muestra
  Widget getItem(String title) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.all(12.0),
        child: ListTile(
          // ListTile : Una única fila de altura fija que generalmente contiene texto, así como un icono inicial o final
          leading: CircleAvatar(
            // CircleAvatar :  Un círculo que representa a un usuario
            radius: 24.0,
            child: Text(
              title.substring(0, 1),
              style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                  fontWeight: FontWeight.bold),
            ),
          ),
          title: Text(title, style: TextStyle(fontSize: 18.0)),
        ),
      ),
    );
  }

  Widget widgetWelcome({required BuildContext context}) {
    return SliverToBoxAdapter(
      child: Card(
        margin:EdgeInsets.all(0) ,
        child: Container(
          color: Theme.of(context).scaffoldBackgroundColor,
          width: double.infinity,
          height: 300,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Icon(
                    Icons.telegram_sharp,
                    size: 50,
                    color: Colors.blue,
                  ),
                ),
                Text.rich(
                  TextSpan(
                    text: 'Bienvenido a Telegram\n\n',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text:
                              'Envía mensajes tocando el botón del lápiz en la \n esquina inferior derecha.',
                          style: Theme.of(context).textTheme.subtitle2),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

/// CLASS COMPORNENTS
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
  late bool _visible;
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
    final FlexibleSpaceBarSettings? settings =
        context.dependOnInheritedWidgetOfExactType();
    bool visible =
        settings == null || settings.currentExtent > settings.minExtent + 10;
    if (_visible != visible) {
      setState(() {
        _visible = visible;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: Duration(milliseconds: 300),
      opacity: _visible ? 1 : 0,
      child: widget.child,
    );
  }
}
