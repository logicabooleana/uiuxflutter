/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'dart:math';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class PageProfileBank extends StatelessWidget {
  PageProfileBank({Key ?key}) : super(key: key);

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: body(context),
        bottomNavigationBar: bottomNavigationBar(context: context,colorAccent:Colors.deepPurple),
      );
  }
  Widget body(BuildContext context) {
    return Container(
      child: Center(
        child: ListView(
          shrinkWrap: true,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 50.0,bottom: 12.0,left: 12.0,right: 12.0),
              child: Text("Lucas Iván Cabrera",textAlign:TextAlign.center, style: TextStyle(fontSize: 24.0,fontWeight:FontWeight.bold )),
            ),
            Row(
              crossAxisAlignment:CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.spaceEvenly,
              children: [
                FaIcon(FontAwesomeIcons.qrcode, size:30.0),
                CircleAvatar(backgroundColor: Theme.of(context).canvasColor,radius: 41.0,backgroundImage: NetworkImage("https://www.claro.com.co/portal/recursos/co//cpp/promociones/imagenes/1585227820545-6-01-Dia-del-hombre.jpg")),
                FaIcon(FontAwesomeIcons.userFriends, size:30.0),
              ],
            ),
            SizedBox(height: 30.0),
            Text("Mi alias en pesos".toUpperCase(),textAlign:TextAlign.center, style: TextStyle( fontSize: 16.0,fontWeight:FontWeight.bold )),
            SizedBox(height: 8.0),
            Text("JARDINERO.PLANO.PERRO",textAlign:TextAlign.center,style: TextStyle(fontSize: 16.0,fontWeight:FontWeight.bold)),
            SizedBox(height: 30.0),
            Container(margin:const EdgeInsets.symmetric(horizontal: 50.0),padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical:8.0),child: ElevatedButton(
              style: ButtonStyle(
                padding: MaterialStateProperty.all(const EdgeInsets.symmetric(horizontal:50.0,vertical: 12.0)),
                elevation: MaterialStateProperty.all(1.0),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0),side: BorderSide(color: Colors.purple[100]!))),
                backgroundColor: MaterialStateProperty.all(Colors.purple[100]),
                textStyle: MaterialStateProperty.all( TextStyle(color: Colors.purple[800])),
              ),
              onPressed: () {},
              child: Text("Ver mi alias y cbu".toLowerCase().toUpperCase(),
              style: TextStyle(fontSize: 18.0,fontWeight: FontWeight.bold)))),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.spaceAround,
                children: [
                buttonCircle(icon: Icons.chat_bubble_outline,texto: "Soporte".toUpperCase(),color: Colors.purple),
                Padding(padding: const EdgeInsets.only(top: 50.0),child: buttonCircle(icon: Icons.person_outline,texto: "Mis datos".toUpperCase(),color: Colors.blue)),
                buttonCircle(icon: Icons.share,texto: "Invitar".toUpperCase(),color: Colors.yellow[600]!),
              ],),
            ),
            Expanded(
          child: Column(
            children: [
              item(context:context,title:"Cuenta Dólares",descripcion: "UDS 0,00"),
              item(context:context,title:"Estado de cuenta",icon: Icons.turned_in),
              item(context:context,title:"Pago de servicios",icon: Icons.assignment),
              item(context:context,title:"Plazo fijo",icon: Icons.stay_current_portrait),
              item(context:context,title:"Préstamos",icon: Icons.monetization_on),
              item(context:context,title:"Seguridad",icon: Icons.security),
              item(context:context,title:"Mis Documentos",icon: Icons.description),
            ],
          ),
        ),

          ],
        ),
      ),
    );
  }
  /// WIDGETS COMPONENT 
  Widget buttonCircle({ required String texto, required IconData icon,Color color = Colors.black}){
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Container(
            width: 60.0,
            height: 60.0,
            child: RawMaterialButton(onPressed: () {},elevation: 1.0,fillColor: Colors.white,child: Icon(icon,size: 30.0,color:color,),padding: EdgeInsets.all(15.0),shape: CircleBorder()),
          ),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),child: Text(texto, maxLines:2,overflow:TextOverflow.ellipsis,textAlign:TextAlign.center,style: TextStyle(color:color,fontSize: 16.0,fontWeight:FontWeight.bold))),
        ],
      ),
    );
  }
  Widget item({required BuildContext context,IconData icon=Icons.attach_money,required String title,String descripcion=""}){
    MaterialColor colorRamdom = colores[Random().nextInt(colores.length)];
    return Container(
      child: ListTile(
              leading: Container(width: 30.0,height: 30.0,decoration: new BoxDecoration(shape: BoxShape.circle,color:colorRamdom[100]),child: Icon(icon,size: 20.0,color:colorRamdom[400])),
              title: Text(title, style: TextStyle(fontSize: 18.0)),
              dense: false,
              subtitle: descripcion!=""?Text(descripcion):null,
      ),
    );
  }
  Widget bottomNavigationBar( {required BuildContext context,MaterialColor colorAccent=Colors.blue}) {
    return Theme(
      data: Theme.of(context).copyWith(canvasColor: Theme.of(context).canvasColor),
      child: BottomNavigationBar(elevation: 10.0,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home, size: 24.0),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.credit_card, size: 24.0),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.account_balance_wallet, size: 24.0),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.assessment, size: 24.0),label:""),
          BottomNavigationBarItem(icon: Icon(Icons.perm_contact_calendar, size: 24.0),label:""),
        ],
        currentIndex: 4, 
        selectedItemColor:colorAccent,
        unselectedItemColor:colorAccent[200],
      ),
    );
  }
}
