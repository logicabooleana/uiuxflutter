/// Copyright 2020 Logica Booleana Authors

// Dependencias 
import 'package:desingapp/src/utils/SABT.dart';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias

///  DESCRIPCIÓN 
//  Creamos una lista  de ajustes al estilo de samsung

class PagelistaAjustes extends StatefulWidget {
  PagelistaAjustes({Key ?key}) : super(key: key);

  @override
  PagelistaAjustesState createState() => PagelistaAjustesState();
}

class PagelistaAjustesState extends State<PagelistaAjustes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView( // CustomScrollView :Un ScrollView que crea efectos de desplazamiento personalizados usando astillas
        slivers: <Widget>[
          sliverAppBar("Ajuste"),
          sliverList(),
        ],
      ),
    );
  }
  /// WIDGETS VIEWS
  SliverAppBar sliverAppBar(String title) {
    return SliverAppBar(
      primary: true, // Si esta barra de aplicaciones se muestra en la parte superior de la pantalla
      pinned: true, // Si la barra de la aplicación debe permanecer visible al comienzo de la vista de desplazamiento
      expandedHeight: 300, // El tamaño de la barra de aplicaciones cuando está completamente expandido
      title: SABT(child: Text(title)), // solución SABT() : Envuelvo el titlewidget normal con otro widget que solo muestra el título si detecta una barra de aplicación contraída y, de lo contrario, oculta el título. */
      // flexibleSpace :  La parte de una barra de aplicaciones de diseño de materiales que se expande, colapsa y estira
      flexibleSpace: FlexibleSpaceBar(
        background: Padding(
          padding: EdgeInsets.only(top: 50.0),
          child: Center(child: Text(title,style: TextStyle(fontSize: 30.0,fontWeight:FontWeight.normal)),
          ),
        ),
      ),
    );
  }
  SliverList sliverList() {
  // Una astilla que coloca múltiples hijos de caja en una matriz lineal a lo largo del eje principal
  // Creamos una lista con items de ajustes con diferentes valores
    List list = [
      {'icon':Icon(Icons.wifi, color: Colors.blue,) ,             'title':'Conexiones',                     'subtitulo':'wi-fi,Bluetooth,Perfil fuera de linea,Uso de datos',           'ruta':'ruta'},
      {'icon':Icon(Icons.volume_up, color: Colors.purple,) ,      'title':'Sonidos y vibración',            'subtitulo':'Modo de sonido, Tono de llamdas',                              'ruta':'ruta'},
      {'icon':Icon(Icons.ac_unit, color: Colors.orange,) ,        'title':'Notificaciónes',                 'subtitulo':'Notificaciones de aplicaciones, Barra de estado',              'ruta':'ruta'},
      {'icon':Icon(Icons.brightness_auto, color: Colors.green,) , 'title':'Pantalla',                       'subtitulo':'Btillo, Filtro de luz, Pantalla de inicio',                    'ruta':'ruta'},
      {'icon':Icon(Icons.lightbulb_outline, color: Colors.blue,) ,'title':'Fondo de pantalla',              'subtitulo':'Brillo, Filtro de luz azul, Pantalla de inicio',               'ruta':'ruta'},
      {'icon':Icon(Icons.brush, color: Colors.purple,) ,          'title':'Temas',                          'subtitulo':'Temas, Fondos de pantalla, Fondo de pantalla de bloqueo',      'ruta': 'ruta'},
      {'icon':Icon(Icons.security, color: Colors.brown,) ,        'title':'Datos biométricos y seguridad',  'subtitulo':'Reconocimiento facial, Hellas digitales, Localización movil',  'ruta':'ruta'},
      {'icon':Icon(Icons.location_on, color: Colors.pink,) ,      'title':'Ubicación',                      'subtitulo':'Ajustes de ubicación, Solicitud de ubicación',                 'ruta':'ruta'},
      {'icon':Icon(Icons.update, color: Colors.teal,) ,           'title':'Actualización de software',      'subtitulo':'Descargar actualizaciones, últimas actualizaciones',           'ruta':'ruta'},
      {'icon':Icon(Icons.info, color: Colors.grey,) ,             'title':'Acerca del teléfono',            'subtitulo':'Esta, Información legal, Nombre del telefono',                 'ruta':'ruta'},
    ];
    return SliverList(
      // Para ello, se utiliza un delegado para crear elementos a medida que se desplazan por la pantalla
      delegate:SliverChildBuilderDelegate(
        (context, index) => _addListTile( icon:list[index]["icon"],title:list[index]["title"],subtitulo:list[index]["subtitulo"],ruta:list[index]["ruta"] ),
        childCount: list.length,
      ),
    );
  }
  /// WIDGETS
  Widget _addListTile({required Icon icon,required String title,required String subtitulo,required String ruta}) {
    return InkWell(
      onTap: (){ },
      child: Column(
        children: <Widget>[
          Container(padding: EdgeInsets.all(12.0),child: ListTile(leading: icon,title: Text(title),subtitle: Text(subtitulo)),),
          Divider(height: 1.0),
        ],
      ),
    );
  }
}
