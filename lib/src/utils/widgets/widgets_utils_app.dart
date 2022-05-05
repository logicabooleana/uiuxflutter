import 'package:desingapp/src/utils/dynamicTheme_lb.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';

class WidgetsUtilsApp extends StatelessWidget {
  WidgetsUtilsApp({Key? key}) : super(key: key);

  final appdata = GetStorage(); // instance of GetStorage

  Widget buttonThemeBrightness({required BuildContext context, Color? color}) {
    if (color == null)
      color = Theme.of(context).brightness == Brightness.dark
          ? Colors.white
          : Colors.black;

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: CircleAvatar(
        radius: 20,
        backgroundColor: Colors.black12,
        child: IconButton(
          splashRadius: 20,
          padding: EdgeInsets.zero,
            icon: Icon(
                Theme.of(context).brightness == Brightness.light? Icons.brightness_high: Icons.brightness_3,
                color: color,
                ),
            onPressed: ThemeService.switchTheme ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
