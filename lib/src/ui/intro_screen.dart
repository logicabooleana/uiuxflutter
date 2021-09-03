import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desingapp/src/bloc/auth_cubit.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class IntroScreen extends StatefulWidget {
  static Widget create(BuildContext context) => IntroScreen();

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {

  /// var
  int page = 0; /* Posición de la página */
  bool enableSlideIcon =true; /* Controla el estado de la visibilidad de iconButton para deslizar la pantalla del lado izquierdo */
  bool isDarkGlobal = false; /* Controla el brillo de la barra de estado */

    
  @override
  Widget build(BuildContext context) {
    return scaffold();
  }

  Widget scaffold() {
    return Scaffold(
      body: LiquidSwipe(
        initialPage: 0,
        fullTransitionValue: 500,
        enableSideReveal: false,
        /* Pase su método como devolución de llamada, devolverá un número de página. */
        waveType:WaveType.liquidReveal,
        /* Se usa para habilitar el ícono de diapositiva a la derecha de dónde se originaría la onda */
        enableLoop: true,
        /* Habilitar o deshabilitar la recurrencia de páginas. */
        positionSlideIcon: 0.7,
        /* Coloque su icono en el eje y en el lado derecho de la pantalla */
        slideIconWidget: Icon(Icons.arrow_back_ios,color: isDarkGlobal ? Colors.black : Colors.white),
        pages: [
          componente(
              colorGradient0: Colors.deepPurple,
              colorGradient1: Colors.purple,
              iconData: Icons.style,
              texto: "UIUX",
              descripcion:"Inspirate en diseños de interfaces y experiencias de usuarios populares recreados con Flutter el kit de desarrollo de software",
              brightness: Brightness.light),
          Stack(
            children: [
              imageFondo(),
              componente(
              colorGradient0: Colors.transparent,
              iconData: Icons.code,
              texto: "Código fuente",
              descripcion:"Eche un vistazo al código fuente y vea cómo se reconstruyó",
              brightness: Brightness.light),
            ],
          ),
        
        ],
        /* Establecer las páginas / vistas / contenedores */
        onPageChangeCallback: onPageChangeCallback,
      ),
    );
  }
 
  Widget componente(
      {
        required IconData iconData,
        required String texto,
        required String descripcion,
        required Color colorGradient0,
        Color ?colorGradient1,
        Brightness brightness = Brightness.light
      }) {
    Color colorPrimary =  brightness != Brightness.light ? Colors.black : Colors.white;
    
    return Container(
      decoration: BoxDecoration(gradient: LinearGradient(begin: Alignment.topLeft,end: Alignment.bottomRight,colors: [colorGradient0, colorGradient1??colorGradient0])),
      padding: EdgeInsets.symmetric(horizontal: 30.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Flexible(
            flex: 3,
            child: Container(
              color: Colors.transparent,
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(iconData, size: 100.0, color: colorPrimary),
                        SizedBox(height: 50.0),
                        Text(texto,style:TextStyle(fontSize: 30.0, color: colorPrimary,fontWeight:FontWeight.bold),textAlign: TextAlign.center),
                        SizedBox(height: 12.0),
                        descripcion != "" ? Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20.0),
                          child: Text(descripcion,style: TextStyle(fontSize: 16.0,color: colorPrimary,),textAlign: TextAlign.center),
                        ): Container(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          _ButtonLoginIn(color:Colors.deepPurple),
          Flexible(
            flex: 1,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Lógica Booleana",style: TextStyle(fontSize: 14.0, color: colorPrimary)),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget imageFondo(){
    return SizedBox(
      height: double.infinity,width: double.infinity,
      child: Image(image: AssetImage('assets/images/image_code_blur.jpg'),fit:BoxFit.cover),
    );
  }

  onPageChangeCallback(int lpage) {
    setState(
      // Controla el estado de la visibilidad de iconButton para deslizar la pantalla del lado izquierdo
            () {
          page = lpage;
          if (2 == page) {
            /* Esconde el iconButton de desplazamiento */
            enableSlideIcon = false;
            /* Aplicar color oscuro al iconButton de deslizamiento */
            isDarkGlobal = true;
          } else {
            /* Muestra el iconButton de desplazamiento */
            enableSlideIcon = true;
            /* Por default aplica el brillo al iconButton */
            isDarkGlobal = false;
          }
        });
  }
}

// ignore: must_be_immutable
class _ButtonLoginIn extends StatelessWidget {
  
  late Color color;
  _ButtonLoginIn({required this.color});

  @override
  Widget build(BuildContext context) {

    final authCubit = context.watch<AuthCubit>();
    final isSigningIn = authCubit.state is AuthSigningIn;

    return Column(
      children: [
        if (isSigningIn) CircularProgressIndicator(),
        isSigningIn
        ?Container()
        :ElevatedButton(
          style: ButtonStyle(
            backgroundColor:MaterialStateProperty.all(color),
            padding: MaterialStateProperty.all(EdgeInsets.all(20.0)),
            ),
          autofocus: isSigningIn,
          onPressed: () => authCubit.signInWithGoogle(),
          child: Text('Inicia sesión con Google',style: TextStyle(fontSize: 16.0),),
          ),
      ],
    );
  }
}

