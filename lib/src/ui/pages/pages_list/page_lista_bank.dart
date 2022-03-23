/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'dart:math';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias 
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';
import 'package:flutter/material.dart';


// var
List<MaterialColor> colores = [
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
];

class PagelistaBank extends StatelessWidget {
  const PagelistaBank({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body(context: context),
      bottomNavigationBar: bottomNavigationBar(context: context,colorAccent:Colors.deepPurple),
    );
  }

  /// WIDGETS VIEWS
  Widget body({required BuildContext context}){

    // var
    TextStyle textStyle1=TextStyle(color:Colors.deepPurple,fontSize:24.0);
    TextStyle textStyle2=TextStyle(color:Colors.deepPurple,fontSize:45.0,fontWeight:FontWeight.bold);

    return Column(
      crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom:12.0,top:50.0,left: 12.0,right: 12.0),
          child: Row(
            children: [
              InkWell(child: Icon(Icons.search),onTap:(){}),
              Expanded(child: Text("Mi saldo",textAlign:TextAlign.center,style: TextStyle(fontSize: 24.0,fontWeight:FontWeight.normal),)),
              WidgetsUtilsApp().buttonThemeBrightness(context: context),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(12.0),
          child: Row(
            crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,
            children: [
              Text("\$  ",style:textStyle1),
              Text("16.000",style:textStyle2),
              Padding(padding: const EdgeInsets.only(top: 20.0),child: Text(" ,90",style:textStyle1)),
            ],
          ),
        ),
        Row(
          crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.spaceEvenly,
          children: [
            iconButtonText(context:context,text:"Préstamos",iconData: Icons.attach_money,color:Colors.deepPurple),
            iconButtonText(context:context,text:"Depositar",iconData: Icons.arrow_downward,color:Colors.yellow),
            iconButtonText(context:context,text:"Inversiones",iconData: Icons.repeat,color:Colors.green),
          ],
        ),
        Expanded(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              itemRegisterMovimiento(context:context,title:"Recarga Personal",price:-150.0,icon: Icons.phone_android),
              itemRegisterMovimiento(context:context,title:"Cambio de moneda",price:152.0,icon: Icons.compare_arrows),
              itemRegisterMovimiento(context:context,title:"Transferencia bancaria",price:-500.0,icon: Icons.atm),
              itemRegisterMovimiento(context:context,title:"Recarga Personal",price:-150.0,icon: Icons.phone_android),
              itemRegisterMovimiento(context:context,title:"Mercadopago*zoeymile",price:-2000.0,icon: Icons.attach_money),
              itemRegisterMovimiento(context:context,title:"Extracción en autoservicio",price:-3500.0,icon: Icons.attach_money),
              itemRegisterMovimiento(context:context,title:"Jub rec coelsa",price:20587.0,icon: Icons.business),
            ],
          ),
        ),
      ],
    );
  }
  /// WIDGETS COMPONENTS
  Widget iconButtonText({double size = 50 ,required BuildContext context,required String text,IconData iconData=Icons.view_headline,MaterialColor color=Colors.blue,double borderRadius=12.0}){
    // IconButton con texto inferior
    
    TextStyle textStyle = TextStyle(color: Theme.of(context).brightness==Brightness.dark?Colors.white:color[100],fontSize: size*0.3);
    
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Material(color: Colors.transparent,child: Ink(width: size,height: size,decoration: BoxDecoration(color:color[100], borderRadius: BorderRadius.circular(borderRadius)),child: InkWell(customBorder:  RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(12))),splashColor: Colors.black12,onTap: (){},child: Icon(iconData,color:color,size: size*0.5)))),
          Padding(padding: const EdgeInsets.only(top: 8.0),child: Text(text,style: textStyle,textAlign: TextAlign.center)),
        ],
      ),
    );
  }
  Widget itemRegisterMovimiento({required BuildContext context,IconData icon=Icons.attach_money,required String title,String descripcion="",double price=0.0}){
    
    // var
    bool positive = price<0?false:true; // Definimos si el precio es positvo o negativo
    MaterialColor colorRamdom = colores[ Random().nextInt(colores.length) ] ;
    
    return Container(
      child: ListTile(
              leading: Container(width: 30.0,height: 30.0,decoration: new BoxDecoration(shape: BoxShape.circle,color:colorRamdom[100]),child: Icon(icon,size: 20.0,color:colorRamdom[400])),
              title: Text(title, style: TextStyle(fontSize: 18.0)),
              dense: false,
              subtitle: descripcion!=""?Text(descripcion):null,
              trailing: Container(child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0,vertical:4.0),
                child: Text((positive?"+":"")+price.toString(),style: TextStyle(fontWeight:FontWeight.bold,fontSize: 24.0,color:positive?Colors.greenAccent[400]:null)),
              ),decoration: BoxDecoration(color:positive?Colors.greenAccent[100]:null, borderRadius: BorderRadius.circular(10.0))),
            ),
    );
  }
  Widget bottomNavigationBar( {required BuildContext context,MaterialColor colorAccent=Colors.blue}) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Theme.of(context).canvasColor),
      child: BottomNavigationBar(
        elevation: 10.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 24.0),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card, size: 24.0),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet, size: 24.0),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.assessment, size: 24.0),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar, size: 24.0),label:""),
        ],
        currentIndex: 0, 
        selectedItemColor:colorAccent,
        unselectedItemColor:colorAccent[200],
      ),
    );
  }

}
