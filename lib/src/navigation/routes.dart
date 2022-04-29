
import 'package:desingapp/src/ui/pages/page_inicio/introduccion/page_onboarding_vertical.dart';
import 'package:desingapp/src/ui/pages/page_inicio/introduccion/page_onboarding_liquid.dart';
import 'package:desingapp/src/ui/pages/page_inicio/introduccion/page_onboarding_bank.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_guideAr.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_SistemaSolar.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_bank.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_dribbbble.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_facebook.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_game.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_hotel.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_instagram.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_mercadolibre.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_netflix.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_pedidoya.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_snapchat.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_spotify.dart';
import 'package:desingapp/src/ui/pages/page_inicio/login/page_login_twitter.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_list_boutique.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_list_guideAr.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_mainScreen_hote.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_ajustes.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_bank.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_contact.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_gamer.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_instagram.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_mercadolibre.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_netflix.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_pedidoYa.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_planetas.dart';
import 'package:desingapp/src/ui/pages/pages_list/page_lista_spotify.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_4.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_bank.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_boutique.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_guideAr.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_instagram.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_netflix.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_pedidoYa.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_productoMercadoLibre.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_seguir.dart';
import 'package:desingapp/src/ui/pages/pages_profile/page_profile_spotify.dart';
import 'package:flutter/material.dart';
import 'package:desingapp/src/ui/home_screen.dart';
import 'package:desingapp/src/ui/intro_screen.dart';
import 'package:desingapp/src/ui/splash_screen.dart';
import 'package:desingapp/src/ui/profile_user.dart';
import 'package:desingapp/src/ui/paquetes_list.dart';
import 'package:desingapp/src/ui/info_app.dart';

import '../ui/pages/pages_list/page_home_facebook.dart';
import '../ui/pages/pages_list/page_list_telegram.dart';

class Routes {
  static const splash = '/';
  static const intro = '/intro';
  static const createAccount = '/createAccount';
  static const signInEmail = '/signInEmail';
  static const home = '/home';

  static Route routes(RouteSettings routeSettings) {
    print('Route name: ${routeSettings.name}');

    switch (routeSettings.name) {
      case splash:
        return _buildRoute(SplashScreen.create);
      case intro:
        return _buildRoute(IntroScreen.create);
      case home:
        return _buildRoute(HomeScreen.create);
      default:
        throw Exception('Route does not exists');
    }
  }

  static Map<String, Widget Function(BuildContext)> listRoutes() {
    return {
      'profile_user': (BuildContext context) => ProfileUser.create(context),
      'packages': (BuildContext context)    => AppPackages(),
      'info_app': (BuildContext context)    => PageAppIngo(),

      // Login
      'Page_login_hotel': (BuildContext context) => PageLoginHotel(), 
      'Page_login_game': (BuildContext context) => PageLoginGame(),
      'Page_login_bank': (BuildContext context) => PageLoginBank(),
      'Page_login_spotify': (BuildContext context) => PageLoginSpotify(),
      'page_login_SistemaSolar': (BuildContext context) =>PageLoginSistemaSolar(),
      'page_login_guideAr': (BuildContext context) => PageLoginGuideAr(),
      'page_login_instragram': (BuildContext context) => PageLoginInstagram(),
      'page_login_facebook': (BuildContext context) => PageLoginFacebook(),
      'page_login_twitter': (BuildContext context) => PageLoginTwitter(),
      'page_login_dribbbble': (BuildContext context) => PageLoginDribbbble(),
      'page_login_netflix': (BuildContext context) => PageLoginNetflix(),
      'page_login_snapchat': (BuildContext context) => PageLoginsnapchat(),
      'page_login_mercadolibre': (BuildContext context) =>PageLoginMercadoLibre(),
      'page_login_pedidoya': (BuildContext context) => PageLoginPedidoYa(),

      // Introducción
      'onboarding_bank': (BuildContext context) => PageOnboardBank(),
      'onboarding_1': (BuildContext context) => PageOnboarding1(),
      'onboarding_4': (BuildContext context) => PageOnboarding4(),

      // Listas
      'page_mainScreen_boutique': (BuildContext context) => PageMainScreenHotel(),
      'page_lista_boutique': (BuildContext context) => PageListBoutique(),
      'Page_lista_guideAr': (BuildContext context) => PageListGuideAr(),
      'Page_lista_bank': (BuildContext context) => PagelistaBank(),
      'Page_lista_spotify': (BuildContext context) => PagelistaSpotify(),
      'Page_lista_gamer': (BuildContext context) => PagelistaGamer(),
      'Page_lista_netflix': (BuildContext context) => PagelistaNetflix(),
      'Page_lista_mercadolibre': (BuildContext context) => PageListMercadoLibre(),
      'Page_lista_pedidoYa': (BuildContext context) => PagelistPedidoYa(),
      'Page_lista_instagram': (BuildContext context) => PageListaInstagram(),
      'Page_lista_ajustes': (BuildContext context) => PagelistaAjustes(),
      'Page_lista_planetas': (BuildContext context) => PageListaPlaneta(),
      'Page_lista_contact': (BuildContext context) => Pagelistacontact(),
      'Page_list_telegram': (BuildContext context) => PagelistTelegram(),
      'page_home_facebook': (BuildContext context) => PageHomeFacebook(),

      // Perfiles
      'page_profile_boutique': (BuildContext context) => PageProfileBoutique(),
      'page_profile_bank': (BuildContext context) => PageProfileBank(),
      'page_profile_spotify': (BuildContext context) => PageProfileSpotify(),
      'page_profile_netflix': (BuildContext context) => PageProfileNetflix(),
      'page_profile_pedidoYa': (BuildContext context) => PageProfilePedidoYa(),
      'page_profile_productoMercadoLibre': (BuildContext context) => PageProfileProductoMercadoLibre(),
      'page_profile_instagram': (BuildContext context) => PageProfileInstagram(),
      'page_profile_4': (BuildContext context) => PageProfileColapse(),
      'page_profile_2': (BuildContext context) => PageProfileSeguir(),
      'page_profile_guideAr': (BuildContext context) => PageProfileGuideAr(),
    };
  }

  static MaterialPageRoute _buildRoute(Function build) =>
      MaterialPageRoute(builder: (context) => build(context));
}


