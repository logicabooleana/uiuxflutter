import 'package:flutter/material.dart';


class WidgetButtonCricle extends StatelessWidget {

  BuildContext context;
  String rute;
  String texto;
  Widget icon;

  double width;

  Color colorTexto,colorButton,colorButtonBorder,colorSplash;

  WidgetButtonCricle({
    required this.context,
    required this.texto,
    this.rute="",
    required this.icon,

    this.width=double.infinity,
    this.colorSplash=Colors.transparent,
    this.colorButtonBorder=Colors.white30,
    this.colorTexto=Colors.white,
    this.colorButton=Colors.blue,
    
  });

  @override
  Widget build(BuildContext context) {
    return icon!=null?getButtonIcon():getButton();
  }
  Widget getButton() {
    return Center(
      child: Container(
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0)),
            shape:MaterialStateProperty.all(StadiumBorder(side: BorderSide(width: 0.0,color: colorButtonBorder))),
            textStyle:MaterialStateProperty.all( TextStyle(color:colorTexto )),
            backgroundColor: MaterialStateProperty.all(colorButton),
          ),
          child: Text(texto,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center ),
          onPressed: () => Navigator.pushReplacementNamed(context, rute),
        ),
      ),
    );
  }
  Widget getButtonIcon() {
    return Center(
      child: Container(
        width: width,
        padding: EdgeInsets.all(12.0),
        child: ElevatedButton.icon(
          style: ButtonStyle(
            padding: MaterialStateProperty.all(const EdgeInsets.symmetric(vertical: 12.0,horizontal: 12.0)),
            shape:MaterialStateProperty.all( StadiumBorder()),
            textStyle:MaterialStateProperty.all( TextStyle(color:colorTexto )),
            backgroundColor: MaterialStateProperty.all(colorButton),
          ),
          icon: icon,
          label: Text(texto,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 16.0,fontWeight: FontWeight.w400),textAlign: TextAlign.center ),
          onPressed: () => Navigator.pushReplacementNamed(context, rute),
        ),
      ),
    );
  }
}

class WidgetButtonCricleLine extends StatelessWidget {

  BuildContext context;
  String rute;
  String texto;
  Widget icon;

  double fontSize;
  double width;
  double padding;
  double elevation;
  double borderRadius;
  double borderSideWidth;

  Color colorTexto;
  Color colorButton;
  Color colorButtonLine;

  WidgetButtonCricleLine({
    required this.context,
    required this.texto,
    this.rute="",
    required this.icon,

    this.width=double.infinity,
    this.elevation=5.0,    
    this.padding=12.0,
    this.fontSize=16.0,
    this.borderRadius=50.0,
    this.borderSideWidth=1.0,


    this.colorTexto=Colors.white,
    this.colorButton=Colors.blue,
    this.colorButtonLine=Colors.white,
    
  });

  @override
  Widget build(BuildContext context) {
    return getButton();
  }
  Widget getButton() {
    return Center(
      child: Container(
        width: width,
        child: ElevatedButton(
          style: ButtonStyle(
            elevation:MaterialStateProperty.all(elevation),
            padding: MaterialStateProperty.all(EdgeInsets.all(padding) ),
            shape:MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: new BorderRadius.circular(borderRadius))),
            textStyle:MaterialStateProperty.all( TextStyle(color:colorTexto )),
            backgroundColor: MaterialStateProperty.all(colorButton),
          ),
          child: Text(texto,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: fontSize,fontWeight: FontWeight.w300),textAlign: TextAlign.center ),
          onPressed: () => Navigator.pushReplacementNamed(context, rute),
        ),
      ),
    );
  }
}

