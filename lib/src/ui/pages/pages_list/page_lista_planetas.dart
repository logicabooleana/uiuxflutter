import 'package:bottom_navy_bar/bottom_navy_bar.dart';
/// Copyright 2020 Logica Booleana Authors


// Dependencias 
import 'package:desingapp/src/utils/dynamicTheme_lb.dart';
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:flutter/material.dart';
/// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:animate_do/animate_do.dart';
import 'package:google_fonts/google_fonts.dart';


class PageListaPlaneta extends StatefulWidget {
  @override
  _PageListaPlanetaState createState() => _PageListaPlanetaState();
}

class _PageListaPlanetaState extends State<PageListaPlaneta> {

  // var
  bool themeIsDark=false;
  int positionPlaneta = 0;
  late List listaPlanetas;
  late BoxDecoration boxDecorationFondo ;
  Color colorPrimary =  Colors.transparent;
  Color colorCardView = Colors.white12;
  Color colorCardViewHorizontal = Colors.white10;
  Color colorTitulo = Colors.white70;
  Color colorTextoCardview = Colors.white30;
  late AnimationController animateController;
  late AnimationController animateController2;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose(){
    animateController.dispose();
    animateController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Definimos las variables
    themeIsDark = Theme.of(context).brightness==Brightness.dark?true:false;
    boxDecorationFondo = Theme.of(context).brightness==Brightness.dark? BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [Colors.black,Colors.black],)) : BoxDecoration(gradient: LinearGradient(begin: Alignment.topRight,end: Alignment.bottomLeft,colors: [ Color.fromRGBO(88, 71, 151, 1.0),Color.fromRGBO(34, 28, 56, 1.0) ],))  ;
    // Creamos una lista con la información de los cuerpos del sistema solar 
    listaPlanetas = [
      {
        'titulo': "Sol",
        'subtitulo':"Es una estrella de tipo-G de la secuencia principal y clase de luminosidad V que se encuentra en el centro del sistema solar y constituye la mayor fuente de radiación electromagnética de este sistema planetario.",
        'assetImage': AssetImage("assets/image_sol.png"),
        'superficie': '6,0877 × 1012 km²',
        'distancia': '0 km',
        'color': Colors.orange,
      },
      {
        'titulo': "Mercurio",
        'subtitulo':
            "Es el planeta del sistema solar más próximo al Sol y el más pequeño. Forma parte de los denominados planetas interiores o terrestres y carece de satélites naturales al igual que Venus. ",
        'assetImage': AssetImage("assets/image_planeta_mercurio.png"),
        'superficie': '74,8 millones km²',
        'distancia': ' 57,91 millones km',
        'color': Colors.grey,
      },
      {
        'titulo': "Venus",
        'subtitulo':
            "Es el segundo planeta del sistema solar en orden de distancia desde el Sol, el sexto en cuanto a tamaño, ordenados de mayor a menor. Al igual que Mercurio, carece de satélites naturales. Recibe su nombre en honor a Venus, la diosa romana del amor.",
        'assetImage': AssetImage("assets/image_planeta_venus.png"),
        'superficie': '460,2 millones km²',
        'distancia': '108,2 millones km',
        'color': Colors.orange[700],
      },
      {
        'titulo': "Tierra",
        'subtitulo':
            "Es un planeta del sistema solar que gira alrededor de su estrella —el Sol— en la tercera órbita más interna. Es el más denso y el quinto mayor de los ocho planetas del sistema solar. También es el mayor de los cuatro terrestres o rocosos.",
        'assetImage': AssetImage("assets/image_planeta_tierra.png"),
        'superficie': '510,1 millones km²',
        'distancia': '149,6 millones km',
        'color': Colors.blue[800],
      },
      {
        'titulo': "Marte",
        'subtitulo':
            "Es el cuarto planeta en orden de distancia al Sol y el segundo más pequeño del sistema solar, después de Mercurio.",
        'assetImage': AssetImage("assets/image_planeta_marte.png"),
        'superficie': '144,8 millones km²',
        'distancia': '227,9 millones km',
        'color': Colors.red,
      },
      {
        'titulo': "Júpiter",
        'subtitulo':
            "Es el quinto planeta del sistema solar. Forma parte de los denominados planetas exteriores o gaseosos. Recibe su nombre del dios romano Júpiter. Se trata del planeta que ofrece un mayor brillo a lo largo del año dependiendo de su fase.",
        'assetImage': AssetImage("assets/image_planeta_jupiter.png"),
        'superficie': '74,8 millones km²',
        'distancia': '61,42 miles de millones km²',
        'color': Colors.yellow[900],
      },
      {
        'titulo': "Saturno",
        'subtitulo':
            "Es el sexto planeta del sistema solar contando desde el Sol, el segundo en tamaño y masa después de Júpiter y el único con un sistema de anillos visible desde la Tierra. Su nombre proviene del dios romano Saturno. Forma parte de los denominados planetas exteriores o gaseosos. ",
        'assetImage': AssetImage("assets/image_planeta_saturno.png"),
        'superficie': '42,7 miles de millones km²',
        'distancia': '1,434 miles de millones km',
        'color': Colors.orange[200],
      },
      {
        'titulo': "Urano",
        'subtitulo':
            "Es el séptimo planeta del sistema solar, el tercero de mayor tamaño, y el cuarto más masivo. Se llama así en honor de la divinidad griega del cielo Urano, el padre de Crono y el abuelo de Zeus.",
        'assetImage': AssetImage("assets/image_planeta_urano.png"),
        'superficie': '8,083 miles de millones km²',
        'distancia': '2,871 miles de millones km',
        'color': Colors.cyan,
      },
      {
        'titulo': "Neptuno",
        'subtitulo':"Es el octavo planeta en distancia respecto al Sol y el más lejano del sistema solar. Forma parte de los denominados planetas exteriores o gigantes gaseosos, y es el primero que fue descubierto gracias a predicciones matemáticas.",
        'assetImage': AssetImage("assets/image_planeta_neptuno.png"),
        'superficie': '7,618 miles de millones km²',
        'distancia': '4,495 miles de millones km',
        'color': Colors.blueGrey,
      },
    ];
    return Container(
      decoration: boxDecorationFondo,
      child: Stack(
        children: [
          ImgGalaxy(duration: Duration(seconds: 3), isFullSun: themeIsDark),
          Scaffold(
            backgroundColor: Colors.transparent,
            body: body(),
            bottomNavigationBar: bottomNavyBar(),
          ),
          
        ],
      ),
    );
  }
  
  /// WIDGETS VIEWS
  Widget body(){
    return SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Expanded(child: Padding(padding: EdgeInsets.all(20.0),child: Text("Explora el sistema solar",style: GoogleFonts.robotoCondensed(fontSize: 30,color:colorTitulo,fontWeight:FontWeight.bold)))),
                      /* Cambia el brillo del tema */
                      WidgetsUtilsApp().buttonThemeBrightness(context: context),
                    ],
                  ),
                  buscadorView(isDark:themeIsDark),
                  Expanded(child: Onboading(context: context,colorFondo: Colors.transparent,listaCuerpos:listaPlanetas)),
                  
                ],
              ),
            );

  }
  /// WIDGETS COMPONENTS 
  Widget bottomNavyBar(){

    return BottomNavyBar(
      selectedIndex: 0,
      //showElevation: true, // use this to remove appBar's elevation
      onItemSelected: (i){},
      items: [
        BottomNavyBarItem(
          icon: Icon(Icons.apps),
          title: Text('Home'),
          activeColor: Colors.red,
        ),
      BottomNavyBarItem(
          icon: Icon(Icons.people),
          title: Text('Users'),
          activeColor: Colors.purpleAccent
      ),
      BottomNavyBarItem(
          icon: Icon(Icons.message),
          title: Text('Messages'),
          activeColor: Colors.pink
      ),
      BottomNavyBarItem(
          icon: Icon(Icons.settings),
          title: Text('Settings'),
          activeColor: Colors.blue
      ),
      ],
    );
  }
  Widget buscadorView( {required bool isDark}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 0.0,horizontal: 12.0),
      child: TextFormField(
        style: TextStyle(color: Colors.white),
        obscureText: false,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(gapPadding: 12.0,borderSide: BorderSide(color: Colors.transparent, width: 0.0),borderRadius: BorderRadius.circular(10.0) ),
          enabledBorder: OutlineInputBorder(gapPadding: 12.0,borderSide: BorderSide(color: Colors.transparent, width: 0.0),borderRadius: BorderRadius.circular(10.0)),
          hintText: "Buscar planeta",
          hintStyle: TextStyle(color: Colors.black45),
          contentPadding: EdgeInsets.all(20.0),
          border: InputBorder.none,
          filled: true,
          fillColor: isDark?Colors.white54:Colors.white,
          prefixIcon: Icon(Icons.search, color: Colors.black45),
          suffixIcon: Icon(Icons.tune,color:Colors.black54),
        ),
      ),
    );
  }
}

/// CLASS WIDGETS
class Onboading extends StatefulWidget {
  const Onboading({
    Key ?key,
    required this.context,
    required this.colorFondo,
    required this.listaCuerpos,
  }) : super(key: key);

  // var
  final BuildContext context;
  final Color colorFondo;
  final List<dynamic> listaCuerpos;

  @override
  _OnboadingState createState() => _OnboadingState(colorFondo: colorFondo,context: context,listaCuerpos: listaCuerpos);
}

class _OnboadingState extends State<Onboading> {
  _OnboadingState({
    required this.context,
    required this.colorFondo,
    required this.listaCuerpos,
  });
  // var
  final PageController _controller = PageController(initialPage:0); 
  final BuildContext context;
  final Color colorFondo;
  final List<dynamic> listaCuerpos;
  late AnimationController animateController;
  late AnimationController animateController2;


  @override
  void dispose(){
    animateController.dispose();
    animateController2.dispose();
    _controller.dispose();
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    
    return Container(
      color: Colors.transparent,
      child: Scaffold(
        backgroundColor: widget.colorFondo,
            body: PageView.builder( // Una lista desplazable que funciona página por página. */
            controller: _controller,  //  El initialPageparámetro establecido en 0 significa que el primer elemento secundario del widget PageViewse mostrará primero (ya que es un índice basado en cero) */
            pageSnapping: true, // Deslizaiento automatico */
            scrollDirection: Axis.horizontal, // Dirección de deslizamiento */
            itemCount: listaCuerpos.length,
            physics: ScrollPhysics(),
            itemBuilder: (context, index) {
              return cardViewPlanetaView(
                    color: listaCuerpos[index]["color"]??Colors.red,
                    colorTitulo: Colors.white24,
                    colortexto: Colors.white70,
                    assetImage: listaCuerpos[index]["assetImage"],
                    titulo: listaCuerpos[index]["titulo"],
                    subtitulo: listaCuerpos[index]["subtitulo"],
                    distancia: listaCuerpos[index]["distancia"],
                    superficie: listaCuerpos[index]["superficie"],
                  );
            },
          ),
      ),
    );
  }
  /// WIDGETS COMPONENTS
  Widget cardViewPlanetaView({required AssetImage assetImage,required String titulo,String subtitulo = "",String distancia = "",String superficie = "",Color color=Colors.white10,Color colorTitulo=Colors.white10,Color colortexto=Colors.white10,}) {
    // Devuelve una vista previa de un tarjeta grande con los datos del planeta enfocado */
    // var
    final imagenPlaneta = new Container(
      margin: EdgeInsets.only(bottom: 250.0),
      alignment: FractionalOffset.centerRight,
      child: SpinPerfect( // SpinPerfect : animación */
        manualTrigger: true, // (opcional) si es verdadero, no disparará la animación al cargar */
        controller: ( controller ) => animateController2 = controller,// (opcional, pero obligatorio si usa manualTrigger: true) Esta devolución de llamada expone el AnimationController utilizado para la animación seleccionada. Luego puede llamar a animationController.forward () para activar la animación donde quiera manualmente. */
        child: Image(image: assetImage,height: 200.0,width: 200.0) ,
        infinite: true,
        animate: true,
        duration: Duration(seconds: 50,)
      ),
    );
    // Tarjeta con detalles
    final tarjetaDetalles = 
     Container(
        // Margen de la tarjeta
        margin: new EdgeInsets.only(top: 75.0,right: 20),
        decoration: new BoxDecoration(
          color: color.withOpacity(0.8),
          shape: BoxShape.rectangle,
          borderRadius: new BorderRadius.circular(30.0),
          boxShadow: <BoxShadow>[ BoxShadow(color: Colors.black12,blurRadius: 10.0,offset: Offset(0.0, 8.0)) ], // Aplica sombra
        ),
        child: Container(
          // Margen del contenido
          margin: const EdgeInsets.only( left: 12.0, top: 12.0, right: 20.0, bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new Text(titulo,style: TextStyle(fontSize: 60.0, fontWeight: FontWeight.bold,color: colorTitulo),overflow: TextOverflow.ellipsis),
              new Expanded(child: Container(),),
              new Text(subtitulo,style: TextStyle(fontSize: 16.0,color: colortexto),textAlign: TextAlign.right),
              new Divider(),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Expanded(child: Container()),
                  new Icon(Icons.brightness_7, size: 14.0, color: Colors.amber),
                  new SizedBox(width: 5.0),
                  new Text(distancia,style: TextStyle(fontSize: 12.0,color: colortexto),overflow: TextOverflow.ellipsis),
                ],
              ),
              new SizedBox(height: 5.0),
              new Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  new Expanded(child: Container()),
                  new Icon(Icons.transfer_within_a_station,size: 14.0, color: Colors.blueAccent),
                  new SizedBox(width: 5.0),
                  new Text(superficie,style: TextStyle(fontSize: 12.0,color: colortexto),overflow: TextOverflow.ellipsis),
                ],
              ),
            ],
          ),
        ));
    // Creamos una vista superpuesta 
    return Container(
      color: Colors.transparent,
        margin: const EdgeInsets.only(top: 40,bottom: 20,left: 30,right: 10),
        child: new Stack(
          children: <Widget>[
            ElasticInRight( // animación
              manualTrigger: true, // (opcional) si es verdadero, no disparará la animación al cargar */
              controller: ( controller ) => animateController = controller,// (opcional, pero obligatorio si usa manualTrigger: true) Esta devolución de llamada expone el AnimationController utilizado para la animación seleccionada. Luego puede llamar a animationController.forward () para activar la animación donde quiera manualmente. */
              child:tarjetaDetalles ,
            ),
            imagenPlaneta,
            
          ],
        ));
  }
}
class ImgGalaxy extends StatelessWidget {
  const ImgGalaxy({Key ?key,required Duration duration,required this.isFullSun,})  : _duration = duration,super(key: key);

  // var
  final Duration _duration;
  final bool isFullSun;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity:  0.8,
      duration: _duration,
      curve: Curves.easeOut,
      child: Image.asset("assets/images/galaxy.png",gaplessPlayback: true,fit: BoxFit.fitHeight,),
    );
  }
}