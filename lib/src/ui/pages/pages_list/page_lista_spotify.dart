/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:flutter/material.dart';
import 'dart:math' show pi;
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';


class PagelistaSpotify extends StatefulWidget {
  PagelistaSpotify({Key ?key}) : super(key: key);
  @override
  PagelistaSpotifyState createState() => PagelistaSpotifyState();
}

class PagelistaSpotifyState extends State<PagelistaSpotify> with SingleTickerProviderStateMixin {

  // var
  List listaEscuchadosRecientes =[
    {"iconData":Icons.favorite,"titulo":"Canciones que te gustan","url":""},
    {"iconData":null,"titulo":"Reggeaton","url":"https://m.media-amazon.com/images/I/9108tFq2HwL._SS500_.jpg"},
    {"iconData":null,"titulo":"Cumbia","url":"https://content-images.p-cdn.com/images/79/05/46/16/7db749aeac50c257ec52f704/_500W_500H.jpg"},
    {"iconData":null,"titulo":"Top canciones","url":"https://enter504.com/wp-content/uploads/2020/12/Spotify-resumen-musical-2020.jpeg"},
    {"iconData":null,"titulo":"Solo pop","url":"https://pbs.twimg.com/media/DK6W-oKVoAErP5A.jpg"},
    {"iconData":null,"titulo":"Electronica & Dance","url":"https://dhfsk7jl2g0km.cloudfront.net/playlist-09tdi9JkYgC7DP0XYBl4Az.jpeg"},
  ];
  List listaRecomendadosParaTi =[
    {"iconData":null,"titulo":"Mates y Música","url":"https://i.scdn.co/image/ab67706f00000003222e41a2ea5e7999fbc8656f"},
    {"iconData":null,"titulo":"Los éxistos de reggeaton","url":"https://direct.rhapsody.com/imageserver/images/alb.389886666/600x600.jpg"},
    {"iconData":null,"titulo":"¡Escucha los éxitos de hoy!","url":"https://i.pinimg.com/474x/f2/08/f8/f208f863db0692d2c21dcff058bceb8f.jpg"},
    {"iconData":null,"titulo":"Top canciones","url":"https://enter504.com/wp-content/uploads/2020/12/Spotify-resumen-musical-2020.jpeg"},
    {"iconData":null,"titulo":"Solo pop","url":"https://pbs.twimg.com/media/DK6W-oKVoAErP5A.jpg"},
    {"iconData":null,"titulo":"Electronica & Dance","url":"https://dhfsk7jl2g0km.cloudfront.net/playlist-09tdi9JkYgC7DP0XYBl4Az.jpeg"},
  ];
  List listaHechosParaTi =[
    {"iconData":null,"titulo":"Electronica & Dance","url":"https://dhfsk7jl2g0km.cloudfront.net/playlist-09tdi9JkYgC7DP0XYBl4Az.jpeg"},
    {"iconData":null,"titulo":"¡Escucha los éxitos de hoy!","url":"https://i.pinimg.com/474x/f2/08/f8/f208f863db0692d2c21dcff058bceb8f.jpg"},
    {"iconData":null,"titulo":"Solo pop","url":"https://pbs.twimg.com/media/DK6W-oKVoAErP5A.jpg"},
    {"iconData":null,"titulo":"Top canciones","url":"https://enter504.com/wp-content/uploads/2020/12/Spotify-resumen-musical-2020.jpeg"},
    {"iconData":null,"titulo":"Mates y Música","url":"https://i.scdn.co/image/ab67706f00000003222e41a2ea5e7999fbc8656f"},
    {"iconData":null,"titulo":"Solo pop","url":"https://pbs.twimg.com/media/DK6W-oKVoAErP5A.jpg"},
    {"iconData":null,"titulo":"Los éxistos de reggeaton","url":"https://direct.rhapsody.com/imageserver/images/alb.389886666/600x600.jpg"},
    {"iconData":null,"titulo":"Electronica & Dance","url":"https://dhfsk7jl2g0km.cloudfront.net/playlist-09tdi9JkYgC7DP0XYBl4Az.jpeg"},
  ];
  Color  colorDegradado=Colors.grey;
  Color colorFondo=Colors.black;
  late Size screenSize; // variable para los pixeles del ancho y alto de la pantalla

  @override
  Widget build(BuildContext context) {

    // var
    screenSize = MediaQuery.of(context).size;/* // Toma los pixeles del ancho y alto de la pantalla */
    colorFondo=Theme.of(context).brightness==Brightness.dark?Colors.black:Theme.of(context).canvasColor; /* Establece el color de fondo de la iterface grafica */

    return Scaffold(
      body: body(),
    );
  }
  // WIDGETS VIEWS
  Widget bottomNavigationBar({required BuildContext context}){
    return Container(
      color: Theme.of(context).brightness==Brightness.dark?Colors.grey[900]:Colors.white,
      child: Column(
        mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ListTileMusic(),
          Divider(height: 1.0,color: Colors.black26),
          BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Theme.of(context).brightness==Brightness.dark?Colors.grey[900]:Colors.white,
            selectedItemColor: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black,
            unselectedItemColor: Theme.of(context).brightness==Brightness.dark?Colors.white.withOpacity(.60):Colors.black.withOpacity(.60),
            selectedFontSize: 12,unselectedFontSize: 11,
            onTap: (value) {},
            items: [
              BottomNavigationBarItem(label: 'Inicio',icon: Icon(Icons.home),),
              BottomNavigationBarItem(label: 'Buscar',icon: Icon(Icons.search),),
              BottomNavigationBarItem(label: 'Tu biblioteca',icon: Icon(Icons.view_carousel),),
              BottomNavigationBarItem(label: 'Premiun',icon: FaIcon(FontAwesomeIcons.spotify)),
            ],
          ),
        ],
      ),
    );
  }
  Widget body(){

    // var 
    List <Widget>list = [
      listGridButtons(),
      listHorizontalCards(titulo: "Escuchado recientemente",listPeliculas:listaEscuchadosRecientes),
      listHorizontalCardsGrande(titulo:"Recomendaciones para ti",listPeliculas:listaRecomendadosParaTi),
      listHorizontalCards(titulo:"Hechos para ti",listPeliculas:listaHechosParaTi),
      listHorizontalCards(titulo:"Verano 2021",listPeliculas:listaEscuchadosRecientes),
    ];

    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomCenter,stops: [0.0,0.4],colors: [colorDegradado.withOpacity(0.1),colorFondo])),
        
      child: Column(
        children: [
          Expanded(child: ListView(children: list)),
          bottomNavigationBar(context: context),
        ],
      ),
    );
  }
  // WIDGETS COMPONENTS
  Widget listGridButtons(){

    return Container(
      color: Colors.transparent,
      padding:EdgeInsets.only(top: 12.0),
      width: screenSize.width,
      child:Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment:CrossAxisAlignment.start ,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom:12.0,top:0.0,left: 12.0,right: 12.0),
            child: Row(
              children: [
                Text("Buenas noches",style: TextStyle(fontSize: 24.0,fontWeight:FontWeight.bold,color: Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black45),),
                Expanded(child: Container()),
                WidgetsUtilsApp().buttonThemeBrightness(context: context),
              ],
            ),
          ),
          Row(mainAxisSize:MainAxisSize.max ,children: [ButtonItem(texto: "Tus Me Gusta",iconData: Icons.favorite,colorDegradado: colorDegradado),ButtonItem(texto: "Entiende Tu Mente",uri:"https://images.transistor.fm/file/transistor/images/show/10689/full_1589388813-artwork.jpg")],),
          Row(mainAxisSize:MainAxisSize.max ,children: [ButtonItem(texto: "Radar De Novedades",iconData:Icons.whatshot,colorDegradado:Colors.orange),ButtonItem(texto: "Descubrimiento Semanal",colorDegradado: Colors.blue)],),
          Row(mainAxisSize:MainAxisSize.max ,children: [ButtonItem(texto: "Perreo Intenso",uri:"https://www.listenspotify.com/uploaded_files/Thf_1599238496.jpg"),ButtonItem(texto: "Bolichero 2021",uri:"https://elsol-compress.s3-accelerate.amazonaws.com/imagenes/001/178/086/001178086.jpg")],),
        ],
      ),
    );
  }
  Widget listHorizontalCards({ required String titulo, required List listPeliculas,double height =200.0}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0,top:20.0,left: 12.0,right: 12.0),
          child:Text(titulo,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold)),
        ),
        Container(
          width:double.infinity,
          height: height,
          child: ListView.builder(
            scrollDirection:Axis.horizontal,
            itemCount:listPeliculas.length,
            itemBuilder: (context, index) => cardItemPelicula(context: context,height: height,url:listPeliculas[index]["url"],titulo: listPeliculas[index]["titulo"],iconData: listPeliculas[index]["iconData"]),
          ),
        ),
      ],
    );
  }
  Widget listHorizontalCardsGrande({ required String titulo, required List listPeliculas}){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 12.0,top:20.0,left: 12.0,right: 12.0),
          child:Text(titulo,style: TextStyle(fontSize: 25.0,fontWeight: FontWeight.bold)),
        ),
        Container(
          width:double.infinity,height: 200.0,
          child: ListView.builder(
            scrollDirection:Axis.horizontal,
            itemCount:listPeliculas.length,
            itemBuilder: (context, index) => cardGrandeItemPelicula(url:listPeliculas[index]["url"]),
          ),
        ),
      ],
    );
  }


  /// WIDGETS COMPONENTS
  Widget cardItemPelicula({required BuildContext context,String url="",IconData ?iconData,String titulo="",String descripcion="",required double height}){
    double sizeText = 14;
    height= height - (sizeText*2+20);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Card(
          margin:const EdgeInsets.all(3.0),
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
          child: InkWell(
            child: Container(
              decoration:BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,stops: [0.0,0.5,0.9],colors: [colorDegradado.withOpacity(0.9),colorDegradado.withOpacity(0.5),colorDegradado.withOpacity(0.1)])),
              height: height,width: height,
              child: url!=""?CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl:url,placeholder: (context, urlImage) => Container(color: Colors.grey),errorWidget: (context, urlImage, error) => Center(child: Icon(iconData??Icons.music_note,size: 50.0,color:Colors.white))):Center(child: Icon(iconData,size: 50.0,color:Theme.of(context).brightness==Brightness.dark?Colors.grey[300]:Colors.grey[200])),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(3.0),
          child: Container(width: height,child: Text(titulo,textAlign:TextAlign.start,style:TextStyle(fontWeight:FontWeight.bold,fontSize:sizeText,color: Theme.of(context).brightness==Brightness.dark?Colors.grey[400]:Colors.black87))),
        ),
        descripcion==""?Container():Text(descripcion,textAlign:TextAlign.start,style:TextStyle(color:Colors.grey[900])),
      ],
    );
  }
  Widget cardGrandeItemPelicula({ required String url,IconData iconData=Icons.music_note}){
    return Card(
      margin:const EdgeInsets.all(3.0),
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      child: Container(decoration:BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,stops: [0.0,0.5,0.9],colors: [colorDegradado.withOpacity(0.9),colorDegradado.withOpacity(0.5),colorDegradado.withOpacity(0.1)])),width: 200.0,height: 200.0,child: url!=""?CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl:url,placeholder: (context, urlImage) => Container(color: Colors.grey),errorWidget: (context, urlImage, error) => Center(child: Icon(iconData,size: 50.0,color:Colors.white)),):Center(child: Icon(iconData,size: 50.0,color:Colors.white))),
    );
  }
}


/// CLASS WIDGETS COMPONENTS
class ListTileMusic extends StatefulWidget {

  @override
  _ListTileMusicState createState() => _ListTileMusicState();
}
class _ListTileMusicState extends State<ListTileMusic> with SingleTickerProviderStateMixin {

  // var
  Map music = {
  "url_image":"https://images.genius.com/daefe8f0ca2d4c5a9915869f92139263.500x500x1.png",
  "fileName":"music-0.mp3",
  "color":Colors.orange,
  "name":"DILLOM - DUDADE",
  "author":"DILLOM",
  };
  Duration _duration = new Duration();
  Duration _position = new Duration();
  bool mg=false;
  late AudioPlayer player;
  AudioCache playerCache = AudioCache();
  late AnimationController _controller;

  void initPlayer() {
    player = AudioPlayer();
    player.onDurationChanged.listen((d) => setState(() {if(_duration.inSeconds.toDouble()==_position.inSeconds.toDouble()){player.stop();}_duration = d;}));
    player.onAudioPositionChanged.listen((p) => setState(() {_position = p;}));
    playerCache = AudioCache(fixedPlayer: player, prefix: 'assets/sound/');
    playerCache.play(music["fileName"], mode: PlayerMode.LOW_LATENCY,recordingActive: true,stayAwake: true); 
  }

  @override
  void initState() {
    initPlayer();
    _controller = AnimationController(vsync: this,duration: Duration( milliseconds: 500,),lowerBound: 0.0,upperBound: 0.1 )..addListener(() {setState(() {});});
    super.initState();
  }
  @override
  void dispose() {
    player.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
          tileColor: Theme.of(context).brightness==Brightness.dark?Colors.grey[900]:Colors.white,
          contentPadding: EdgeInsets.all(0.0),
          title: Text(music["name"]),
          leading: widgetImage(buildContext: context,urlImage: music["url_image"]),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              IconButton(icon: Icon(mg?Icons.favorite:Icons.favorite_border),onPressed: ()=>setState(() { mg=!mg;})),
              PlayButton(pauseIcon: Icon(Icons.pause, size: 30),playIcon: Icon(Icons.play_arrow, size: 30),onPressed: () {player.state!=PlayerState.PLAYING?player.resume():player.pause();setState(() {});},
        ),
            ],
          ),
        );
  }
  /// WIDGETS COMPONENTS
  Widget widgetImage({required String urlImage,required BuildContext buildContext}) {
    return AspectRatio(
      aspectRatio: 100 / 100,
      child: urlImage != "" ? CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl: urlImage,placeholder: (context, urlImage) => FadeInImage(fit: BoxFit.cover,image: AssetImage("assets/loading.gif"),placeholder: AssetImage("assets/loading.gif")),errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey))):Container(color: Colors.black26),
    );
  }
}
// button
class ButtonItem extends StatefulWidget {
  ButtonItem({this.uri="",required this.texto,this.colorDegradado=Colors.purple,this.iconData=Icons.music_note});
  final String uri;
  final String texto;
  final Color  colorDegradado;
  final IconData iconData;
  @override
  _ButtonItemState createState() => _ButtonItemState(texto:texto,colorDegradado: colorDegradado,iconData: iconData,uri: uri);
}
class _ButtonItemState extends State<ButtonItem> with SingleTickerProviderStateMixin {

  _ButtonItemState({this.uri="",required this.texto,this.colorDegradado=Colors.purple,this.iconData=Icons.music_note});

  // var
  String uri;String texto;Color  colorDegradado;IconData iconData;
  late double _scale;
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500,),lowerBound: 0.0,upperBound: 0.1,)..addListener(() {setState(() {});});
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: GestureDetector(
          onTapDown: _tapDown,onTapUp:_tapUp,onTap:(){},
          child: Transform.scale(scale: _scale,child: _animatedButton()),
        ),
      ),
    );
  }
  /// WIDGETS
  Widget  _animatedButton() {
    return ClipRRect(
      borderRadius: new BorderRadius.circular(5.0),
      child: Container(
        height: 55.0,
        color: Colors.grey[800]!.withOpacity(0.6),
        child: Row(
          children: [
            Container(
              decoration:BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,stops: [0.0,0.5,0.9],colors: [colorDegradado.withOpacity(0.9),colorDegradado.withOpacity(0.5),colorDegradado.withOpacity(0.1)])),
              height: 55.0,width: 55.0,
              child: uri!=""?CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl:uri,placeholder: (context, urlImage) => Container(color: Colors.grey),errorWidget: (context, urlImage, error) => Center(child: Icon(iconData,color:Colors.white))):Center(child: Icon(iconData,color:Colors.white)),
            ),
            Expanded(child: Padding(padding: const EdgeInsets.all(8.0),child: Text(texto,style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold),overflow:TextOverflow.ellipsis,maxLines:2)))
          ],
        ),
      ),
    );
  }
  /// FUNCTION
  void _tapDown(TapDownDetails details) =>  _controller.forward();
  void _tapUp(TapUpDetails details) =>  _controller.reverse();
}
//button animate
class PlayButton extends StatefulWidget {

  final bool initialIsPlaying;
  final Icon playIcon;
  final Icon pauseIcon;
  final VoidCallback onPressed;

  PlayButton({
    required this.onPressed,
    this.initialIsPlaying = false,
    this.playIcon = const Icon(Icons.play_arrow),
    this.pauseIcon = const Icon(Icons.pause),
  });

  @override
  _PlayButtonState createState() => _PlayButtonState();
}
class _PlayButtonState extends State<PlayButton> with TickerProviderStateMixin {
  
  // var
  static const _kToggleDuration = Duration(milliseconds: 300);
  static const _kRotationDuration = Duration(seconds: 5);
  bool isPlaying=false;
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  double rotation = 0;
  double scale = 0.85;

  void _updateRotation() => rotation = _rotationController.value * 2 * pi;
  void _updateScale() => scale = (_scaleController.value * 0.2) + 0.85;

  @override
  void initState() {
    isPlaying = widget.initialIsPlaying;
    _rotationController = AnimationController(vsync: this, duration: _kRotationDuration)..addListener(() => setState(_updateRotation))..repeat();
    _scaleController = AnimationController(vsync: this, duration: _kToggleDuration)..addListener(() => setState(_updateScale));

    super.initState();
  }

  void _onToggle() {
    setState(() => isPlaying = !isPlaying);

    if (_scaleController.isCompleted) {_scaleController.reverse();}
    else{_scaleController.forward();}
    widget.onPressed();
  }

  Widget _buildIcon(bool isPlaying) {
    return SizedBox.expand(
      key: ValueKey<bool>(isPlaying),
      child: IconButton(icon: isPlaying ? widget.pauseIcon : widget.playIcon,onPressed: _onToggle,),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 75.0,height: 75.0,
      child: Container(
        constraints: BoxConstraints.expand(),
        child: AnimatedSwitcher(child: _buildIcon(isPlaying),duration: _kToggleDuration),
      ),
    );
  }

  @override
  void dispose() {
    _scaleController.dispose();
    _rotationController.dispose();
    super.dispose();
  }
}