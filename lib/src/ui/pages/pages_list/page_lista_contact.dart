/// Copyright 2020 Logica Booleana Authors

// Dependencias 
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias


/// DESCRIPCIÓN
//  Creamos una lista  de contactos al estilo de samsung

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

class Pagelistacontact extends StatelessWidget {
  const Pagelistacontact({Key ?key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView( /* CustomScrollView :Un ScrollView que crea efectos de desplazamiento personalizados usando astillas. */
        slivers: <Widget>[
          sliverAppBar(context: context,title: "Contactos"),
          sliverList(lista_contacto),
        ],
      )
    );
  }
  // Devuelve Una barra de aplicaciones de diseño de materiales que se integra con CustomScrollView  */
  SliverAppBar sliverAppBar({required BuildContext context , required String title}) {
    return SliverAppBar(
      primary: true, // Si esta barra de aplicaciones se muestra en la parte superior de la pantalla */
      pinned: true, // Si la barra de la aplicación debe permanecer visible al comienzo de la vista de desplazamiento */
      expandedHeight: 300, // El tamaño de la barra de aplicaciones cuando está completamente expandido */
      excludeHeaderSemantics: true,
      title: SABT(child: Text(title,style: TextStyle(color: Colors.white))), /* solución SABT() : Envuelvo el titlewidget normal con otro widget que solo muestra el título si detecta una barra de aplicación contraída y, de lo contrario, oculta el título. */
      // flexibleSpace :  La parte de una barra de aplicaciones de diseño de materiales que se expande, colapsa y estira */
      flexibleSpace: FlexibleSpaceBar(
        collapseMode: CollapseMode.pin,
        background: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Center(child: Text(title,style: TextStyle(fontSize: 30.0,color: Colors.white,fontWeight:FontWeight.normal)),
          ),
        ),
      ),
    );
  }
  // Una astilla que coloca múltiples hijos de caja en una matriz lineal a lo largo del eje principal
  SliverList sliverList(List listNombres) {
    return SliverList(
      delegate:SliverChildBuilderDelegate(// Para ello, se utiliza un delegado para crear elementos a medida que se desplazan por la pantalla
        (context, index) => getItem( listNombres[index] ),
        childCount: listNombres.length,
      ),
    );
  }
  // Crea un item de un usaurio de muestra
  Widget getItem(String title) {
    return InkWell(
      onTap: (){ },
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(12.0),
                child: ListTile( // ListTile : Una única fila de altura fija que generalmente contiene texto, así como un icono inicial o final
                  leading: CircleAvatar( // CircleAvatar :  Un círculo que representa a un usuario
                    radius: 24.0,
                    child: Text(title.substring(0,1),style: TextStyle(fontSize: 18.0,color: Colors.white, fontWeight: FontWeight.bold),),
                  ),
                title: Text(title,style: TextStyle( fontSize: 18.0 )),
                ),
              ),
              Divider(height: 1.0,)
            ],
          ),
      );
  }


}
/// CLASS COMPORNENTS
class SABT extends StatefulWidget {
  final Widget child;
  const SABT({
    Key ?key,
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
    final FlexibleSpaceBarSettings? settings = context.dependOnInheritedWidgetOfExactType();
    bool visible = settings == null || settings.currentExtent > settings.minExtent+10;
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
      opacity: _visible?1:0,
      child: widget.child,
    );
  }
}