/// Copyright 2020 Logica Booleana Authors */

// Dependencias
import 'package:desingapp/src/utils/widgets/widget_circle_border.dart';
import 'package:desingapp/src/values/arrays.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias */
import 'package:font_awesome_flutter/font_awesome_flutter.dart'; 

/// DESCRIPCIÓN
// Clon ui Perfil  de la red social instagram

class PageProfileInstagram extends StatefulWidget {

  // Definimos los coloes principales 
  static List<Color> colorGradientInstagram = [
    Color.fromRGBO(129, 52, 175, 1.0),
    Color.fromRGBO(129, 52, 175, 1.0),
    Color.fromRGBO(221, 42, 123, 1.0),
    Color.fromRGBO(254, 218, 119, 1.0)
  ];
  

  @override
  _PageProfileInstagramState createState() => _PageProfileInstagramState();
}

class _PageProfileInstagramState extends State<PageProfileInstagram>  with SingleTickerProviderStateMixin {

  // var
  late TabController controller;
  late ScrollController scrollController;
  double get randHeight => math.Random().nextInt(100).toDouble();

  @override
  void dispose() {
    super.dispose();
    controller.dispose();
    scrollController.dispose();
  }

  @override
  void initState() {
    controller = new TabController(length: 2, vsync: this);
    scrollController =  new ScrollController(initialScrollOffset: 0.0, keepScrollOffset: false);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      appBar: appbar(),
      body: body(),
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }
  PreferredSizeWidget appbar(){
    // AppBar persistente que nunca se desplaza 
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      automaticallyImplyLeading: false,
      title: Text('ivan__code',style: TextStyle(fontWeight:FontWeight.bold,fontSize: 24.0),),
      actions: <Widget>[
        IconButton(icon: Icon(FontAwesomeIcons.bars), onPressed: (){})
      ],
    );
  }
  Widget body(){
    return DefaultTabController(
          length: 2,
          child: NestedScrollView(
            // le permite crear una lista de elementos que se desplazarían hasta que el cuerpo alcanzara la parte superior */
            headerSliverBuilder: (context, _) {
              return [SliverList(delegate: SliverChildListDelegate([ContentProfileUser(context: context)]))];
            },
            // La vista de pestaña va aqui */
            body: Column(
              children: <Widget>[
                Divider(height: 0.0,),
                TabBar(
                  tabs: [
                    Tab( icon: FaIcon(FontAwesomeIcons.borderAll,size: 24.0) ),
                    Tab(icon: FaIcon(FontAwesomeIcons.idBadge,size: 24.0)),
                  ],
                ),
                Divider(height: 0.0,),
                Expanded(
                  child: TabBarView(
                    children: [
                      _gridList(),
                      _gridList(cantidadFotos: 4),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
  }
  /// WIDGETS
  Widget bottomNavigationBar( BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor:Theme.of(context).canvasColor),
      child: BottomNavigationBar(
        elevation: 10.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.home, size: 24.0),label:""),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.search, size: 24.0),label:""),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.plusSquare, size: 24.0),label:""),
          BottomNavigationBarItem(icon: FaIcon(FontAwesomeIcons.heart, size: 24.0),label:""),
          //BottomNavigationBarItem(icon: CircleAvatar( radius: 12.0,backgroundImage: NetworkImage( valuesApp.listaPersonas[0]["url_foto_perfil"] )) ,title:Text("Más", style: TextStyle(fontWeight: FontWeight.bold))),
        ],
        currentIndex: 0, 
        selectedItemColor: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,
        unselectedItemColor:Theme.of(context).brightness==Brightness.dark?Colors.white60:Colors.black54,
      ),
    );
  }
  GridView _gridList({int cantidadFotos = 0 }) {
    /// Generamos una GridList de imagenes */
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate( cantidadFotos==0? listFotos.length:cantidadFotos , (index) {
        return Padding(
          child: Container(color: Colors.black12,child: Image.network( listFotos[index] , fit: BoxFit.cover),),
          padding: EdgeInsets.all(2.0),
        );
      }),
    );
  }
}
// Contenido del perfil del usuario
class ContentProfileUser extends StatelessWidget {
  ContentProfileUser({ required this.context});
  BuildContext context;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          fotoPerfilContadores(context: context),
          SizedBox(height: 12.0),
          descripcion(),
          SizedBox( height: 12.0 ),
          SizedBox(
            width: double.infinity,
            child: FlatButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),side: BorderSide(color: Colors.grey)),
              padding: EdgeInsets.all(8.0),
              onPressed: () {},
              child: Text("Editar perfil",style: TextStyle(fontSize: 14.0,fontWeight:FontWeight.bold/* ,color:Theme.of(context).textTheme.bodyText1.color */)),
            ),
          ),
          SizedBox( height: 12.0),
        ],
      ),
    );
  }
  // Creamos las vista de los contadores 
  Widget fotoPerfilContadores({required  BuildContext context}) {
    return Container(
      child: Row(
        children: <Widget>[
          DashedCircle(
            gradientColor: PageProfileInstagram.colorGradientInstagram,
            dashes: 1,
            child: Padding(
              padding: EdgeInsets.all(3.0),
              child: CircleAvatar(
                backgroundColor: Theme.of(context).canvasColor,
                radius: 41.0,
                backgroundImage: NetworkImage(listaPersonas[0]["url_foto_perfil"]),
              ),
            ),
          ),
          Expanded(child: _contadoroes()),
        ],
      ),
    );
  }
  /// WIDGETS
  Widget _contadoroes() {
  // Devuelve una vista con los contadores publiccaciones : seguidores : seguidos 
    const double sizeWidth=70;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: sizeWidth,
          child: Column(children: <Widget>[
            Text("${ listFotos.length }",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            Text("Publicaciones",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
          ]),
          ),
          SizedBox(width: 5.0),
          Container(
            width: sizeWidth,
          child: Column(children: <Widget>[
            Text("2.456",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            Text("Seguidores",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
          ]),
          ),
          SizedBox(width: 5.0),
          Container(
            width: sizeWidth,
          child: Column( children: <Widget>[
            Text("1526",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold), textAlign: TextAlign.center,),
            Text("Seguidos",overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 12.0), textAlign: TextAlign.center,),
          ]),
          ),
        ],
      ),
    );
  }
  Widget descripcion() {
  // Crea una vista de la descripción del perfil
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text( "Lucas Iván Cabrera", style: new TextStyle(  fontWeight: FontWeight.w600, fontSize: 16.0 )),
          Text( "Desarrollador android 💻 \n Fotografia 🤩 \nVivo en Argetina🇦🇷",style: new TextStyle(), ),
          Text( "www.mipagina.com", style: new TextStyle( color: Colors.blue, decoration: TextDecoration.underline))
        ],
      ),
    );
  }
}
// Una astilla cuyo tamaño varía cuando la astilla se desplaza hacia el borde de la ventana opuesta a la Dirección de crecimiento de la astilla . */
class SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return new Container(child: _tabBar);
  }
  @override
  bool shouldRebuild(SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
