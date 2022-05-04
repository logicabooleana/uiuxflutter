import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:desingapp/src/utils/utils.dart';


/* CREA UNA LISTA DE COLORES */
List<Color> colores = [
      Colors.amber,
      Colors.blue,
      Colors.blueGrey,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.indigo,
      Colors.red,
      Colors.lime,
      Colors.pink,

      Colors.amber,
      Colors.blue,
      Colors.blueGrey,
      Colors.brown,
      Colors.cyan,
      Colors.deepOrange,
      Colors.deepPurple,
      Colors.green,
      Colors.grey,
      Colors.indigo,
      Colors.red,
      Colors.lime,
      Colors.pink,
      
];

///
/// Crea un mapa de los valores de los tabs y items ///
/// 
const double  iSizeIcon=30.0;
Map categoryIntroduction={
      'tab_title': "Introducción", 
      'description':"La incorporación es una experiencia virtual de unboxing que ayuda a los usuarios a comenzar con una aplicación",
      'color': Colors.blue,
      'items': [
        {
          'title': "Brubank", 
          'subtitle':"Banca movíl",
          'icon': Icon(Icons.atm,size: iSizeIcon,color: getRandomColor() ), 
          'color': Colors.deepPurple, 
          'rute': "onboarding_bank", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/introduccion/page_onboarding_bank.dart", 
          'url':'',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Vertical", 
          'subtitle':"",
          'icon': Icon(Icons.calendar_view_day,size: iSizeIcon,color: getRandomColor() ), 
          'color': Colors.red[300], 
          'rute': "onboarding_1", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/introduccion/page_onboarding_vertical.dart", 
          'url':'',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Liquid paisajes", 
          'subtitle':"",
          'icon': Icon(Icons.view_array,size:iSizeIcon,color: getRandomColor() ),  
          'color': Colors.red[300], 
          'rute': "onboarding_4", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/introduccion/page_onboarding_liquid.dart", 
          'nameActivity': "Codigo fuente", 
          'url':'',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
      ], 
    };
  Map categoryLogin={
      'tab_title': "iniciar sesión", 
      'description':'Para garantizar que la experiencia de un usuarios sea perfecta desde el principio, el diseño de las pantallas de inicio de sesión y registro debe ser lo más intuitivas posible',
      'color': Colors.purple,
      'items': [
        {
          'title': "Motel", 
          'subtitle':"",
          'icon': Stack(
            children: [
              Padding(padding: const EdgeInsets.only(top: 3),child: Icon(Icons.favorite,color: Colors.red[300],)),
              Padding(padding: const EdgeInsets.only(left: 5, bottom: 5),child: Icon(Icons.favorite, color: Colors.red)),
            ],
          ), 
          'color': Colors.red[300], 
          'rute': "Page_login_hotel",
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_hotel.dart", 
          'url':'https://i0.wp.com/www.saavedraonline.com.ar/wp-content/uploads/2015/10/albergue-puraciudad.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
        {
          'title': "GameCores", 
          'subtitle':"",
          'icon': Icon(Icons.gamepad,size: iSizeIcon,color: getRandomColor() ), 
          'color': Colors.purple[300], 
          'rute': "Page_login_game",
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_game.dart", 
          'url':'https://d2skuhm0vrry40.cloudfront.net/2018/articles/2018-04-25-08-32/-1524641527902.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
        {
          'title': "BruBank", 
          'subtitle':"Banca móvil",
          'icon':Icon(Icons.atm, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.deepPurple, 
          'rute': "Page_login_bank",
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_bank.dart",  
          'url':'https://resizer.iproimg.com/unsafe/1200x/https://assets.iproup.com/assets/jpg/2019/01/1761.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Spotify", 
          'subtitle':"Plataforma de musica por striming",
          'icon':FaIcon(FontAwesomeIcons.spotify, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.greenAccent[400], 
          'rute': "Page_login_spotify",
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_spotify.dart", 
          'url':'https://cdn.mos.cms.futurecdn.net/oXvf32gpXe5XHoKs6mjWnk.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Pedido Ya", 
          'subtitle':"",
          'icon':FaIcon(Icons.fastfood, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.red[300], 
          'rute': "page_login_pedidoya", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_pedidoya.dart", 
          'url':'https://www.lt8.com.ar/wp-content/uploads/2020/09/239bbd1bf8021af433fbbb43378ed355.jpg',
          'nuevo':false ,'actualizado':false ,
          },
          {
          'title': "Snapchat", 
          'subtitle':"",
          'icon':FaIcon(FontAwesomeIcons.snapchat, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_login_snapchat", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_snapchat.dart", 
          'nameActivity': "Login Snapchat",
          'url':'https://cdn.trangcongnghe.com/uploads/posts/2016-06/day_03/thu-thuat_5-cach-don-gian-khac-phuc-loi-snapchat-khong-hoi-dap-tren-iphone_1.jpeg',
          'nuevo':false ,'actualizado':false ,
          },
          {
          'title': "Mercado libre", 
          'subtitle':"",
          'icon':FaIcon(Icons.shopping_basket, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.yellow[300], 
          'rute': "page_login_mercadolibre", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_mercadolibre.dart", 
          'nameActivity': "Login Mercado Libre",
          'url':'https://s3.amazonaws.com/w3-cache.content-blog/wp-content/uploads/2017/12/15102434/1200x630-banner-mas-vendidos-640x336.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Netflix", 
          'subtitle':"",
          'icon':FaIcon(FontAwesomeIcons.neos, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_login_netflix", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_netflix.dart", 
          'nameActivity': "Login Netflix", 
          'url':'https://elandroidelibre.elespanol.com/wp-content/uploads/2019/10/Netflix-en-Mate-30-Pro.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Sistema solar", 
          'subtitle':"",
          'icon': Icon(Icons.wb_sunny,size: iSizeIcon,color: getRandomColor() ), 
          'color': Colors.lightBlue[300], 
          'rute': "page_login_SistemaSolar",
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_SistemaSolar.dart", 
          'nameActivity': "Autenticación", 
          'url':'https://cdn.dribbble.com/users/1235373/screenshots/3429206/galaxy_m4dian-01-02.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
          {
          'title': "Instragram", 
          'subtitle':"",
          'icon':FaIcon(FontAwesomeIcons.instagram, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_login_instragram", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_instagram.dart", 
          'nameActivity': "Login Instagram", 
          'url':'',
          'nuevo':false ,'actualizado':false ,
          },
          {
          'title': "Facebook", 
          'subtitle':"",
          'icon':FaIcon(FontAwesomeIcons.facebook, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_login_facebook", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_facebook.dart", 
          'nameActivity': "Login Facebook", 
          'url':'',
          'nuevo':false ,'actualizado':false ,
          },
          {
          'title': "Twitter", 
          'subtitle':"",
          'icon':FaIcon(FontAwesomeIcons.twitter, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_login_twitter",
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_twitter.dart", 
          'nameActivity': "Login Twitter",
          'url':'',
          'nuevo':false ,  'actualizado':false ,
          },
          {
          'title': "Dribbbble", 
          'subtitle':"",
          'icon':FaIcon(FontAwesomeIcons.dribbble, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_login_dribbbble", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_dribbbble.dart", 
          'nameActivity': "Login Dribbbble", 
          'url':'',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
          {
          'title': "Guía Argentina", 
          'subtitle':"",
          'icon': Text("AR",style: TextStyle(color: getRandomColor())),
          'color': Colors.purple[300], 
          'rute': "page_login_guideAr", 
          'codeFilePath': "lib/src/ui/pages/page_inicio/login/page_login_guideAr.dart", 
          'nameActivity': "Bienvenida",
          'url':'https://i.pinimg.com/originals/ce/20/60/ce2060b810920fbd847cc4997ce877c6.jpg',
          'nuevo':false , 'actualizado':false ,
          },
          
      ], 
    };
  Map categoryMainSceem={
      'tab_title': "Pantalla principal", 
      'description':'La pantalla principal es donde se enfocan el contenido y las opciones que queremos que el usuario conozca. Se elijen diseños que sean visualmente atractivos y apropiados para los tipos de datos y el tamaño de la pantalla',
      'color': Colors.red,
      'items': [
        {
          'title': "Facebook", 
          'subtitle':"",
          'icon': Icon(Icons.facebook,size:iSizeIcon,color: getRandomColor() ), 
          'color': Colors.blue, 
          'rute': "page_home_facebook", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_home_facebook.dart", 
          'nameActivity': "Facebook", 
          'url':'https://www.amatic.com.ec/wp-content/uploads/2017/01/azul-hd-papel-pintado-textura-fondos-para-el-415649.jpg',
          'nuevo':true ,'actualizado':false ,
          },
        {
          'title': "Telegram", 
          'subtitle':"",
          'icon': Icon(Icons.telegram_rounded,size:iSizeIcon,color: getRandomColor() ), 
          'color': Colors.lightBlue[300], 
          'rute': "Page_list_telegram", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_list_telegram.dart", 
          'nameActivity': "Telegram", 
          'url':'https://i.pinimg.com/originals/20/99/f2/2099f2dda704cb708fe20347afb964ba.jpg',
          'nuevo':false ,'actualizado':true ,
          },
        {
          'title': "Motel", 
          'subtitle':"",
          'icon': Stack(
            children: [
              Padding(padding: const EdgeInsets.only(top: 3),child: Icon(Icons.favorite,color: Colors.red[300],)),
              Padding(padding: const EdgeInsets.only(left: 5, bottom: 5),child: Icon(Icons.favorite, color: Colors.red)),
            ],
          ),
          'color': Colors.red, 
          'rute': "page_mainScreen_boutique", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_mainScreen_hote.dart", 
          'url':'https://i0.wp.com/www.saavedraonline.com.ar/wp-content/uploads/2015/10/albergue-puraciudad.jpg',
          'nuevo':false ,'actualizado':true ,
          },
        {
          'title': "Boutique", 
          'subtitle':"",
          'icon':Icon(Icons.shopping_bag_outlined, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.blue, 
          'rute': "page_lista_boutique", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_list_boutique.dart", 
          'url':'https://img.huffingtonpost.com/asset/58b5974129000024000c3a3a.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Guía Argentina", 
          'subtitle':"",
          'icon':Text("AR",style: TextStyle(color: getRandomColor())),
          'color': Colors.blue, 
          'rute': "Page_lista_guideAr", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_list_guideAr.dart", 
          'url':'https://cdnuploads.aa.com.tr/uploads/Contents/2019/07/29/thumbs_b_c_ce532ee4ac257cc2b93fc0e387ffa5ee.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Brubank", 
          'subtitle':"",
          'icon':Icon(Icons.atm, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.deepPurple, 
          'rute': "Page_lista_bank", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_bank.dart", 
          'url':'https://i.ytimg.com/vi/dKYPM1oi3KE/maxresdefault.jpg',
          'nuevo':false ,'actualizado':true ,
          },
        {
          'title': "Spotify", 
          'subtitle':"",
          'icon':FaIcon(FontAwesomeIcons.spotify, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.green, 
          'rute': "Page_lista_spotify", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_spotify.dart", 
          'url':'https://media.pasionmovil.com/2021/03/spotify-ios-android-home-screen-update.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
        {
          'title': "GameCores", 
          'subtitle':"",
          'icon':Icon(Icons.games, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "Page_lista_gamer", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_gamer.dart", 
          'url':'https://d2ofqe7l47306o.cloudfront.net/games/1920x1080/days-gone-artwork-road.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
        {
          'title': "Netflix ", 
          'subtitle':"",
          'icon':FaIcon(FontAwesomeIcons.neos, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "Page_lista_netflix", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_netflix.dart", 
          'url':'https://icdn7.digitaltrends.com/image/digitaltrends/imag1125-4032x3024.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Mercado libre", 
          'subtitle':"",
          'icon': FaIcon(Icons.shopping_basket, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.lime[300], 
          'rute': "Page_lista_mercadolibre", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_mercadolibre.dart", 
          'nameActivity': "Mercado libre", 
          'url':'https://s3.amazonaws.com/w3-cache.content-blog/wp-content/uploads/2017/12/15102434/1200x630-banner-mas-vendidos-640x336.jpg',
          'nuevo':false ,'actualizado':false ,
          },  
        {
          'title': "Pedido Ya", 
          'subtitle':"",
          'icon': FaIcon(Icons.fastfood, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.lime[300], 
          'rute': "Page_lista_pedidoYa", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_pedidoYa.dart", 
          'nameActivity': "Pedido Ya", 
          'url':'https://resizer.iproimg.com/unsafe/880x/https://assets.iproup.com/assets/jpg/2019/11/6774.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          }, 
        {
          'title': "Instagram", 
          'subtitle':"",
          'icon': FaIcon(FontAwesomeIcons.instagram, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.lime[300], 
          'rute': "Page_lista_instagram", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_instagram.dart", 
          'nameActivity': "inicio Instagram",
          'url':'https://www.trecebits.com/wp-content/uploads/2019/03/Instagram-down.jpg', 
          'nuevo':false ,'actualizado':false,
          },  
        {
          'title': "Sistema solar", 
          'subtitle':"",
          'icon': FaIcon(Icons.wb_sunny, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.lime[300], 
          'rute': "Page_lista_planetas", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_planetas.dart", 
          'nameActivity': "Sistema Solar", 
          'url':'https://i.pinimg.com/736x/e3/01/0c/e3010c174f8b0d7d70e83ee1fb2d7e9b.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
        {
          'title': "contactos", 
          'subtitle':"",
          'icon': Icon(Icons.perm_contact_calendar,size:iSizeIcon,color: getRandomColor() ), 
          'color': Colors.lightBlue[300], 
          'rute': "Page_lista_contact", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_contact.dart", 
          'nameActivity': "Contactos", 
          'url':'',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Samsung ajustes", 
          'subtitle':"",
          'icon': Icon(Icons.settings,size:iSizeIcon,color: getRandomColor() ), 
          'color': Colors.lime[300], 
          'rute': "Page_lista_ajustes", 
          'codeFilePath': "lib/src/ui/pages/pages_list/page_lista_ajustes.dart", 
          'nameActivity': "Samsung contactos", 
          'nuevo':false ,'actualizado':false ,
          },
      ], 
    };
  Map categoryProfile={
      'tab_title': "Perfiles", 
      'description':'Diseños de perfiles, estas pantallas se utilizan para conocer más o interactuar con un producto, persona o lugar, etc ... aquí mostramos toda la información completa y opciones al usuario',
      'color': Colors.orange,
      'items': [
        {
          'title': "Boutique", 
          'subtitle':"",
          'icon': Icon(Icons.shopping_bag_outlined,size:iSizeIcon,color: getRandomColor() ), 
          'color': Colors.cyan[300], 
          'rute': "page_profile_boutique", 
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_boutique.dart", 
          'url':'https://www.wallpapersandborders.co.uk/ekmps/shops/paperpalace/images/clarence-wallpaper-cr-3106-or-cr3106-by-grandeco-boutique-76250-1-p.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Guia Argentina", 
          'subtitle':"",
          'icon': Text("AR",style: TextStyle(color: getRandomColor())),
          'color': Colors.blue[300], 
          'rute': "page_profile_guideAr", 
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_guideAr.dart", 
          'url':'https://mapio.net/images-p/1172789.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Brubank", 
          'subtitle':"Banca movíl",
          'icon':Icon(Icons.atm, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.deepPurple, 
          'rute': "page_profile_bank",
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_bank.dart",
          'url':'https://www.ebankingnews.com/wp-content/uploads/2020/02/Brubank.jpg',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Spotify", 
          'subtitle':"play",
          'icon':FaIcon(FontAwesomeIcons.spotify, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.green, 
          'rute': "page_profile_spotify",
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_spotify.dart",
          'url':'https://icdn2.digitaltrends.com/image/digitaltrends/spotify-ipo-lifestyle.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
        {
          'title': "Netflix ", 
          'subtitle':"Información de la pelicula",
          'icon':FaIcon(FontAwesomeIcons.neos, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.red[300], 
          'rute': "page_profile_netflix", 
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_netflix.dart", 
          'nameActivity': "Perfil de la pelicula", 
          'url':'https://www.imore.com/sites/imore.com/files/styles/xlarge_wm_brw/public/field/image/2018/05/netflix-5-23-iphone-x-hero.jpg',
          'nuevo':false ,'actualizado':false ,
          }, 
        {
          'title': "Pedido Ya", 
          'subtitle':"Información y productos de la tienda",
          'icon': FaIcon(Icons.fastfood, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_profile_pedidoYa", 
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_pedidoYa.dart",
          'url':'https://chefandhotel.cl/images/ediciones/2017_10/pedidosya/PedidosYa-PRINCIPAL-INTERIOR.jpg',
          'nuevo':false ,'actualizado':false ,'animated':true ,
          },
          {
          'title': "Mercado libre", 
          'subtitle':"Información Producto",
          'icon': FaIcon(Icons.shopping_basket, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_profile_productoMercadoLibre", 
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_productoMercadoLibre.dart", 
          'nameActivity': "Información Producto",
          'url':'https://s3.amazonaws.com/w3-cache.content-blog/wp-content/uploads/2017/12/15102434/1200x630-banner-mas-vendidos-640x336.jpg',
          'nuevo':false ,'actualizado':false ,
          },
          {
          'title': "Instagram", 
          'subtitle':"Perfil de usuario",
          'icon': FaIcon(FontAwesomeIcons.instagram, size: iSizeIcon,color: getRandomColor()),
          'color': Colors.purple[300], 
          'rute': "page_profile_instagram", 
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_instagram.dart",
          'url':'',
          'nuevo':false ,'actualizado':false ,
          },
        {
          'title': "Seguir", 
          'subtitle':"",
          'icon': Icon(Icons.account_circle,size:iSizeIcon,color: getRandomColor() ), 
          'color': Colors.purple[300], 
          'rute': "page_profile_2", 
          'codeFilePath': "lib/src/ui/pages/pages_profile/page_profile_2.dart",
          'url':'',
          'nuevo':false ,'actualizado':false ,
          },
      ], 
    };



  // LISTA DE NOMBRES // 
  const List lista_contacto = [
      "Gimena Balcarce",
      "Mario Gutierrez",
      "Iván Lopez",
      "Juana Silvera",
      "ALberto Alonso",
      "Carolina Maldonado",
      "Jimena Silensi",
      "Leonardo Lopez",
      "Maria Alonso",
      "Kiara Ditomassi",
      "Juan Baez",
      "Gimena Balcarce",
      "Mario Gutierrez",
      "Iván Lopez",
      "Juana Silvera",
      "ALberto Alonso",
      "Carolina Maldonado",
      "Jimena Silensi",
      "Leonardo Lopez",
      "Maria Alonso",
      "Kiara Ditomassi",
      "Juan Baez",
    ];


// LISTAS DE perfiles de usaurios falsos // 
  const  List listaPersonas = [
    {
      "nombre": "Lucas ivan",
      "usuario": "aiivan3434",
      "vista": false,
      "url_foto_perfil":"https://ichef.bbci.co.uk/news/640/cpsprodpb/153EB/production/_105191078_selfie1.jpg",
      "dashes": 1,
    },
    {
      "nombre": "Leonel Messi",
      "usuario": "leomessi10",
      "vista": false,
      "url_foto_perfil":
          "https://pbs.twimg.com/media/B338156CIAAABM_.jpg",
      "dashes": 14,
    },
    {
      "nombre": "Leonela Ibañes",
      "usuario": "leonela21324",
      "vista": false,
      "url_foto_perfil":
          "https://i.pinimg.com/originals/e7/81/fa/e781fa284fd4444a512c5160d4030a7a.png",
      "dashes": 2,
    },
    {
      "nombre": "Matia Cat",
      "usuario": "matieldm753",
      "vista": false,
      "url_foto_perfil": "https://i.ytimg.com/vi/gLxO5R61hFI/maxresdefault.jpg",
      "dashes": 5,
    },
    {
      "nombre": "Eugenia Suarez",
      "usuario": "eugedehuracan",
      "vista": false,
      "url_foto_perfil":
          "https://i.pinimg.com/564x/3b/e1/e5/3be1e5f82073d219df18ea2b09db1f3a.jpg",
      "dashes": 2,
    },
    {
      "nombre": "Jenifer Solange Urquiza",
      "usuario": "jeniurquiza2",
      "vista": false,
      "url_foto_perfil":
          "https://i.pinimg.com/474x/77/56/06/775606b331fcb0a44dad916143bddf61.jpg",
      "dashes": 10,
    },
    {
      "nombre": "Manuel Albastro",
      "usuario": "manualbastro93",
      "vista": false,
      "url_foto_perfil":
          "https://www.okchicas.com/wp-content/uploads/2015/10/chico-transg%C3%A9nero-toma-una-selfie-cada-d%C3%ADa-4.jpg",
      "dashes": 6,
    },
    {
      "nombre": "Maria Lopez",
      "usuario": "mariilopez93",
      "vista": false,
      "url_foto_perfil":
          "https://viapais.cdncimeco.com/media/cache/resolve/medium/http://viapais.com.ar/files/2017/10/20171020160548_30251308_0_body.jpg",
      "dashes": 14,
    },
  ];


  // LISTA DE IMAGENES - variadas // 
  const  List listFotos = [
    "https://i.pinimg.com/564x/42/a8/3d/42a83d3d5996c0cf43e5b8deb8e8ceee.jpg",
    "https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Fotos-portada-e1467633503131.jpg",
    "https://www.tuenti.es/blog/wp-content/uploads/2018/09/App-videos-tecnologia.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/19/36/20/9b/dopo-tre-anni-di-nuovo.jpg",
    "https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg",
    "https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/08/fotos-perfil-whatsapp_16.jpg",
    "https://www.ngenespanol.com/wp-content/uploads/2018/08/12-fotos-espectaculares-y-coloridas-de-guacamayas.jpg",
    "https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/7/0/c/6/70c6566c15b49706503f0a9ca3edb6c7.jpg",
    "https://i.pinimg.com/564x/42/a8/3d/42a83d3d5996c0cf43e5b8deb8e8ceee.jpg",
    "https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Fotos-portada-e1467633503131.jpg",
    "https://www.tuenti.es/blog/wp-content/uploads/2018/09/App-videos-tecnologia.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/19/36/20/9b/dopo-tre-anni-di-nuovo.jpg",
    "https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg",
    "https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/08/fotos-perfil-whatsapp_16.jpg",
    "https://www.ngenespanol.com/wp-content/uploads/2018/08/12-fotos-espectaculares-y-coloridas-de-guacamayas.jpg",
    "https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/7/0/c/6/70c6566c15b49706503f0a9ca3edb6c7.jpg",
    "https://i.pinimg.com/564x/42/a8/3d/42a83d3d5996c0cf43e5b8deb8e8ceee.jpg",
    "https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Fotos-portada-e1467633503131.jpg",
    "https://www.tuenti.es/blog/wp-content/uploads/2018/09/App-videos-tecnologia.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/19/36/20/9b/dopo-tre-anni-di-nuovo.jpg",
    "https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg",
    "https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/08/fotos-perfil-whatsapp_16.jpg",
    "https://www.ngenespanol.com/wp-content/uploads/2018/08/12-fotos-espectaculares-y-coloridas-de-guacamayas.jpg",
    "https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/7/0/c/6/70c6566c15b49706503f0a9ca3edb6c7.jpg",
    "https://i.pinimg.com/564x/42/a8/3d/42a83d3d5996c0cf43e5b8deb8e8ceee.jpg",
    "https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Fotos-portada-e1467633503131.jpg",
    "https://www.tuenti.es/blog/wp-content/uploads/2018/09/App-videos-tecnologia.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/19/36/20/9b/dopo-tre-anni-di-nuovo.jpg",
    "https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg",
    "https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/08/fotos-perfil-whatsapp_16.jpg",
    "https://www.ngenespanol.com/wp-content/uploads/2018/08/12-fotos-espectaculares-y-coloridas-de-guacamayas.jpg",
    "https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/7/0/c/6/70c6566c15b49706503f0a9ca3edb6c7.jpg",
    "https://i.pinimg.com/564x/42/a8/3d/42a83d3d5996c0cf43e5b8deb8e8ceee.jpg",
    "https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Fotos-portada-e1467633503131.jpg",
    "https://www.tuenti.es/blog/wp-content/uploads/2018/09/App-videos-tecnologia.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/19/36/20/9b/dopo-tre-anni-di-nuovo.jpg",
    "https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg",
    "https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/08/fotos-perfil-whatsapp_16.jpg",
    "https://www.ngenespanol.com/wp-content/uploads/2018/08/12-fotos-espectaculares-y-coloridas-de-guacamayas.jpg",
    "https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/7/0/c/6/70c6566c15b49706503f0a9ca3edb6c7.jpg",
    "https://i.pinimg.com/564x/42/a8/3d/42a83d3d5996c0cf43e5b8deb8e8ceee.jpg",
    "https://empresas.blogthinkbig.com/wp-content/uploads/2019/11/Fotos-portada-e1467633503131.jpg",
    "https://www.tuenti.es/blog/wp-content/uploads/2018/09/App-videos-tecnologia.jpg",
    "https://media-cdn.tripadvisor.com/media/photo-s/19/36/20/9b/dopo-tre-anni-di-nuovo.jpg",
    "https://www.dzoom.org.es/wp-content/uploads/2010/09/mirada-ojos-encuadre-primer-plano-sexy-810x540.jpg",
    "https://cdn.computerhoy.com/sites/navi.axelspringer.es/public/styles/480/public/media/image/2018/08/fotos-perfil-whatsapp_16.jpg",
    "https://www.ngenespanol.com/wp-content/uploads/2018/08/12-fotos-espectaculares-y-coloridas-de-guacamayas.jpg",
    "https://studiosol-a.akamaihd.net/uploadfile/letras/fotos/7/0/c/6/70c6566c15b49706503f0a9ca3edb6c7.jpg",
  ];



