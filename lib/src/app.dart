
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:desingapp/src/bloc/auth_cubit.dart';
import 'package:desingapp/src/navigation/routes.dart';
import 'package:get/get.dart';

import 'utils/dynamicTheme_lb.dart';

final _navigatorKey = GlobalKey<NavigatorState>();

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
            darkTheme: ThemesDataApp.dark,
            themeMode: ThemeService().theme, // add this
            routes: Routes.listRoutes(),
            onGenerateRoute: Routes.routes,
        );
  }
}
