/// Copyright 2020 Logica Booleana Authors 

// Dependencias 
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias */
import 'package:cached_network_image/cached_network_image.dart';

// ignore: must_be_immutable
class PageProfileGuideAr extends StatelessWidget {

  // var
  late Size screenSize;
  final estiloTitulo    = TextStyle( fontSize: 30.0, fontWeight: FontWeight.bold,color: Colors.white );
  final List listPhotosUrl =[
    "https://s1.wklcdn.com/image_36/1080019/8696283/5120587Master.jpg",
    "https://mapio.net/images-p/1172789.jpg",
    "https://i.pinimg.com/originals/1a/5e/04/1a5e04bc742a7942375989650091d9c9.jpg",
    "https://mapio.net/images-p/65452888.jpg",
  ];
  final List listPhotosUr2 =[
    "https://media-cdn.tripadvisor.com/media/photo-s/06/be/c8/78/parque-municipal-los.jpg",
    "https://mapio.net/images-p/99093562.jpg",
    "https://mapio.net/images-p/101127451.jpg",
    "https://www.vivieloeste.com.ar/wp-content/uploads/2018/04/reserva-los-robles1-e1522927107390.jpg",
  ];


  @override
  Widget build(BuildContext context) {

    // var
    screenSize = MediaQuery.of(context).size;// Toma los pixeles del ancho y alto de la pantalla */

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarColor: Colors.transparent, // transparent status bar
        statusBarIconBrightness: Theme.of(context).brightness==Brightness.dark?Brightness.light:Brightness.dark, // status bar icons' color
      ),
      child: Scaffold(
        body: body(context: context),
      ),
    );
  }

  /// WIDGETS VIEWS
  Widget body({required BuildContext context}){
    return PageView(
      controller: PageController(  initialPage: 0 ),
      pageSnapping: true, //  Deslizaiento automatico
      scrollDirection: Axis.vertical, //  Dirección de deslizamiento 
      children: <Widget>[
        pagePortada(
          context: context,
          name: "Dique roggero",
          url: "https://4.bp.blogspot.com/_3hx9PRFfaGA/Si12xIv0WwI/AAAAAAAAAR4/DHgtPCizBRc/s400/1172789.jpg",
          pointStart: "5",
          description: "La Presa Ingeniero Carlos F. Roggero es una presa reguladora del cauce del Río Reconquista construida en 1972 y que se ubica a 40 km de la ciudad de Buenos Aires, entre La Reja y Mariano Acosta, partidos de Moreno, Merlo, Marcos Paz y General Rodríguez, provincia de Buenos Aires, Argentina"
        ),
        page(
          context: context,
          title: "Características",
          text0: "La presa contiene las aguas del embalse Lago San Francisco que tiene una extensión de 260 ha; de las cuales 50 que pertenecen al partido de Merlo, otras 120 al de Moreno junto con la represa, unas 50 al partido de General Rodríguez y las 30 restantes al partido de Marcos Paz.",
          text1: "La laguna del dique se forma a través de tres canales que desembocan allí. A partir de las compuertas, nace el río Reconquista de 6 m de ancho y un largo de 45 km, desembocando en el río Luján y este en el río de la Plata.",
          listPhotos: listPhotosUrl,
        ),
        page(
          context: context,
          listPhotos: listPhotosUr2,
          title: "Reserva Municipal Los Robles",
          text0: "El Reserva Los Robles forma parte del Área Natural Protegida Dique Roggero, que tiene mas de 1000 hectáreas, donde podemos encontrar tres ambientes diferentes, el Bosque Exótico, el Pastizal Pampeano y el Humedal",
          text1: "Una gran diversidad de flora y fauna silvestre encuentra refugio y alimentación en la Reserva Los Robles, la misma cuenta con un Cuerpo Municipal de Guardaparques que protege el lugar y realiza una tarea educativa para con los visitantes que tenemos a diario",
          keyboard_arrow_down: false,
        ),
      ],
    );
  }
  Widget pagePortada({required BuildContext context,required String name,String url="default",String description="",String pointStart=""}){
    return Stack(
      children: [
        Column(
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Padding(padding: EdgeInsets.only(bottom: 50.0),child: CachedNetworkImage(imageUrl: url,fit:BoxFit.cover ,placeholder: (context, url) => Container(),errorWidget: (context, url, error) => new Icon(Icons.error))),
                  DecoratedBox(decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomLeft,colors: [Colors.transparent,Theme.of(context).scaffoldBackgroundColor],stops: [0.2,0.9]))),
                  Column(
                    mainAxisAlignment:MainAxisAlignment.center,
                    children: [
                      Expanded(child: Container()),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          clip(text: pointStart,backgroundColor: Colors.amber.withOpacity(0.1),colorIcon:Colors.amber,colorText: Colors.amber,iconData: Icons.star,iconVisibility: true),
                          Padding(padding: const EdgeInsets.all(8.0),child: Text(name, style: estiloTitulo )),
                          Padding(padding: const EdgeInsets.all(12.0),child: Opacity(opacity: 0.6,child: Text(description,textAlign:TextAlign.center))),
                          _createActions(),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 50.0),
            Column(
              children: [
                Text("Más Información"),
                Icon(Icons.keyboard_arrow_down),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 50.0,right: 12.0,left: 12.0),
          child: Column(
            children: [
              Row(
                children: [
                IconButton(onPressed: (){Navigator.of(context).pop();},icon:  Icon(Icons.arrow_back ,color: Colors.white)),
                Expanded(child: Container()),
              ],),
              Expanded(child: Container()),
            ],
          ),
        ),
      ],
    );
  }
  Widget page({required BuildContext context,required String title,required String text0,String text1="",required List listPhotos,bool keyboard_arrow_down = true}){
    return SafeArea(
      child: Column(
        children: [
          Icon(Icons.keyboard_arrow_up,size: 30.0,),
          SizedBox(height: 20.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(title,style: TextStyle(fontSize: 24.0,fontWeight: FontWeight.bold),textAlign:TextAlign.center),
                ),
                text0!=""?_createText(reverse: false,text:text0):Container(),
                listPhotos.length!=0?_createlistViewCardsHorizontalPhotos(reverse: false,listPhotos: listPhotos,widthCard: 300.0,heightCard: 200.0):Container(),
                text1!=""?_createText(reverse: false,text:text1):Container(),
              ],
            ),
          ),
          keyboard_arrow_down?SizedBox(height: 20.0):Container(),
          keyboard_arrow_down?Column(
            children: [
              Text("Deslice Hacia Arriba"),
              Icon(Icons.keyboard_arrow_down),
            ],
          ):Container(),
        ],
      ),
    );
  }
  Widget _createlistViewCardsHorizontalPhotos({required List listPhotos,bool reverse=false,double circleBoderCard=0.0,double widthCard=150,double heightCard=150}){
    return Container(
      width:double.infinity,height: heightCard+30,
      child: ListView.builder(
        padding: EdgeInsets.only(left:reverse?0:40,right:reverse?40:0),
        reverse: reverse,
        shrinkWrap: true,
        scrollDirection:Axis.horizontal,
        itemCount:listPhotos.length,
        itemBuilder: (context, index) => cardPhoto(url: listPhotos[index],height: heightCard,width: widthCard,circleBoder: circleBoderCard),
      ),
    );
  }
  Widget _createActions() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _createButtonAcctions( icon:Icons.call,texto: 'CALL',color:Colors.green),
          _createButtonAcctions( icon:Icons.near_me, texto:'ROUTE' ,color:Colors.cyan),
          _createButtonAcctions( icon:Icons.share, texto:'SHARE',color:Colors.teal),
        ],
      ),
    );
  }

  /// WIDGETS COMPONENTS
  Widget _createText({bool reverse=false,required String text}) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12.0,top: 12.0,left: 40.0,right: 40.0),
      child: Opacity(
        opacity: 0.5,
        child: Text(text,textAlign: TextAlign.justify,style: TextStyle(fontSize: 18.0),overflow: TextOverflow.ellipsis,maxLines: 5,)),
    );
  }
  Widget _createButtonAcctions({required IconData icon,required String texto,required MaterialColor color} ) {
    return Column(
      children: <Widget>[
        MaterialButton(onPressed: () {},color: color[300],textColor: Colors.white,child: Icon( icon,size: 24),padding: EdgeInsets.all(16),shape: CircleBorder()),
        SizedBox( height: 8.0 ),
        Text( texto.toLowerCase(), style: TextStyle( fontSize: 12.0 ), )
      ],
    );

  }
  Widget clip({double size=24.0,required String text,IconData iconData=Icons.check_circle,bool iconVisibility=false,Color backgroundColor=Colors.blue,Color colorText=Colors.white,Color colorIcon=Colors.white})=>Chip(backgroundColor: backgroundColor,shape: StadiumBorder(side: BorderSide(color: backgroundColor)),label: Text(text,style: TextStyle(fontWeight:FontWeight.bold,color: colorText)),avatar:iconVisibility?Icon(iconData,color:colorIcon):null,elevation: 0.0);
  Widget cardPhoto({ required String url,double circleBoder=0.0,double width=150.0,double height=150.0}){
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 2.0,vertical:12.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(circleBoder)),
      child: InkWell(
        child: Container(
          width:width,height: height,
          child: CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl:url,placeholder: (context, urlImage) => Container(color: Colors.grey),errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey))),
        ),
      ),
    );
  }

}