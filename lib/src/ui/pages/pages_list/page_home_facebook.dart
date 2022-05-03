import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../utils/widgets/widgets_utils_app.dart';

class PageHomeFacebook extends StatelessWidget {
  PageHomeFacebook({Key? key}) : super(key: key);

  final List stories = [
    {
      'name': 'Lucia Lopez',
      'avatarUrl':
          'https://t2.uc.ltmcdn.com/es/posts/8/0/6/que_es_un_selfie_origen_de_la_palabra_26608_1_600.jpg',
      'storyUrl':
          'https://www.poresto.net/u/fotografias/m/2021/7/16/f608x342-100641_130364_15.jpeg'
    },
    {
      'name': 'Javier Milei',
      'avatarUrl':
          'https://www.revistaanfibia.com/wp-content/uploads/2021/03/El-libertario-peinado-por-el-mercado_01Port.jpg',
      'storyUrl':
          'https://upload.wikimedia.org/wikipedia/commons/0/0f/ObeliscoBA2017.jpg'
    },
    {
      'name': 'Jimena Aranda',
      'avatarUrl':
          'https://i.pinimg.com/736x/ed/80/b8/ed80b86daa2333d88486837b876b0bd9--instagram-selfie-instagram-baddie-makeup.jpg',
      'storyUrl':
          'https://notife.com/wp-content/uploads/2019/01/mochileros-a-1200.jpg'
    },
    {
      'name': 'Vero Micaela Rios',
      'avatarUrl': 'https://www.nexofin.com/archivos/2021/04/nati-jota.jpg',
      'storyUrl': 'https://pbs.twimg.com/media/EwpA2LXXIAQoSIq.jpg'
    },
    {
      'name': 'Matias Alvarez',
      'avatarUrl': 'https://pbs.twimg.com/media/EtO-gjcXEAIuojd.jpg',
      'storyUrl':
          'https://images.ole.com.ar/2022/04/28/RawQ0x5gT_340x340__1.jpg'
    },
    {
      'name': 'Martin del Castillo',
      'avatarUrl':
          'https://st4.depositphotos.com/1017228/39720/i/450/depositphotos_397204900-stock-photo-image-unshaven-excited-programmer-man.jpg',
      'storyUrl':
          'https://cdn.autonomous.ai/static/upload/images/new_post/which-desk-setup-is-best-for-a-developer-379-1602744788208.jpg'
    },
  ];
  final List listaPersonas = [
    {
      "nombre": "Javier Milei",
      "usuario": "javiermilei",
      "live": false,
      "vista": false,
      "url_foto_perfil":
          "https://www.revistaanfibia.com/wp-content/uploads/2021/03/El-libertario-peinado-por-el-mercado_01Port.jpg",
      "dashes": 1,
      "url_image_post":
          'https://d3ugyf2ht6aenh.cloudfront.net/stores/001/167/995/products/el-camino-del-libertario1-de2c1c87d5516b154316463631684487-480-0.png',
    },
    {
      "nombre": "Leonel Messi",
      "usuario": "leomessi10",
      "live": true,
      "vista": false,
      "url_foto_perfil": "https://pbs.twimg.com/media/B338156CIAAABM_.jpg",
      "dashes": 14,
      "url_image_post":
          "https://cdn.futbolargentino.com/sdi/2018/09/09/lionel-messi-y-su-mensaje-a-la-seleccion-argentina-via-instagram-669809.jpg",
    },
    {
      "nombre": "Leonela Ibañes",
      "usuario": "leonela21324",
      "live": true,
      "vista": false,
      "url_foto_perfil":
          "https://juanbustos.com/wp-content/uploads/2018/10/Selfie.jpg",
      "dashes": 2,
      "url_image_post": "https://mapio.net/images-p/1172789.jpg",
    },
    {
      "nombre": "Matia Cat",
      "usuario": "matieldm753",
      "live": false,
      "vista": false,
      "url_foto_perfil": "https://i.ytimg.com/vi/gLxO5R61hFI/maxresdefault.jpg",
      "dashes": 5,
      "url_image_post":
          "https://d35hsl9am8s2ta.cloudfront.net/public/images/2020/09/15991530940-La-Boca-773x458.jpg",
    },
    {
      "nombre": "Eugenia Suarez",
      "usuario": "eugedehuracan",
      "vista": false,
      "url_foto_perfil":
          "https://i.pinimg.com/564x/3b/e1/e5/3be1e5f82073d219df18ea2b09db1f3a.jpg",
      "dashes": 2,
      "url_image_post":
          "https://intainforma.inta.gob.ar/wp-content/uploads/2020/04/Agricultura_urbana-web.jpg",
    },
    {
      "nombre": "Jenifer Solange Urquiza",
      "usuario": "jeniurquiza2",
      "live": false,
      "vista": false,
      "url_foto_perfil":
          "https://i.pinimg.com/474x/77/56/06/775606b331fcb0a44dad916143bddf61.jpg",
      "dashes": 1,
      "url_image_post":
          "https://e00-marca.uecdn.es/assets/multimedia/imagenes/2019/06/09/15600711667471.png",
    },
    {
      "nombre": "Manuel Albastro",
      "usuario": "manualbastro93",
      "live": false,
      "vista": false,
      "url_foto_perfil":
          "https://www.okchicas.com/wp-content/uploads/2015/10/chico-transg%C3%A9nero-toma-una-selfie-cada-d%C3%ADa-4.jpg",
      "dashes": 0,
      "url_image_post":
          "https://i.blogs.es/79fe25/traajos-en-programacion/1366_2000.jpg",
    },
    {
      "nombre": "Maria Lopez",
      "usuario": "mariilopez93",
      "live": false,
      "vista": false,
      "url_foto_perfil":
          "https://viapais.cdncimeco.com/media/cache/resolve/medium/http://viapais.com.ar/files/2017/10/20171020160548_30251308_0_body.jpg",
      "dashes": 0,
      "url_image_post":
          "https://www.dzoom.org.es/wp-content/uploads/2007/02/canon-mejorar-fotografo-consejos-principiantes-novatos-810x540.jpg",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
          brightness: Theme.of(context).brightness,
          scaffoldBackgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBarTheme: AppBarTheme(
              actionsIconTheme: IconThemeData(color: Colors.black),
              iconTheme: IconThemeData(color: Colors.black),
              elevation: 0,
              backgroundColor: Theme.of(context).scaffoldBackgroundColor),
          hintColor: Theme.of(context).brightness == Brightness.light
              ? Colors.black45
              : Colors.white38),
      child: Scaffold(
        appBar: appBar(context: context),
        body: body(context: context),
      ),
    );
  }

  // WIDGETS
  PreferredSizeWidget appBar({required BuildContext context}) {
    return AppBar(
      leading: Icon(Icons.facebook, color: Colors.blue, size: 40),
      actions: [
        WidgetsUtilsApp().buttonThemeBrightness(context: context),
        IconButton(
            icon: CircleAvatar(
                radius: 40,
                child: Icon(Icons.search, size: 20, color: Colors.black),
                backgroundColor: Colors.black12),
            onPressed: () {}),
        IconButton(
            icon: CircleAvatar(
                radius: 40,
                child: Icon(Icons.person, size: 20, color: Colors.black),
                backgroundColor: Colors.black12),
            onPressed: () {}),
      ],
    );
  }

  Widget body({required BuildContext context}) {
    return Stack(
      children: [
        ListView(
          children: [
            Container(
              padding: EdgeInsets.only(top: 20, right: 12, left: 12),
              child: widgetTextField(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 12, right: 12, left: 12),
              child: widgetButtons(),
            ),
            Container(
              padding: EdgeInsets.only(top: 12),
              child: widgetStory(),
            ),
            Divider(thickness: 8, color: Colors.black12),
            Publication(context: context, obj: listaPersonas[0]),
            Publication(context: context, obj: listaPersonas[1]),
            Publication(context: context, obj: listaPersonas[2]),
            Publication(context: context, obj: listaPersonas[3]),
          ],
        ),
        Column(children: [
          Expanded(child: Container()),
          BottomNavigationBar(colorAccent: Colors.blue)
        ]),
      ],
    );
  }

  // WIDGETS COMPONENT
  Widget widgetTextField() {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      color: Colors.black12,
      child: Container(
        padding: EdgeInsets.only(left: 12),
        child: TextFormField(
          decoration: InputDecoration(
              hintText: "¿Qué estás pensando?",
              border: InputBorder.none,
              fillColor: Colors.white),
        ),
      ),
    );
  }

  Widget widgetButtons() {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.red[400]),
                shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder(
                    side: BorderSide(color: Colors.transparent)))),
            icon: Icon(Icons.video_call, size: 20),
            label: Text("vivo"),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ButtonStyle(
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.green[400]),
                shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder(
                    side: BorderSide(color: Colors.transparent)))),
            icon: Icon(Icons.photo, size: 20),
            label: Text("foto"),
          ),
        ),
        SizedBox(width: 12),
        ElevatedButton(
          onPressed: () {},
          style: ButtonStyle(
              elevation: MaterialStateProperty.all(0),
              padding: MaterialStateProperty.all<EdgeInsets>(
                  EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
              backgroundColor:
                  MaterialStateProperty.all<Color?>(Colors.black12),
              shape: MaterialStateProperty.all<StadiumBorder>(
                  StadiumBorder(side: BorderSide(color: Colors.transparent)))),
          //icon: Icon(Icons.more_horiz, size: 20),
          child: Icon(Icons.more_horiz, size: 20),
        ),
      ],
    );
  }

  Widget widgetStory() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 12),
          child: Text('Historias',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24)),
        ),
        Container(
          width: double.infinity,
          height: 170,
          child: ListView.builder(
            padding: EdgeInsets.all(10),
            scrollDirection: Axis.horizontal,
            itemCount: stories.length,
            itemBuilder: (context, index) {
              if (index == 0) {
                return Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    cardHistoryAdd(),
                    cardHistory(value: stories[index]),
                  ],
                );
              }
              return cardHistory(value: stories[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget cardHistoryAdd() {
    // value
    String url =
        'https://img.freepik.com/fotos-kostenlos/laechelnde-frau-im-hemd-das-selfie-im-studio-macht_171337-17196.jpg?w=500';

    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Card(
        shadowColor: Colors.blue.shade200,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: 85,
          height: 160,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 200),
                  fit: BoxFit.cover,
                  imageUrl: url,
                  placeholder: (context, urlImage) =>
                      Container(color: Colors.grey),
                  errorWidget: (context, urlImage, error) => Center(
                      child: Icon(Icons.music_note,
                          size: 50.0, color: Colors.white))),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 18),
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.blue,
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.only(
                                bottom: 5, left: 7, right: 7, top: 14),
                            child: Text(
                              'Crear historia',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Material(
                      elevation: 8,
                      color: Colors.white,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30.0)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.add,
                          color: Colors.blue,
                          size: 18,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget cardHistory({required dynamic value}) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Card(
        shadowColor: Colors.grey.shade200,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        elevation: 3,
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: 85,
          height: 160,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 200),
                  fit: BoxFit.cover,
                  imageUrl: value['storyUrl'] ?? '',
                  placeholder: (context, urlImage) =>
                      Container(color: Colors.grey),
                  errorWidget: (context, urlImage, error) => Center(
                      child: Icon(Icons.music_note,
                          size: 50.0, color: Colors.white))),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Stack(
                  alignment: AlignmentDirectional.topCenter,
                  children: [
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: 18),
                        height: double.infinity,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.white10,
                            Colors.white70,
                          ],
                        )),
                      ),
                    ),
                    Column(
                      children: [
                        CircleAvatar(
                            radius: 19,
                            backgroundColor: Colors.white,
                            child: CircleAvatar(
                              radius: 18,
                              backgroundImage: CachedNetworkImageProvider(
                                  value["avatarUrl"] ?? "default"),
                              backgroundColor: Colors.transparent,
                            )),
                        Expanded(
                          child: Center(
                            child: Text(
                              value['name'] ?? 'name',
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// BottomNavigationBar
class BottomNavigationBar extends StatefulWidget {
  BottomNavigationBar({this.colorAccent = Colors.purple});

  late final Color colorAccent;

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  var currentIndex = 0;
  List<IconData> listOfIcons = [
    Icons.home_rounded,
    Icons.play_circle_filled_outlined,
    Icons.shopping_cart,
    Icons.notifications,
    Icons.person_rounded,
  ];

  @override
  Widget build(BuildContext context) {
    double _width = MediaQuery.of(context).size.width;
    Color colorIcon = Theme.of(context).brightness == Brightness.light
        ? Colors.grey
        : Colors.white38;

    return Container(
      margin: EdgeInsets.all(20),
      height: _width * .140,
      decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(.15),
                blurRadius: 30,
                offset: Offset(0, 10))
          ],
          borderRadius: BorderRadius.circular(50)),
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: listOfIcons.length,
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: _width * .024),
        itemBuilder: (context, index) => InkWell(
          onTap: () {
            setState(() {
              currentIndex = index;
              print(index);
            });
          },
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 1500),
                curve: Curves.fastLinearToSlowEaseIn,
                margin: EdgeInsets.only(
                    bottom: index == currentIndex ? 0 : _width * .029,
                    right: _width * .0422,
                    left: _width * .0422),
                width: _width * .128,
                height: index == currentIndex ? _width * .014 : 0,
                decoration: BoxDecoration(
                    color: widget.colorAccent,
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(10))),
              ),
              Icon(listOfIcons[index],
                  size: _width * .076,
                  color: index == currentIndex
                      ? widget.colorAccent
                      : colorIcon),
              SizedBox(height: _width * .01),
            ],
          ),
        ),
      ),
    );
  }
}

class Publication extends StatefulWidget {
  const Publication({
    required this.context,
    required this.obj,
  });

  final BuildContext context;
  final dynamic obj;

  @override
  _PublicationState createState() => _PublicationState();
}

class _PublicationState extends State<Publication> {
  bool like = false;
  bool save = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 5.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: <Widget>[
                      // avatar of user
                      Padding(
                          padding: EdgeInsets.all(3.0),
                          child: CircleAvatar(
                              backgroundColor: Theme.of(context).canvasColor,
                              radius: 24.0,
                              backgroundImage:
                                  NetworkImage(widget.obj["url_foto_perfil"]))),
                      SizedBox(width: 10.0),
                      // name and time
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.obj["nombre"],
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 16)),
                          Row(
                            children: [
                              Text("24 m",
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12.0)),
                              SizedBox(width: 5),
                              Icon(Icons.people, size: 14, color: Colors.grey),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                  // comment of user
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text('Que lindo'),
                  ),
                ],
              ),
              IconButton(icon: Icon(Icons.more_vert), onPressed: null)
            ],
          ),
        ),
        Flexible(
          fit: FlexFit.loose,
          child: Container(
            color: Colors.black12,
            child: CachedNetworkImage(
                fadeInDuration: Duration(milliseconds: 200),
                fit: BoxFit.cover,
                colorBlendMode: BlendMode.color,
                width: MediaQuery.of(context).size.width,
                imageUrl:
                    widget.obj["url_image_post"] ?? "https://picsum.photos/500",
                placeholder: (context, urlImage) => Container(
                      color: Colors.grey[300],
                      height: 300,
                    ),
                errorWidget: (context, urlImage, error) => Center(
                        child: Container(
                      color: Colors.grey[300],
                      height: 300,
                      child: Center(
                          child: Icon(
                        Icons.error_outline_outlined,
                        color: Colors.white,
                      )),
                    ))),
          ),
        ),
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              child: Row(
                children: <Widget>[
                  Row(
                    children: [
                      Material(
                        color: Colors.blue,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(24.0)),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Icon(
                            Icons.thumb_up_rounded,
                            color: Colors.white,
                            size: 12,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5.0, vertical: 0.0),
                        child: Text(
                          '198',
                          style: TextStyle(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 2.0),
                    child: Text('12 comentarios',
                        style: new TextStyle(color: Colors.grey)),
                  ),
                ],
              ),
            ),
            Divider(thickness: 1, height: 0),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton.icon(
                      onPressed: () {},
                      icon:
                          Icon(Icons.thumb_up_alt_outlined, color: Colors.grey),
                      label: Text('Me gusta',
                          style: TextStyle(color: Colors.grey))),
                  TextButton.icon(
                      onPressed: () {},
                      icon:
                          Icon(Icons.mode_comment_outlined, color: Colors.grey),
                      label: Text('Comentar',
                          style: TextStyle(color: Colors.grey))),
                  TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.share_outlined, color: Colors.grey),
                      label: Text('Compartir',
                          style: TextStyle(color: Colors.grey))),
                ],
              ),
            ),
          ],
        ),
        Divider(thickness: 8, color: Colors.black12),
      ],
    );
  }
}
