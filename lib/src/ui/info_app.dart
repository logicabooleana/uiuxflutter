import 'package:flutter/material.dart';
import 'package:desingapp/src/utils/utils.dart';

class PageAppIngo extends StatefulWidget {
  PageAppIngo({Key ?key}) : super(key: key);

  @override
  _PageAppIngoState createState() => _PageAppIngoState();
}

class _PageAppIngoState extends State<PageAppIngo> {
  
  @override
  Widget build(BuildContext context) {

    /* Fedinimos estilos */
    const estiloTitulo = TextStyle(fontSize: 28.0, fontWeight: FontWeight.bold);

    return Scaffold(
        appBar: AppBar(
          title: Text("Información"),
        ),
        body: Column(
          children: <Widget>[
          Expanded(child: Container()),
          Text("App creada con", style: estiloTitulo),
          FlutterLogo( size: 150.0, style: FlutterLogoStyle.horizontal),
          informacionProgramador(),
          Expanded(child: Container()),
          ],
        ),
    );
  }


  Widget informacionProgramador() {
    return Container(
      //margin: EdgeInsets.all(25.0),
      child: Column(
        children: <Widget>[
          Divider(endIndent: 20.0,indent: 20.0,height: 50.0),
          SizedBox(height: 20.0,),
          Text("<Desarrollador/>",textAlign: TextAlign.center),
          SizedBox(height: 20.0),
          InkWell(
            onTap: (){  launchURL(context,"https://www.instagram.com/logica.booleana/");  },
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                CircleAvatar(
                  radius: 25,
                  backgroundColor: Color.fromRGBO(255, 128, 115, 66),
                  child: Text("LB",style: TextStyle(color: Colors.white)),
                ),
                SizedBox(width: 12.0),
                Text("Logica Booleana", style: TextStyle(fontSize: 25.0,color: Color.fromRGBO(255, 128, 115, 66)),textAlign: TextAlign.center),
              ],
            ),
            
          ),
          
        ],
      ),
    );
  }
}