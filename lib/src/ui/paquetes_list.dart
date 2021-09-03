import 'package:desingapp/src/utils/utils.dart';
import 'package:desingapp/src/utils/widgets/widgets_ListTile.dart';
import 'package:flutter/material.dart';


class AppPackages extends StatelessWidget {
  const AppPackages({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    List<dynamic> listaBalues = [
      {
        "title":"liquid_swipe",
        "subtitle":"Efecto de deslizamiento líquido en los contenedores provistos.",
        "http":"https://pub.dev/packages/liquid_swipe",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"smooth_page_indicator",
        "subtitle":"Indicador de página animada personalizable con un conjunto de efectos incorporados.",
        "http":"https://pub.dev/packages/smooth_page_indicator",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"flutter_launcher_icons",
        "subtitle":"Un paquete que simplifica la tarea de actualizar el ícono de inicio de su aplicación Flutter.",
        "http":"https://pub.dev/packages/flutter_launcher_icons",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"url_launcher",
        "subtitle":"Flutter plugin para lanzar una URL en Android e iOS. Admite esquemas de web, teléfono, SMS y correo electrónico.",
        "http":"https://pub.dev/packages/url_launcher",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"animate_do",
        "subtitle":"Hermosas animaciones inspiradas en Animate.css, cada animación es un widget que contiene valores predeterminados pero personalizables que se ven atractivos.",
        "http":"https://pub.dev/packages/animate_do",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"shared_preferences",
        "subtitle":"leer y escribir pares simples de clave-valor. Envuelve NSUserDefaults en iOS y SharedPreferences en Android.",
        "http":"https://pub.dev/packages/shared_preferences",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"google_fonts",
        "subtitle":"Un paquete para incluir fuentes de fonts.google.com en su aplicación Flutter.",
        "http":"https://pub.dev/packages/google_fonts",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"font_awesome_flutter",
        "subtitle":"El paquete Font Awesome Icon disponible como Flutter Icons. Proporciona 1500 iconos adicionales para usar en sus aplicaciones.",
        "http":"https://pub.dev/packages/font_awesome_flutter",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"lottie",
        "subtitle":"Render animaciones de After Effects de forma nativa en Flutter. Este paquete es una implementación pura de Dart de un jugador Lottie.",
        "http":"https://pub.dev/packages/lottie",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"dashed_circle",
        "subtitle":"Un paquete de aleteo para dibujar círculos punteados. También se puede usar con CustomPaint.",
        "http":"https://pub.dev/packages/dashed_circle",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"syntax_highlighter",
        "subtitle":"resaltador de sintaxis para mostrar su código en la aplicación",
        "http":"https://pub.dev/packages/syntax_highlighter",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"animated_floatactionbuttons",
        "subtitle":"Este paquete se basa en el tutorial de Agung Surya",
        "http":"https://pub.dev/packages/animated_floatactionbuttons",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"firebase_admob",
        "subtitle":"Un complemento para Flutter que admite cargar y mostrar pancartas, anuncios intersticiales (pantalla completa) y anuncios de video premiados",
        "http":"https://pub.dev/packages/firebase_admob",
        "codeFilePath":"",
        "nameActivity":"",
        "route":"",
      },
      {
        "title":"frefresh",
        "subtitle":"Le ayuda a construir la actualización desplegable y la carga desplegable de la manera más simple.",
        "http":"https://pub.dev/packages/frefresh",
      },
      {
        "title":"permission_handler",
        "subtitle":" Solicitar permisos y verificar su estado. También puede abrir la configuración de la aplicación del dispositivo para que los usuarios puedan otorgar un permiso.",
        "http":"https://pub.dev/packages/permission_handler",
      },
      {
        "title":"ext_storage",
        "subtitle":"Un complemento de flutter mínimo que proporciona una ruta de almacenamiento externo y una ruta de almacenamiento público externo.",
        "http":"https://pub.dev/packages/ext_storage",
      },
      {
        "title":"path_provider",
        "subtitle":"Un complemento de Flutter para encontrar ubicaciones de uso común en el sistema de archivos. ",
        "http":"https://pub.dev/packages/path_provider",
      },
      {
        "title":"curved_navigation_bar",
        "subtitle":"implementación de la barra de navegación curva.",
        "http":"https://pub.dev/packages/curved_navigation_bar",
      },
      {
        "title":"carousel_slider",
        "subtitle":"Un widget de control deslizante de carrusel.",
        "http":"https://pub.dev/packages/carousel_slider",
      },
      {
        "title":"audioplayers",
        "subtitle":"Un complemento de Flutter para reproducir múltiples archivos de audio simultáneamente, funciona para Android, iOS, macOS y web.",
        "http":"https://pub.dev/packages/audioplayers",
      },
      {
        "title":"carousel_slider",
        "subtitle":"Un widget de control deslizante de carrusel.",
        "http":"https://pub.dev/packages/carousel_slider",
      },
      {
        "title":"neon",
        "subtitle":"permite usar hermosos letreros de neón en tu aplicación",
        "http":"https://pub.dev/packages/neon",
      },
      {
        "title":"avatar_glow",
        "subtitle":"Este paquete Flutter proporciona un widget Avatar Glow con una animación brillante de fondo.",
        "http":"https://pub.dev/packages/avatar_glow",
      }, 
      {
        "title":"chewie",
        "subtitle":"El video_playercomplemento proporciona acceso de bajo nivel a la reproducción de video.",
        "http":"https://pub.dev/packages/chewie",
      },
      {
        "title":"permission_handler",
        "subtitle":"En la mayoría de los sistemas operativos, los permisos no solo se otorgan a las aplicaciones en el momento de la instalación. Más bien, los desarrolladores deben solicitar permisos al usuario mientras se ejecuta la aplicación.",
        "http":"https://pub.dev/packages/permission_handler",
      },
      /* {
        "title":"",
        "subtitle":"",
        "http":"",
      }, */
    ];

    return Scaffold(
      appBar: AppBar( title: Text("Paquetes")),
      body: ListView.builder(
        itemCount:listaBalues.length ,
        itemBuilder: (buildContext,index){
          return WidgetListTile(
            context: context,
            title: listaBalues[index]["title"],
            subtitle: listaBalues[index]["subtitle"],
            http: listaBalues[index]["http"],
          );
            
        }
      ),
        
    );
  }
}


class WidgetListTile extends StatelessWidget {

  String title;
  String subtitle;
  BuildContext context;
  String http;
  
  WidgetListTile({
    required this.context,
    required this.title,
    this.subtitle="",
    this.http="",
  });

  @override
  Widget build(BuildContext buildContext) {
    return getListTile();
  }
  Widget getListTile() {

    return Column(
      children: [
        ListTile(
          contentPadding: EdgeInsets.symmetric(horizontal: 12.0,vertical: 8.0),
          onTap: () => launchURL(context,http),
          dense: false,
          title: Text(title),
          subtitle: subtitle!=""?Text(subtitle):Container(),
        ),
        Divider(height: 0.0,thickness: 1.0,),
      ],
    );
  }
  


}
