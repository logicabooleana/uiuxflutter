import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:desingapp/src/utils/utils.dart';
import 'package:desingapp/src/utils/widgets/widget_source_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:desingapp/src/values/arrays.dart' as valuesApp;
import 'package:package_info_plus/package_info_plus.dart';
import 'package:share_plus/share_plus.dart';
import '../utils/widgets/widgets_ListTile.dart';
import '../utils/widgets/widgets_utils_app.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:desingapp/src/bloc/my_user_cubit.dart';
import 'package:desingapp/src/bloc/app_info_cubit.dart';
import 'package:desingapp/src/repository/implementations/my_user_repository.dart';
import 'package:desingapp/src/repository/implementations/app_info_repository.dart';

// var
PackageInfo? packageInfo;
Size? screenSize;

class HomeScreen extends StatefulWidget {
  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => MyUserCubit(MyUserRepository())..getMyUser(),
      child: HomeScreen(),
    );
  }

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // var
  Color colorFond = Colors.transparent;

  versioApp() async {
    packageInfo = await PackageInfo.fromPlatform();
  }

  @override
  Widget build(BuildContext context) {
    /* get values */
    colorFond = Theme.of(context).scaffoldBackgroundColor;
    screenSize = MediaQuery.of(context).size;
    versioApp();

    return Scaffold(
      backgroundColor: colorFond,
      appBar: appbar(context: context),
      body: body(context: context),
    );
  }

  PreferredSizeWidget appbar({required BuildContext context}) {
    Color colorIconText = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return AppBar(
      backgroundColor: colorFond, //Theme.of(context).canvasColor,
      elevation: 0.0,
      bottom: PreferredSize(
          child: Container(
            margin: EdgeInsets.only(left: 12.0),
            color: colorIconText,
            height: 3.0,
          ),
          preferredSize: Size.fromHeight(4.0)),
      iconTheme: IconThemeData(color: colorIconText),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("UIUX",
                  style:
                      GoogleFonts.oswald(fontSize: 24.0, color: colorIconText)),
              BlocBuilder<MyUserCubit, MyUserState>(
                builder: (_, state) {
                  if (state is MyUserReadyState) {
                    return Row(
                      children: [
                        Text("   ¡Hola ",
                            style: GoogleFonts.oswald(
                                color: colorIconText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal)),
                        Text(state.user.name + "!",
                            style: GoogleFonts.oswald(
                                color: colorIconText,
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold)),
                      ],
                    );
                  }
                  return Text("");
                },
              ),
            ],
          ),
        ],
      ),
      actions: <Widget>[
        WidgetsUtilsApp().buttonThemeBrightness(context: context),
      ],
    );
  }

  Widget body({required BuildContext context}) {
    /* ¡¡¡ Usamos un SingleChildScrollView y no un ListView para prevenir que se refresquen las vistas !!! */
    return SingleChildScrollView(
      primary: false,
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GetVersionApp.create(context),
          SizedBox(height: 20.0),
          CarruselCardNews(contextPrincipal: context, list: getListCard()),
          Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 20.0, 12.0, 12.0),
              child: Text("Categoría",
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))),
          TileExpanded(
            context: context,
            materialColor: valuesApp.categoryIntroduction["color"],
            notify: getNotifyCategory(
                items: valuesApp.categoryIntroduction["items"]),
            list: getListWidgets(
                items: valuesApp.categoryIntroduction["items"],
                context: context),
            title: valuesApp.categoryIntroduction["tab_title"],
            news: getNews(
                context: context,
                items: valuesApp.categoryIntroduction["items"]),
            description: valuesApp.categoryIntroduction["description"],
          ),
          TileExpanded(
            context: context,
            materialColor: valuesApp.categoryLogin["color"],
            notify: getNotifyCategory(items: valuesApp.categoryLogin["items"]),
            list: getListWidgets(
                items: valuesApp.categoryLogin["items"], context: context),
            title: valuesApp.categoryLogin["tab_title"],
            news: getNews(
                context: context, items: valuesApp.categoryLogin["items"]),
            description: valuesApp.categoryLogin["description"],
          ),
          TileExpanded(
            context: context,
            materialColor: valuesApp.categoryMainSceem["color"],
            notify:
                getNotifyCategory(items: valuesApp.categoryMainSceem["items"]),
            list: getListWidgets(
                items: valuesApp.categoryMainSceem["items"], context: context),
            title: valuesApp.categoryMainSceem["tab_title"],
            news: getNews(
                context: context, items: valuesApp.categoryMainSceem["items"]),
            description: valuesApp.categoryMainSceem["description"],
          ),
          TileExpanded(
            context: context,
            materialColor: valuesApp.categoryProfile["color"],
            notify:
                getNotifyCategory(items: valuesApp.categoryProfile["items"]),
            list: getListWidgets(
                items: valuesApp.categoryProfile["items"], context: context),
            news: getNews(
                context: context, items: valuesApp.categoryProfile["items"]),
            title: valuesApp.categoryProfile["tab_title"],
            description: valuesApp.categoryProfile["description"],
          ),
          Padding(
              padding: const EdgeInsets.fromLTRB(12.0, 30.0, 12.0, 12.0),
              child: Text("Otras opciones",
                  style:
                      TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold))),
          Divider(),
          widgetOptionsApp(context: context),
        ],
      ),
    );
  }

  Widget widgetOptionsApp({required BuildContext context}) {
    return Container(
      child: Column(
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Cuenta", style: TextStyle(fontSize: 16.0)),
            onTap: () => Navigator.pushNamed(context, "profile_user"),
          ),
          ListTile(
            leading: Icon(Icons.code),
            title: Text("Paquetes", style: TextStyle(fontSize: 16.0)),
            onTap: () => Navigator.pushNamed(context, "packages"),
          ),
          ListTile(
            leading: Icon(Icons.android),
            title: Text("Más información"),
            onTap: () => Navigator.pushNamed(context, "info_app"),
          ),
          ListTile(
            leading: FaIcon(FontAwesomeIcons.instagram),
            title: Text("UIUX Flutter"),
            onTap: () =>
                launchURL(context, "https://www.instagram.com/uiuxflutter/"),
          ),
          ListTile(
            tileColor: Theme.of(context).primaryColor.withOpacity(0.1),
            leading: Image(
                width: 30.0,
                height: 30.0,
                image: AssetImage("assets/logo_playstore.png")),
            title: Text("Deja tu opinión"),
            subtitle: Text("¿Qué te pareció la app?"),
            onTap: () => launchURL(context,
                "https://play.google.com/store/apps/details?id=com.logicabooleana.desingapp"),
          ),
          ListTile(
            leading: Icon(Icons.share, size: 24.0),
            title: Text("Comparte"),
            onTap: () => Share.share(
                "https://play.google.com/store/apps/details?id=com.logicabooleana.desingapp"),
          ),
          ViewVersionApp(),
        ],
      ),
    );
  }

  // Component
  List getListCard() {
    List<dynamic> listCategoryAllItems = [];
    valuesApp.categoryIntroduction["items"].forEach((value) {
      value["color"] = valuesApp.categoryIntroduction["color"];
      listCategoryAllItems.add(value);
    });
    valuesApp.categoryLogin["items"].forEach((value) {
      value["color"] = valuesApp.categoryLogin["color"];
      listCategoryAllItems.add(value);
    });
    valuesApp.categoryMainSceem["items"].forEach((value) {
      value["color"] = valuesApp.categoryMainSceem["color"];
      listCategoryAllItems.add(value);
    });
    valuesApp.categoryProfile["items"].forEach((value) {
      value["color"] = valuesApp.categoryProfile["color"];
      listCategoryAllItems.add(value);
    });

    return listCategoryAllItems;
  }

  List<Widget> getListWidgets(
      {required List items, required BuildContext context}) {
    List<Widget> list = [];
    for (var i = 0; i < items.length; i++) {
      list.add(WidgetListTile(
          context: context,
          actualizado: items[i]["actualizado"] ?? false,
          nuevo: items[i]["nuevo"] ?? false,
          title: items[i]["title"] ?? "",
          color: Colors.white,
          icono: items[i]["icon"],
          route: items[i]["rute"] ?? "",
          subtitle: items[i]["subtitle"] ?? "",
          codeFilePath: items[i]["codeFilePath"] ?? "",
          nameActivity: items[i]["nameActivity"] ?? "",
          animated: items[i]["animated"] ?? false));
    }
    return list;
  }

  int getNews({required List items, required BuildContext context}) {
    int news = 0;
    for (var i = 0; i < items.length; i++) if (items[i]["nuevo"]) news++;

    return news;
  }

  int getNotifyCategory({required List items}) {
    int notifi = 0;
    for (var item in items) {
      if (item["nuevo"] || item["actualizado"]) {
        notifi++;
      }
    }
    return notifi;
  }
}

/* CLASS VIEWS */
class CarruselCardNews extends StatelessWidget {
  const CarruselCardNews(
      {Key? key, required this.list, required this.contextPrincipal})
      : super(key: key);

  final List list;
  final BuildContext contextPrincipal;

  @override
  Widget build(BuildContext context) {
    /* Filtra las UIs nuevas */
    List<dynamic> lista = [];
    list.forEach((element) {
      if (element["nuevo"] == true || element["actualizado"] == true) {
        lista.add(element);
      }
    });
    if (lista.length == 0) {
      return Container();
    }
    return CarouselSlider.builder(
      options: CarouselOptions(
          enableInfiniteScroll: lista.length == 1 ? false : true,
          autoPlay: lista.length == 1 ? false : true,
          aspectRatio: 2.0,
          enlargeCenterPage: true,
          enlargeStrategy: CenterPageEnlargeStrategy.scale),
      itemCount: lista.length,
      itemBuilder: (context, index, realIndex) {
        return cardPublicidad(context: context, item: lista[index]);
      },
    );
  }

  Widget cardPublicidad({required BuildContext context, required dynamic item}) {


    String texto = "";
    Color color = Colors.green;
    if (item["nuevo"] == true) {
      texto = "nuevo";
      color = Colors.green;
    } else if (item["actualizado"] == true) {
      texto = "actualizado";
      color = Colors.orange;
    }

    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        elevation: 8.0,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        child: InkWell(
          onTap: () {
            if (item["rute"] != "") {
              Navigator.pushNamed(context, item["rute"]);
            }
          },
          child: Stack(
            fit: StackFit.expand,
            children: [
              item["url"] != null
                  ? item["url"] != ""
                      ? BackdropFilter(
                          filter: new ImageFilter.blur(sigmaX: 10.0, sigmaY: 10.0),
                          child: CachedNetworkImage(
                              fadeInDuration: Duration(milliseconds: 200),
                              fit: BoxFit.cover,
                              imageUrl: item["url"],
                              placeholder: (context, urlImage) =>
                                  Container(color: item["color"]),
                              errorWidget: (context, urlImage, error) => Center(
                                  child: Container(color: item["color"]))),
                        )
                      : Container(color: item["color"])
                  : Container(color: item["color"]),
              Column(
                children: [
                  Expanded(
                      child: Center(
                    child: ListView(
                      shrinkWrap: true,

                      //mainAxisAlignment:MainAxisAlignment.center,
                      children: [
                        Chip(
                            label: Text(
                              texto,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.white, fontSize: 12.0),
                            ),
                            backgroundColor: color),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Padding(
                                padding: const EdgeInsets.all(3.0),
                                child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                    child: item["icon"]),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(item["title"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white)),
                                item["category"]==''?Container():Text(item["category"],
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                        fontSize: 12.0,
                                        fontWeight: FontWeight.normal,
                                        color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
                  InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CodeFileWidget(
                                    codeFilePath: item["codeFilePath"])));
                      },
                      child: Container(
                          color: Colors.black26,
                          padding: EdgeInsets.all(12.0),
                          child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Ver código",
                                  style: TextStyle(
                                      fontSize: 16.0, color: Colors.white),
                                ),
                                SizedBox(
                                  width: 5.0,
                                ),
                                Icon(
                                  Icons.visibility_outlined,
                                  size: 18.0,
                                  color: Colors.white,
                                )
                              ])))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class TileExpanded extends StatefulWidget {
  BuildContext context;
  String title;
  String description;
  int news;
  int notify;
  List<Widget> list;
  MaterialColor materialColor;

  TileExpanded(
      {required this.context,
      required this.title,
      this.notify = 0,
      required this.list,
      this.news = 0,
      this.materialColor = Colors.purple,
      this.description = ""});
  @override
  _TileExpandedState createState() => _TileExpandedState();
}

class _TileExpandedState extends State<TileExpanded> {
  bool isExpanded = true;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: AnimatedContainer(
        margin: EdgeInsets.symmetric(
            horizontal: isExpanded ? 20 : 12, vertical: 12),
        padding: EdgeInsets.all(20),
        //height: isExpanded ? 70 : 330,
        curve: Curves.fastLinearToSlowEaseIn,
        duration: Duration(milliseconds: 1200),
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                  color: widget.materialColor[400]!.withOpacity(0.5),
                  blurRadius: 0,
                  offset: Offset(0, 0)),
            ],
            color: widget.materialColor[400]!.withOpacity(0.7),
            borderRadius:
                BorderRadius.all(Radius.circular(isExpanded ? 20 : 20))),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // titulo
                Text(widget.title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w400,
                    )),
                // iconos con contador de nuevos items
                widget.news == 0
                    ? Container()
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: CircleAvatar(
                          maxRadius: 14.0,
                          backgroundColor: Colors.white,
                          child: Text(
                            widget.news.toString(),
                            style: TextStyle(
                                color: Colors.red[300],
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                Expanded(child: Container()),
                Icon(
                    isExpanded
                        ? Icons.keyboard_arrow_down
                        : Icons.keyboard_arrow_up,
                    color: Colors.white,
                    size: 27),
              ],
            ),
            isExpanded ? SizedBox() : SizedBox(height: 20),
            AnimatedCrossFade(
              firstChild: Text('', style: TextStyle(fontSize: 0)),
              secondChild: Text(widget.description,
                  style: TextStyle(color: Colors.white, fontSize: 15.7)),
              crossFadeState: isExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 1200),
              reverseDuration: Duration.zero,
              sizeCurve: Curves.fastLinearToSlowEaseIn,
            ),
            isExpanded ? SizedBox() : SizedBox(height: 20),
            AnimatedCrossFade(
              firstChild: Text('', style: TextStyle(fontSize: 0)),
              secondChild: Column(children: widget.list),
              crossFadeState: isExpanded
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: Duration(milliseconds: 1200),
              reverseDuration: Duration.zero,
              sizeCurve: Curves.fastLinearToSlowEaseIn,
            ),
          ],
        ),
      ),
    );
  }
}

class GetVersionApp extends StatelessWidget {
  static Widget create(BuildContext context) {
    return BlocProvider(
      create: (_) => AppInfoCubit(AppInfoRepository())..getAppInfo(),
      child: GetVersionApp(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Color colorText = Theme.of(context).brightness == Brightness.dark
        ? Colors.black
        : Colors.white;
    Color color = Theme.of(context).brightness == Brightness.dark
        ? Colors.white
        : Colors.black;

    return BlocBuilder<AppInfoCubit, AppInfoState>(
      builder: (_, state) {
        if (state is AppInfoReadyState) {
          bool isUpdate = false;
          try {
            if (int.parse(packageInfo!.buildNumber) < state.appInfo.version) {
              isUpdate = true;
            }
          } catch (ex) {
            isUpdate = false;
          }

          return isUpdate
              ? InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                            topRight: Radius.circular(0.0),
                            topLeft: Radius.circular(0.0),
                            bottomRight: Radius.circular(15.0),
                            bottomLeft: Radius.circular(15.0))),
                    padding: EdgeInsets.all(12.0),
                    margin: EdgeInsets.only(left: 12.0),
                    child: Text("Actualizar",
                        style: TextStyle(
                            color: colorText,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold)),
                  ),
                  onTap: () => launchURL(context,
                      "https://play.google.com/store/apps/details?id=com.logicabooleana.desingapp"),
                )
              : Container();
        }
        return Container();
      },
    );
  }
}

class ViewVersionApp extends StatefulWidget {
  @override
  _ViewVersionAppState createState() => _ViewVersionAppState();
}

class _ViewVersionAppState extends State<ViewVersionApp> {
  bool isVersion = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(50.0),
      width: double.infinity,
      height: 300,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              highlightColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isVersion = !isVersion;
                });
              },
              child: Stack(
                fit: StackFit.passthrough,
                alignment: Alignment.bottomCenter,
                textDirection: TextDirection.ltr,
                children: [
                  AnimatedContainer(
                    margin: EdgeInsets.only(bottom: 150),
                    duration: Duration(seconds: 1),
                    curve: isVersion ? Curves.ease : Curves.bounceOut,
                    child: isVersion
                        ? Text("UIUX Flutter", style: TextStyle(fontSize: 30.0))
                        : Container(),
                  ),
                  AnimatedContainer(
                    margin: EdgeInsets.only(bottom: isVersion ? 0 : 150),
                    duration: Duration(seconds: 1),
                    curve: isVersion ? Curves.ease : Curves.bounceOut,
                    child: Center(
                      child: Column(
                        children: [
                          isVersion
                              ? Container()
                              : packageInfo != null
                                  ? Text("${packageInfo!.version}",
                                      style: TextStyle(fontSize: 30.0))
                                  : Icon(Icons.touch_app_outlined),
                          //Text(!isVersion ?packageInfo!=null?"${packageInfo!.version}":"":"",style: TextStyle(fontSize: 30.0),),
                          isVersion
                              ? Text("by Logica Booleana",
                                  style: TextStyle(fontSize: 14))
                              : Container(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
