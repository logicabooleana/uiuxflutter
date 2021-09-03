
/// Copyright 2020 Logica Booleana Authors


// Dependencias
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' show pi;
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias 
import 'package:audioplayers/audioplayers.dart';
import 'package:cached_network_image/cached_network_image.dart';

// var
Map cancion = {
  "url_image":"https://images.genius.com/daefe8f0ca2d4c5a9915869f92139263.500x500x1.png",
  "fileName":"music-0.mp3",
  "color":Colors.orange,
  "name":"DILLOM - DUDADE",
  "author":"DILLOM",
};


class PageProfileSpotify extends StatefulWidget {
  @override
  _PageProfileSpotify createState() =>  _PageProfileSpotify();
}

class _PageProfileSpotify extends State<PageProfileSpotify> {

  // var
  Color colorFondo=Colors.black87;
  bool mgMusic = false;bool repeatMusic = false;
  Duration _duration = new Duration();
  Duration _position = new Duration();
  late AudioPlayer player;
  AudioCache playerCache = AudioCache();

  @override
  void initState() {
    initPlayer();
    super.initState();
  }

  @override
  void dispose() {
    player.dispose();
    super.dispose();
  }
  void initPlayer() {
    player = AudioPlayer();
    playerCache = AudioCache(fixedPlayer: player, prefix: 'assets/sound/');
    playerCache.play(cancion["fileName"]); player.stop();/* AutoPlay */
    player.onDurationChanged.listen((d) => setState(() {if(_duration.inSeconds.toDouble()==_position.inSeconds.toDouble()){player.stop();if(repeatMusic){player.resume();}}_duration = d;}));
    player.onAudioPositionChanged.listen((p) => setState(() {_position = p;}));
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: body(),
    );
  }
  Widget body(){
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topCenter,end: Alignment.bottomCenter,stops: [0.0,0.9,],colors: [cancion["color"].withOpacity(0.8),cancion["color"].withOpacity(0.3)])),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:48.0),
            child: Row(
              children: [
                IconButton(icon:Icon(Icons.keyboard_arrow_down,size:40.0,color:Colors.white),onPressed:(){}),
                Expanded(
                  child: Column(
                    children: [
                      Text('Reproduciendo desde tu biblioteca'.toUpperCase(),style:TextStyle(color:Colors.white,fontSize:12.0)),
                      Text('Tus Me Gustas',style:TextStyle(color:Colors.white,fontSize:16.0,fontWeight:FontWeight.bold)),
                    ],
                  ),
                ),
                IconButton(icon:Icon(Icons.settings,color: Colors.white),onPressed:(){}),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  /* Imagen de la musica */
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: widgetImage(buildContext: context,urlImage: cancion["url_image"]),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical: 5.0),
                        child: Column(
                          crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Column(
                                crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.start,
                                children: [
                                  Text(cancion["name"],textAlign:TextAlign.start,style:TextStyle(color: Colors.white,fontSize: 24.0,fontWeight:FontWeight.bold)),
                                  SizedBox(height:4.0,width: 4.0),
                                  Text(cancion["author"],textAlign:TextAlign.start,style:TextStyle(color: Colors.white54,fontSize: 16.0,fontWeight:FontWeight.bold)),
                                ],
                              ),
                            ),
                            slider(),
                            Row(
                              crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.spaceAround,
                              children: [
                                IconButton(icon:mgMusic?Icon(Icons.favorite,color:Colors.greenAccent[700],size:24.0):Icon(Icons.favorite_border,size:24.0,color:Colors.white),onPressed:(){setState(() {mgMusic=mgMusic?false:true;});}),
                                IconButton(icon:Icon(Icons.skip_previous,size:30.0,color:Colors.white),onPressed:(){if(player.state==PlayerState.PLAYING){player.stop();player.resume();}}),
                                PlayButton(
                                  pauseIcon: Icon(Icons.pause, color: Colors.black, size: 50),
                                  playIcon: Icon(Icons.play_arrow, color: Colors.black, size: 50),
                                  onPressed: () {player.state!=PlayerState.PLAYING?player.resume():player.pause();setState(() {});},
                                ),
                                IconButton(icon:Icon(Icons.skip_next,size:30.0,color:Colors.white),onPressed:(){if(player.state==PlayerState.PLAYING){player.stop();player.resume();}}),
                                IconButton(icon:Icon(Icons.autorenew,size:24.0,color:repeatMusic?Colors.greenAccent[700]:Colors.white),onPressed:(){setState(() {repeatMusic=repeatMusic?false:true;});}),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Center(child: Padding(padding: const EdgeInsets.only(bottom: 20.0,top: 40.0),child: Row(crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,children: [Padding(padding: const EdgeInsets.all(2.0),child: Icon(Icons.surround_sound,size:18.0,color: Colors.white)),Text("Calidad del audio: Básica",style: TextStyle(color: Colors.white,fontSize: 14.0))]))),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  /// WIDGETS COMPONENT
  Widget slider() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:0.0),
      child: Column(
        children: [
          Slider(
              inactiveColor: Colors.black54,
              activeColor:Colors.white,
              value: _position.inSeconds.toDouble(),
              min: 0.0,
              max: _duration.inSeconds.toDouble(),
              onChanged: (double second) {
                setState(() {
                  Duration newDuration = Duration(seconds: second.toInt());
                  player.seek(newDuration);
                  second = second;
                });
              }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              children: [
                Text(_position.inMinutes.toString()+":"+_position.inSeconds.toString(),style:TextStyle(color:Colors.white,fontSize: 12.0)),
                Expanded(child:Container()),
                Text(_duration.inMinutes.toString()+":"+_duration.inSeconds.toString(),style:TextStyle(color:Colors.white,fontSize: 12.0)),
              ],
            ),
          ),
        ],
      ),
    );
  }
  // Un widget imagen que intenta ajustar el tamaño del niño a una relación de aspecto específica
  Widget widgetImage({required String urlImage,required BuildContext buildContext}) {


    return AspectRatio(
      aspectRatio: 100 / 100,
      child: urlImage != ""
          ? CachedNetworkImage(
        fadeInDuration: Duration(milliseconds: 200),
        fit: BoxFit.cover,
        imageUrl: urlImage,
        placeholder: (context, urlImage) => FadeInImage(fit: BoxFit.cover,image: AssetImage("assets/loading.gif"),placeholder: AssetImage("assets/loading.gif")),
        errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey)),
      ):Container(color: Colors.black26),
    );
  }
}



/// ANIMATED BUTTON
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
  static const _kToggleDuration = Duration(milliseconds: 300);
  static const _kRotationDuration = Duration(seconds: 5);

  bool isPlaying=false;

  // animaciones de rotación y escala
  late AnimationController _rotationController;
  late AnimationController _scaleController;
  double _rotation = 0;
  double _scale = 0.85;

  bool get _showWaves => !_scaleController.isDismissed;

  void _updateRotation() => _rotation = _rotationController.value * 2 * pi;
  void _updateScale() => _scale = (_scaleController.value * 0.2) + 0.85;

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
      child: Stack(
        alignment: Alignment.center,
        children: [
          if (_showWaves) ...[
            Blob(color: cancion["color"][200].withOpacity(0.5), scale: _scale, rotation: _rotation),
            Blob(color: cancion["color"][700].withOpacity(0.5), scale: _scale, rotation: _rotation * 2 - 30),
            Blob(color: Colors.white, scale: _scale, rotation: _rotation * 3 - 45),
          ],
          Container(
            constraints: BoxConstraints.expand(),
            child: AnimatedSwitcher(child: _buildIcon(isPlaying),duration: _kToggleDuration),
            decoration: BoxDecoration(shape: BoxShape.circle,color: Colors.white),
          ),
        ],
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

class Blob extends StatelessWidget {
  final double rotation;
  final double scale;
  final Color color;

  const Blob({required this.color, this.rotation = 0, this.scale = 1});

  @override
  Widget build(BuildContext context) {

    return Transform.scale(
      scale: scale,
      child: Transform.rotate(
        angle: rotation,
        child: Container(
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.only(topLeft: Radius.circular(150),topRight: Radius.circular(240),bottomLeft: Radius.circular(220),bottomRight: Radius.circular(180)),
          ),
        ),
      ),
    );
  }
}

