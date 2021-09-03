/// Copyright 2020 Logica Booleana Authors


// Dependencias
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:lottie/lottie.dart';
import 'package:animate_do/animate_do.dart';

// var
bool isPassword = false;


class PageLoginSistemaSolar extends StatefulWidget {
  PageLoginSistemaSolar({Key ?key}) : super(key: key);

  @override
  _PageLoginSistemaSolarState createState() => _PageLoginSistemaSolarState();
}

class _PageLoginSistemaSolarState extends State<PageLoginSistemaSolar>  {

  // var
  late AnimationController animationController;
  String sUser="",sPass="";
  bool isDartkTheme=true;
  Duration _duration = Duration(seconds: 1);
  late List<Color> lightBgColors,darkBgColors;

  @override
  void initState() {
    super.initState();
  }
   @override
  void dispose() {
    if(animationController!=null)animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // var
    SizeConfig().init(context);
    lightBgColors = [Color(0xFF8C2480),Color(0xFFCE587D),Colors.blue[600]!,Colors.cyan];
    darkBgColors = [Colors.black,Colors.indigo[800]!.withOpacity(0.2),Colors.blue[800]!.withOpacity(0.3)];

    return Scaffold(
        backgroundColor: Colors.black,
        body: body()
    );
  }

/// WIDGETS
  Widget body(){
    return AnimatedContainer(
      duration: _duration,
      curve: Curves.easeInOut,
      width: double.infinity,
      height: SizeConfig.screenHeight,
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter, colors: isDartkTheme ? darkBgColors : lightBgColors,),),
      child: Stack(
        children: [
          ImgGalaxy(duration: Duration(seconds: 3), isFullSun: isDartkTheme),
          ImgLuna(duration: Duration(seconds: 1), isFullSun: isDartkTheme),
          ImgSol(duration: _duration, isFullSun: isDartkTheme),
          ImgTierra(isDarak:isDartkTheme),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  VerticalSpacing(of: 50.0),
                  Tabs(isDartkTheme: isDartkTheme,press: (value)=>setState((){isDartkTheme=value==0?false:true;})),
                  VerticalSpacing(),
                  Text("Bienvenida",style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 30.0)),
                  VerticalSpacing(of: 10.0),
                  Text("Ingrese su información a continuación",style: TextStyle(color: Colors.white)),
                  VerticalSpacing(of: 50.0),
                  JelloIn(controller: ( controller ) => animationController = controller,child: !isPassword?RoundedTextField(initialValue:sUser,hintTextInterior: "ejemplo@gmail.com",hintText: "Usuario o E-mail"):RoundedTextField(initialValue:sPass,hintTextInterior: "*******",hintText: "Contaseña")),
                  VerticalSpacing(),
                  buttonRound(onPressed: () {setState(() {isPassword=!isPassword;});animationController.repeat();},text: "Iniciar sesion",colorButton: Colors.white10,colorText: Colors.white,colorBorder: Colors.white10),
                  Expanded(child: Container()),
                  Row(
                    children: [
                      Expanded(child:Container(),),
                      Padding(padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical:8.0),child: RaisedButton(padding:EdgeInsets.all(20.0),elevation: 1.0,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0),side: BorderSide(color:Colors.white54)),onPressed: () {},color:Colors.white12,textColor:Colors.white54,child: Text("Omitir".toUpperCase(),style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.bold)))),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
  /// WIDGETS COMPONENTS
  Widget buttonRound({required void Function()? onPressed,required String text,IconData ?iconData,Color colorButton=Colors.white,Color colorText=Colors.white,Color ?colorBorder}){
    if(colorBorder==null)colorBorder=colorButton;
    return ElevatedButton(
      child: Text(text,style: TextStyle(color: colorText,fontSize: 16.0,fontWeight: FontWeight.bold)),
      style:ElevatedButton.styleFrom(
        elevation: 0.0,
        padding: EdgeInsets.all(20.0),
        primary: colorButton,onPrimary:Colors.black,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0),side: BorderSide(color: colorBorder)),
      ),
      onPressed: onPressed,
    );
  }
}


/// CLASS WIDGETS
class RoundedTextField extends StatelessWidget {
  const RoundedTextField({Key ?key,required this.initialValue,this.hintText="",this.hintTextInterior=""}) : super(key: key);

  // var
  final String initialValue, hintText,hintTextInterior;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(hintText,style: TextStyle(color: Colors.white60)),
        VerticalSpacing(of: 10.0),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 5.0),
          decoration: BoxDecoration(color: Colors.white10,borderRadius: BorderRadius.circular(12.0),border: Border.all(width: 2,color: Colors.white10.withOpacity(0.1))),
          child: TextField(style: TextStyle(color: Colors.white),controller: TextEditingController(text: initialValue),decoration: InputDecoration(hintText: hintTextInterior,hintStyle:TextStyle(color: Colors.white),enabledBorder: InputBorder.none,focusedBorder: InputBorder.none)),
        ),
      ],
    );
  }
}

class Tabs extends StatelessWidget {
  const Tabs({Key ?key,required this.press,required this.isDartkTheme,}) : super(key: key);
  // var
  final ValueChanged<int> press;
  final bool isDartkTheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 100),
      width: SizeConfig.screenWidth * 0.8, // 80%
      decoration: BoxDecoration(color: Colors.white24,borderRadius: BorderRadius.circular(12)),
      child: DefaultTabController(
        initialIndex: isDartkTheme?1:0,
        length: 2,
        child: TabBar(
          indicator: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(12)),
          indicatorColor: Colors.white,
          labelStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          labelColor: Colors.black,
          unselectedLabelColor: Colors.white,
          onTap: press,
          tabs: [
            Row(children: [Expanded(child: Tab(text: "Día ")),Icon(Icons.wb_sunny,color:isDartkTheme?Colors.white30:Colors.orange)]), 
            Row(children: [Expanded(child: Tab(text: "Noche ")),Icon(Icons.brightness_2,color:isDartkTheme?Colors.yellow:Colors.white30)]),
          ],
        ),
      ),
    );
  }
}

class ImgSol extends StatefulWidget {
  const ImgSol({Key ?key,required Duration duration,required this.isFullSun,}) : _duration = duration,super(key: key);

  // var
  final Duration _duration;
  final bool isFullSun;

  @override
  _ImgSolState createState() => _ImgSolState();
}

class _ImgSolState extends State<ImgSol>  with TickerProviderStateMixin {

  // var
  late AnimationController _controllerLogo; 

  @override
  void initState() {
    super.initState();
    _controllerLogo = AnimationController(vsync: this);
  }
  @override
  void dispose() {
    _controllerLogo.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget._duration,
      curve: Curves.easeInOut,
      left: getProportionateScreenWidth(30),
      bottom: getProportionateScreenWidth(!widget.isFullSun ? 55 : -300),
      child: Lottie.asset('assets/json/sol-anim.json',controller: _controllerLogo,height: 350,width: 350.0,onLoaded: (composition) {setState(() {_controllerLogo.duration = composition.duration;_controllerLogo.repeat();});},),
    );
  }
}

class ImgLuna extends StatefulWidget {
  const ImgLuna({Key ?key,required Duration duration,required this.isFullSun,})  : _duration = duration,super(key: key);

  // var
  final Duration _duration;
  final bool isFullSun;

  @override
  _ImgLunaState createState() => _ImgLunaState();
}

class _ImgLunaState extends State<ImgLuna> with TickerProviderStateMixin {

  // var
  late AnimationController _controllerLogo=AnimationController(vsync: this); 

  @override
  void initState() {
    super.initState();
    _controllerLogo = AnimationController(vsync: this);
  }
  @override
  void dispose() {
    _controllerLogo.dispose();
    super.dispose();
  }
  

  @override
  Widget build(BuildContext context) {
    return AnimatedPositioned(
      duration: widget._duration,
      curve: Curves.easeInOut,
      left: getProportionateScreenWidth(50),
      bottom: getProportionateScreenWidth(widget.isFullSun ? 200 : -300),
          child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 100.0,top: 150.0),
          child: AnimatedOpacity(
            opacity: widget.isFullSun  ? 1 : 0.0,
            duration: widget._duration,
            curve: Curves.easeOut,
            child: Lottie.asset('assets/json/luna-anim.json',controller: _controllerLogo,height: 200,width: 200.0,onLoaded: (composition) {setState(() {_controllerLogo.duration = composition.duration;_controllerLogo.repeat();});},),
          ),
        ),
      ),
    );
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
      opacity: isFullSun  ? 1 : 0.4,
      duration: _duration,
      curve: Curves.easeOut,
      child: Image.asset("assets/images/galaxy.png",gaplessPlayback: true,height: getProportionateScreenWidth(430),fit: BoxFit.fitHeight,),
    );
  }
}

class SizeConfig {
  static late  MediaQueryData _mediaQueryData;
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static late Orientation orientation;

  void init(BuildContext context) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData.size.width;
    screenHeight = _mediaQueryData.size.height;
    orientation = _mediaQueryData.orientation;
  }
}

/// FUNCTIONS
// Obtenga la altura proporcional según el tamaño de la pantalla 
double getProportionateScreenHeight(double inputHeight) {
  double screenHeight = SizeConfig.screenHeight;
  // Nuestra diseñadora usa iPhone 11, por eso usamos 896.0(femenino)
  return (inputHeight / 896.0) * screenHeight;
}

// Obtenga la altura proporcional según el tamaño de la pantalla 
double getProportionateScreenWidth(double inputWidth) {
  double screenWidth = SizeConfig.screenWidth;
  // 414 es el ancho de diseño que usa el diseñador o puede decir ancho del iPhone 11
  return (inputWidth / 414.0) * screenWidth;
}

// Para agregar espacio libre verticalmente
class VerticalSpacing extends StatelessWidget {
  const VerticalSpacing({Key ?key,this.of = 25,}) : super(key: key);

  // var
  final double of;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: getProportionateScreenHeight(of),);
  }
}

class ImgTierra extends StatelessWidget {
  const ImgTierra({Key ?key,required this.isDarak}) : super(key: key);

  // var
  final bool isDarak;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: getProportionateScreenWidth(-150),
      left:0,
      right:0,
      child: Image.asset(isDarak?"assets/images/planet-terra-noche.png":"assets/images/planet-terra-dia.png",gaplessPlayback: true,height: getProportionateScreenWidth(350),fit: BoxFit.fitHeight),
    );
  }
}