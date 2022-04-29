
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desingapp/src/bloc/auth_cubit.dart';
import 'package:desingapp/src/navigation/routes.dart';
import 'package:get/get.dart';

import 'utils/dynamicTheme_lb.dart';

final _navigatorKey = GlobalKey<NavigatorState>();
var lightThemeData = new ThemeData(
  canvasColor: Colors.white,
  primaryColor: Colors.blue,
  textTheme: new TextTheme(button: TextStyle(color: Colors.white70)),
  brightness: Brightness.light,
  accentColor: Colors.blue,
);

var darkThemeData = ThemeData(
    canvasColor: Colors.black,
    primaryColor: Colors.blue,
    textTheme: new TextTheme(button: TextStyle(color: Colors.black54)),
    brightness: Brightness.dark,
    accentColor: Colors.blue);

class MyApp extends StatelessWidget {

  static Widget create() {
    // verifica si el usaurio esta autentificado
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSignedOut) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.intro, (r) => false);
        } else if (state is AuthSignedIn) {
          _navigatorKey.currentState
              ?.pushNamedAndRemoveUntil(Routes.home, (r) => false);
        }
      },
      child: MyApp(),
    );
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
            navigatorKey: _navigatorKey,
            title: 'UIUX Flutter',
            debugShowCheckedModeBanner: false,
            darkTheme: Themes.dark,
            themeMode: ThemeService().theme, // add this
            routes: Routes.listRoutes(),
            onGenerateRoute: Routes.routes,
        );
  }
}
