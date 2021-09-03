import 'package:desingapp/src/utils/widgets/widget_source_code_view.dart';
import 'package:flutter/material.dart';
import 'package:desingapp/src/utils/utils.dart';
import 'package:share/share.dart';

class WidgetListTile extends StatelessWidget {

  final bool nuevo;
  final bool animated;
  final bool actualizado;
  final bool activeColor;
  final String title;
  final String subtitle;
  final BuildContext context;
  final String route;
  final String http;
  final String httpShare;
  final Color color;
  final Color colorText;
  final Widget icono;

  final String nameActivity;
  final String codeFilePath;

  WidgetListTile({
    required this.context,
    required this.title,
    required this.icono,
    this.nameActivity="",
    this.subtitle="",
    this.color=Colors.white,
    this.codeFilePath="",
    this.http="",
    this.httpShare="",
    this.route="",
    this.activeColor=false,
    this.nuevo=false,
    this.animated=false,
    this.actualizado=false,
    this.colorText=Colors.white,
  });

  @override
  Widget build(BuildContext buildContext) {
    return getListTile();
  }
  Widget getListTile() {

    return ListTile(
      tileColor: activeColor?Theme.of(context).primaryColor.withOpacity(0.1):Colors.transparent,
      onTap: () { 
        if( route != "" ){
          Navigator.pushNamed(context, route); 
        }else if( httpShare != "" ){
          Share.share(httpShare);
        }else if( http != "" ){
          launchURL(context,http);
        }},
        leading: icono,
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:MainAxisAlignment.start,
                children: [
                  Text(title, style: TextStyle(fontSize: 18.0,color: this.colorText)),
                  Row(
                    children: [
                      
                      this.nuevo?
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            Icon(Icons.radio_button_checked,size: 10.0,color:Colors.green),
                            Padding(padding: const EdgeInsets.all(3.0),child: Text("Nuevo", style: TextStyle(fontSize: 10.0,color: Colors.green)))
                          ],
                        ),
                      ):Container(),
                      this.actualizado?
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            Icon(Icons.radio_button_checked,size: 10.0,color:Colors.orange),
                            Padding(padding: const EdgeInsets.all(3.0),child: Text("Actualizado", style: TextStyle(fontSize: 10.0,color: Colors.orange)))
                          ],
                        ),
                      ):Container(),
                      this.animated?
                      Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Row(
                          children: [
                            Icon(Icons.radio_button_checked,size: 10.0,color:Colors.deepPurple[400]),
                            Padding(padding: const EdgeInsets.all(3.0),child: Text("Animación", style: TextStyle(fontSize: 10.0,color: Colors.deepPurple[400])))
                          ],
                        ),
                      ):Container(),
                    ],
                  ),
                ],
              ),
              dense: false,
              subtitle: subtitle!=""?Text(subtitle,style: TextStyle(color: this.colorText)):Container(),
              trailing: iconLauncher(codeFilePath: codeFilePath),
    );
  }
  Widget iconLauncher( {required String codeFilePath } ){
    return CodeFileWidget( recipeName: title, codeFilePath: codeFilePath ).getIConButtonView(context: context,color: color);
    
  }
  


}
