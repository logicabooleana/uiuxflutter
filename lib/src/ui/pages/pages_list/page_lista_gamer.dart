/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'dart:ui';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:cached_network_image/cached_network_image.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:animate_do/animate_do.dart';
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';

///  DESCRIPCIÓN
//  Plataforma de  videos juegos

// var
Map<dynamic,dynamic> ciberPunk2071={"titulo":"Cyber Punk 2071","url":"https://www.derechoenzapatillas.com/wp-content/uploads/2020/12/cyberpunk-2077-1.jpg"};
Map<dynamic,dynamic> ciberPunk2071rect={"titulo":"Cyber Punk 2071","url":"https://www.alfabetajuega.com/wp-content/uploads/2020/09/cyberpunk-2077-1.jpg"};
Map<dynamic,dynamic> gta5={"titulo":"Grand Theft Auto V","url":"https://www.muycomputer.com/wp-content/uploads/2015/05/GTA-V-y-mods.jpg"};
Map<dynamic,dynamic> nfspayback={"titulo":"Need for Speed payback","url":"https://i.ytimg.com/vi/kc-OcOduEx0/maxresdefault.jpg"};
Map<dynamic,dynamic> farCry6={"titulo":"Far Cry 6","url":"https://cdn2.tecnogaming.com/wp-content/uploads/2020/07/Far-Cry-6-Key-Art.jpg"};
Map<dynamic,dynamic> farCry6Rect={"titulo":"Far Cry 6","url":"https://d26lpennugtm8s.cloudfront.net/stores/082/436/products/far-cry-61-b1d709b61b3f8b286b15946474236636-640-0.png"};
Map<dynamic,dynamic> hitman3={"titulo":"HITMAN 3","url":"https://www.tuplaystation.es/wp-content/uploads/2020/09/HITMAN3_Article_Tile-1.jpg"};
Map<dynamic,dynamic> rocketLeague={"titulo":"Rocket League","url":"https://i.blogs.es/08015f/rocket-league/1366_2000.jpeg"};
Map<dynamic,dynamic> ageOfEmpires3={"titulo":"Age of empires 3","url":"https://i.ytimg.com/vi/NXlfGcvH8Qw/maxresdefault.jpg"};
Map<dynamic,dynamic> amongUs={"titulo":"Among Us","url":"https://www.sol915.com.ar/wp-content/uploads/2020/09/among-us.jpg"};
Map<dynamic,dynamic> amongUsRect={"titulo":"Among Us","url":"https://www.alfabetajuega.com/wp-content/uploads/2020/09/among-us-4.jpg"};
Map<dynamic,dynamic> dirt5={"titulo":"DIRT 5","url":"https://generacionxbox.com/wp-content/uploads/2020/05/dirt-5-generacionxbox.jpg"};
Map<dynamic,dynamic> redDeadOnline={"titulo":"Red Dead online","url":"https://cloudfront-us-east-1.images.arcpublishing.com/infobae/E2MHKPEIWVEXFFHERFTNS53V3U.jpg"};
Map<dynamic,dynamic> residentEvil6={"titulo":"Resident Evil 6","url":"https://www.comunidadxbox.com/wp-content/uploads/resident-evil-6-cover.jpg"};
Map<dynamic,dynamic> daysGone={"titulo":"Days Gone","url":"https://cdn.wallpapersafari.com/48/88/gJ3InD.jpg"};

class PagelistaGamer extends StatefulWidget {
  PagelistaGamer({Key ?key}) : super(key: key);
  @override
  PagelistaGamerState createState() => PagelistaGamerState();
}

class PagelistaGamerState extends State<PagelistaGamer> {

  // var
  late AnimationController animationController;
  MaterialColor colorCategory=Colors.blue;
  String idCategory="";
  String sTitulo="Bienvenidos";
  String urlImagenPortada="https://fotografias-neox.atresmedia.com/clipping/cmsimages02/2017/05/05/8FA953A2-B614-4FD8-908F-F248F63DEDE2/58.jpg";

  Map dataJuegosPopulares={"titulo":"Populares","lista":[farCry6Rect,ciberPunk2071rect,amongUsRect]};
  Map dataJuegosNuevos={"titulo":"Nuevos","lista":[daysGone,ciberPunk2071,farCry6]};
  Map dataCategoriaAccion={"titulo":"Acción","lista":[farCry6,ciberPunk2071,gta5]};
  Map dataCategoriaCarrera={"titulo":"Carrera","lista":[rocketLeague,nfspayback,dirt5]};
  Map dataCategoriaEstrategia={"titulo":"Estrategia","lista":[ageOfEmpires3,amongUs,ciberPunk2071]};
  Map dataCategoriaAventura={"titulo":"Aventura","lista":[farCry6,redDeadOnline,gta5]};
  Map dataCategoriaTerror={"titulo":"Terror","lista":[redDeadOnline,residentEvil6,daysGone]};
  Map dataCategoriaMultijugador={"titulo":"MultiJugador","lista":[amongUs,redDeadOnline,rocketLeague]};

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    
    // var
    Color colorDegradado = Theme.of(context).brightness==Brightness.dark?colorCategory:Theme.of(context).canvasColor;
    Color color1  =Theme.of(context).brightness==Brightness.dark?Color.fromRGBO(38, 42, 76, 1):Theme.of(context).canvasColor;

    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [colorDegradado,color1,color1])),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: appBar(),
        body:body(),
      ),
    );
  }
  /// WIDGETS VIEWS
  AppBar appBar(){

    // val
    bool isDark = Theme.of(context).brightness==Brightness.dark?true:false;
    Color colorText1Dark = Colors.white;Color colorText2Dark = colorCategory;
    Color colorText1light = Colors.black;Color colorText2light = Colors.orange;
    
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: Container(),leadingWidth: 0,
      title: Row(children: [Text("GAME",style: GoogleFonts.poppins(fontSize:30.0,fontWeight:FontWeight.bold,color: isDark?colorText1Dark:colorText1light)),Text("CORES",style: GoogleFonts.poppins(fontSize:30.0,fontWeight:FontWeight.bold,color: isDark?colorText2Dark:colorText2light)),]),
      actions: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(child: WidgetsUtilsApp().buttonThemeBrightness(context: context)),
        ),
      ],
      bottom: PreferredSize(
      child: Container(color: Colors.black12,height: 1.0,),preferredSize: Size.fromHeight(4.0)),
    );
  }  
  Widget body() {
  // Una astilla que coloca múltiples hijos de caja en una matriz lineal a lo largo del eje principal
  // Creamos una lista con items de ajustes con diferentes valores
    List list = [
      coverPage(),
      horizontalCategoryButton(),
      JelloIn(  // Animated
        controller: ( controller ) => animationController = controller,// (opcional, pero obligatorio si usa manualTrigger: true) Esta devolución de llamada expone el AnimationController usado para la animación seleccionada. Luego, puede llamar a animationController.forward () para activar la animación donde quiera manualmente. */
        child: listHorizontalCards(titulo:idCategory==""?"Populares 2020":getListGamesForCategoty(id: idCategory)["titulo"],list:idCategory==""?dataJuegosPopulares["lista"]:getListGamesForCategoty(id: idCategory)["lista"]),
      ),
      listHorizontalCardsGrande(titulo:"Nuevos de este mes",list: dataJuegosNuevos["lista"]),
      listHorizontalCards(titulo:"Favoritos",list: dataJuegosNuevos["lista"]),
    ];
    return ListView.builder(itemCount: 1,
      itemBuilder: (context, index) {
        return Column(
          children: List.generate(list.length, (index) => list[index]),
        );
      },
    );
  }
  /// WIDGETS COMPONENTS
  Widget coverPage(){
    // Dibuja una portada horizontal con un texto superpuesto
    return Container(
      width: double.infinity,height: 150.0,
      child: Stack(
        fit:StackFit.expand,
        children: [
          CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl: urlImagenPortada,placeholder: (context, urlImage) => Center(child: Container(color: Colors.grey[900])),errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey[900]))),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(child: Container()),
              Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 0.0),child: Text(sTitulo,textAlign: TextAlign.start,style: TextStyle(fontSize:50.0,fontWeight:FontWeight.bold,color: Colors.white))),
            ],
          )],
        ),
      );
  }
  Widget listHorizontalCards({required String titulo,required List list}){
    // Dibuja una tarje
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(padding: const EdgeInsets.only(bottom: 12.0,top:25.0,left: 12.0,right: 20.0),child:Text(titulo,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold))),
        Container(width:double.infinity,height: 200.0,child:ListView.builder(scrollDirection:Axis.horizontal,itemCount:list.length,itemBuilder: (context, index) => card(juego:list[index])),),
      ],
    );
  }
  Widget listHorizontalCardsGrande({ required String titulo, required List list}){
    // Dibuja una tarjeta grande horizontal
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(padding: const EdgeInsets.only(bottom: 12.0,top:25.0,left: 12.0,right: 20.0), child:Text(titulo,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold)) ),
        Container( width:double.infinity,height: 240.0,child:ListView.builder(scrollDirection:Axis.horizontal,itemCount:list.length,itemBuilder: (context, index) => bigCard(url:list[index]["url"])) ),
      ],
    );
  }
  Widget horizontalCategoryButton() {
    // Dibuja una lista horizontal de botones (Categorías)
    return Container(
      margin:EdgeInsets.only(top: 30.0),
      height: 95.0,
      width: double.infinity,
      child: ListView(
        shrinkWrap:true,
        scrollDirection:Axis.horizontal,
        children: [
          buttonCircle(icon: Icons.videogame_asset,dataCategoria:dataCategoriaAccion,color: Colors.blue),
          buttonCircle(icon: Icons.local_car_wash,dataCategoria: dataCategoriaCarrera,color: Colors.teal),
          buttonCircle(icon: Icons.view_module,dataCategoria: dataCategoriaEstrategia,color: Colors.purple),
          buttonCircle(icon: Icons.terrain,dataCategoria: dataCategoriaAventura,color: Colors.lightGreen),
          buttonCircle(icon: Icons.transfer_within_a_station,dataCategoria: dataCategoriaTerror,color: Colors.indigo),
          buttonCircle(icon: Icons.people,dataCategoria: dataCategoriaMultijugador,color: Colors.red),
        ],
      ),
    );
  }
  /// WIDGETS
  Widget buttonCircle({required Map dataCategoria,required IconData icon,MaterialColor color=Colors.grey}){
    // Logina  para entender si el boton fue seleccionado
    bool selected=false;
    if( idCategory==dataCategoria["titulo"]){selected=true;}

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Container(width: 60.0,height: 60.0, child: RawMaterialButton(splashColor:color,onPressed: () {setState(() {colorCategory=color;sTitulo=dataCategoria["titulo"];idCategory=dataCategoria["titulo"];urlImagenPortada=dataCategoria["lista"][1]["url"];});animationController.repeat();},elevation: 2.0,fillColor: selected?color:Colors.white,child: Icon(icon,size: 30.0,color: selected?Colors.white:color[400],),padding: EdgeInsets.all(15.0),shape: CircleBorder())),
          Container(padding: const EdgeInsets.symmetric(vertical: 8.0),child: Container(width: 70.0,child: Text(dataCategoria["titulo"], maxLines:2,overflow:TextOverflow.ellipsis,textAlign:TextAlign.center,style: TextStyle(fontSize: 10.0)))),
        ],
      ),
    );
  }
  Widget card({ dynamic juego}){
    // Creamos una tarjeta rectangular pequeña
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child:Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0),),
        child:InkWell(
          onTap:(){},
          child: Stack(
            children: [
              Container(
                width: 150.0,height: 200.0,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl:juego["url"],placeholder: (context, urlImage) => Container(color: Colors.grey),errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey))),
              ),
              Column(
                children: [
                  Expanded(child: Container()),
                  Container(width: 150.0,color: Colors.black54,child: Padding(padding:EdgeInsets.all(12.0),child: Center(child: Text(juego["titulo"],style: TextStyle(color: Colors.white70),)),)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget bigCard({required String url}){
    // Creamos una tarjeta rectangular grande
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child:Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
        child:InkWell(
          onTap:(){},
          child: Container(width: 350.0,height: 300.0,decoration: BoxDecoration(shape: BoxShape.circle),child: CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl:url,placeholder: (context, urlImage) => Container(color: Colors.grey),errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey)))),
        ),
      ),
    );
  }
  /// GET
  dynamic getListGamesForCategoty({ required String id}){
    // Recibe el id de la categoria seleccionada y devuelve los datos de la categoria
    switch (id){
      case "Acción":return dataCategoriaAccion;
      case "Carrera":return dataCategoriaCarrera;
      case "Estrategia":return dataCategoriaEstrategia;
      case "Aventura":return dataCategoriaAventura;
      case "Terror":return dataCategoriaTerror;
      case "MultiJugador":return dataCategoriaMultijugador;
    }
  }
}
