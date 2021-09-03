/// Copyright 2020 Logica Booleana Authors

// Dependencias 
import 'package:flutter/material.dart';
import 'dart:math';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias */
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';

class PageLoginBank extends StatelessWidget {
  PageLoginBank({Key ?key}) : super(key: key);

  // var
  Color colorFondo=Colors.deepPurple,colorAccent=Colors.deepPurple;
  PageController _controller = PageController(initialPage:0); 
  late Size screenSize; // Obtenemos las vavriables de la dimension de la pantalla

  @override
  Widget build(BuildContext context) {

    // Obtenemos los valores
    screenSize = MediaQuery.of(context).size;
    colorFondo=Theme.of(context).brightness==Brightness.dark?Colors.deepPurple:Colors.white;
    colorAccent=Theme.of(context).brightness==Brightness.dark?Colors.white:colorAccent;
    
    return Scaffold(
      backgroundColor:colorFondo,
      body: body(context: context),
    );
  }

  /// WIDGETS
  Widget dotsIndicator({ required BuildContext context, required PageController pageController,required List pages}){
    return DotsIndicator(
        controller: pageController,itemCount: pages.length,
        color: colorAccent,
        onPageSelected: (int page) {_controller.animateToPage(page,duration: const Duration(milliseconds: 300),curve: Curves.ease);},
      );
  }
  Widget body({required BuildContext context}) {
    // Definimos los estilos de colores de los botones
    Color colorText = Theme.of(context).brightness==Brightness.dark?Colors.deepPurple:Colors.white;
    Color colorButton = Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.deepPurple;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SafeArea(child: Row(children: [Expanded(child: Container()),WidgetsUtilsApp().buttonThemeBrightness(context: context)])),
        Expanded(child: onboarding(context: context,colorContent:colorButton,colorFondo:colorFondo, height:double.infinity,width: double.infinity)),
        
        button(text:"Crear cuenta gratis",colorButton: colorButton,colorText: colorText ),
        button(text:"Iniciar sesión",colorButton: colorButton,colorText: colorText ),
        SizedBox(height: 20.0,),
      ],
    );
  }
  /// WIDGETS COMPONENT
  Widget onboarding({required BuildContext context,Color ?colorContent,Color colorFondo=Colors.transparent,double width=double.infinity,double height=200}){
    // Pantallas integradas para la introducción a la aplicación

    List<Widget> _pages =[
      pageInformacion(context:context,colorContent:colorContent,iconData: Icons.phone_android,titulo:"Somos un banco en una app",subtitulo:"Abrí tu cuenta simple y rápida.\nNo pagás mantenimiento, ni resúmenes, ni gastos de apertura,ni movimientos en cajeros automáticos."),
      pageInformacion(context:context,colorContent:colorContent,iconData: Icons.monetization_on,titulo:"Controlá tu plata.",subtitulo:"Podés analizar tus compras y tranferencias en categorías para saber exactamente como estás usando tu plata."),
      pageInformacion(context:context,colorContent:colorContent,iconData: Icons.notifications_active,titulo:"Todo pasa en tu celu.",subtitulo:"Cada vez que haya un movimiento en tu cuenta vas a recibir una notificación.\nNada va a quedar fuera de tu control."),
    ];
    
    return Container(
      width: width,height: height,
      child: Scaffold(
        backgroundColor:colorFondo,
            body: PageView( // Una lista desplazable que funciona página por página. */
            controller: _controller,  //  El initialPageparámetro establecido en 0 significa que el primer elemento secundario del widget PageViewse mostrará primero (ya que es un índice basado en cero) */
            pageSnapping: true, // Deslizaiento automatico */
            scrollDirection: Axis.horizontal, // Dirección de deslizamiento */
            children: _pages,
          ),
        floatingActionButton: dotsIndicator(context: context,pageController: _controller,pages: _pages),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
  Widget pageInformacion({required BuildContext context,Color ?colorContent, AssetImage ?assetImage,IconData ?iconData,Color ?colorIcon, String titulo="",String subtitulo=""}) {
    
    // Definimos los estilos
    if(colorContent == null)colorContent =Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black;
    if(colorIcon==null)colorIcon=colorContent;
    final estiloTitulo = TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,color: colorContent);
    final estiloSubTitulo = TextStyle(fontSize: 20.0,color: colorContent.withOpacity(0.5));

    return SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              Expanded(child: Container()),
              assetImage!=null?Padding(padding: EdgeInsets.all(12.0),child: Image(image: assetImage,width: screenSize.width / 2,height: screenSize.height / 2,fit: BoxFit.contain),):Container(),
              iconData!=null?Container(padding:EdgeInsets.all(12.0),child:Icon(iconData,size: screenSize.height*0.10,color: colorIcon)):Container(),
              Text(titulo,style: estiloTitulo,textAlign: TextAlign.center),
              SizedBox(height: 12.0),
              Text(subtitulo,style: estiloSubTitulo,textAlign: TextAlign.center),
              SizedBox(height: 12.0),
              Expanded(child: Container()),
            ],
          ),
    ));
  }
  Widget button({required String text,Color colorText = Colors.white, Color colorButton = Colors.purple,double padding = 12}){
    return Padding(
          padding: EdgeInsets.symmetric(horizontal: padding,vertical:padding),
          child: ElevatedButton(
            style:ElevatedButton.styleFrom(
              padding: EdgeInsets.all(20.0),
              onPrimary: Colors.white,primary:colorButton,shadowColor: colorButton,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color:colorButton)),
              side: BorderSide(color: colorButton),
            ),
            child: Text(text.toUpperCase(), style: TextStyle(color: colorText,fontSize: 18.0,fontWeight: FontWeight.bold)),
            onPressed: () {},
          ),
        );
  }
  Widget buttonRoundAppBar({required void Function() onPressed,required BuildContext context,Widget ?child,required IconData icon,required EdgeInsets edgeInsets})  => Material(color: Colors.transparent,child: Center( child: Padding(padding: const EdgeInsets.all(8.0),child: Ink(decoration: ShapeDecoration(color: Brightness.dark==Theme.of(context).brightness?Colors.black:Colors.white,shape: CircleBorder()), child: child==null?IconButton(icon: Icon(icon),color:Brightness.dark==Theme.of(context).brightness?Colors.white:Colors.black,onPressed: onPressed):child))));
} 

/// Un indicador que muestra la página actualmente seleccionada de un PageController
class DotsIndicator extends AnimatedWidget {
  DotsIndicator({required this.controller,required this.itemCount,required this.onPageSelected,this.color: Colors.white}) : super(listenable: controller);
  // El PageController que representa este DotsIndicator.
  final PageController controller;
  // La cantidad de elementos administrados por PageController
  final int itemCount;
  // Llamado cuando se toca un punto
  final ValueChanged<int> onPageSelected;

  // El color de los puntos.
  // Defaults to `Colors.white`.
  final Color color;
  // El tamaño base de los puntos
  static const double _kDotSize = 8.0;
  // El aumento en el tamaño del punto seleccionado.
  static const double _kMaxZoom = 2.0;
  // La distancia entre el centro de cada punto
  static const double _kDotSpacing = 25.0;

  Widget _buildDot(int index) {
    double selectedness = Curves.easeOut.transform(max(0.0,1.0 - ((controller.page ?? controller.initialPage) - index).abs()));
    double zoom = 1.0 + (_kMaxZoom - 1.0) * selectedness;
    return new Container(
      width: _kDotSpacing,height: _kDotSpacing,
      child: new Center(
        child: new Material(
          color: color,
          type: MaterialType.circle,
          child: new Container(
            width: _kDotSize * zoom,
            height: _kDotSize * zoom,
            child: new InkWell(onTap: () => onPageSelected(index) ),
          ),
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: new List<Widget>.generate(itemCount, _buildDot),
    );
  }
}