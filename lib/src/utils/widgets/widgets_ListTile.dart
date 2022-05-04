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
        leading: CircleAvatar(child: icono,backgroundColor: color.withOpacity(0.9)),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment:MainAxisAlignment.start,
          children: [
            Text(title, style: TextStyle(fontSize: 18.0,color: this.colorText)),
            Row(
              children: [
                
                this.nuevo?
                Chip(
                  backgroundColor: Colors.green[400],
                  padding: const EdgeInsets.all(0),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12,vertical:0),
                  label:Text('Nuevo',style: TextStyle(color: Colors.white,fontSize:12))):Container(),
                this.actualizado?
                Chip(
                  backgroundColor: Colors.orange[400],
                  padding: const EdgeInsets.all(0),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12,vertical:0),
                  label:Text('Actualizado',style: TextStyle(color: Colors.white,fontSize:12))):Container(),
                this.animated?
                Chip(
                  backgroundColor: Colors.deepPurple[400],
                  padding: const EdgeInsets.all(0),
                  labelPadding: const EdgeInsets.symmetric(horizontal: 12,vertical:0),
                  label:Text('Animación',style: TextStyle(color: Colors.white,fontSize:12))):Container(),
              ],
            ),
          ],
        ),
        dense: false,
        subtitle: subtitle!=""?Text(subtitle,style: TextStyle(color: this.colorText)):null,
        trailing: iconLauncher(codeFilePath: codeFilePath),
    );
  }
  Widget iconLauncher( {required String codeFilePath } ){
    return CodeFileWidget( recipeName: title, codeFilePath: codeFilePath ).getIConButtonView(context: context,color: color);
    
  }
  


}
