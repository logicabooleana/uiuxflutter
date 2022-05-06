/// Copyright 2020 Logica Booleana Authors

// Dependencias
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../utils/widgets/widgets_utils_app.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias

/// DESCRIPCIÓN
// facebook profile

// value
Map profile = {
  'name': 'Javier Milei',
  'coverPageUrl':
      'https://www.ncn.com.ar/wp-content/uploads/2022/02/javier-milei-1-800x445.jpg',
  'avatarUrl':
      'https://fotos.perfil.com/2021/09/04/trim/950/534/libertarios-populares-un-milei-que-pueda-alcanzar-dos-digitos-de-votos-en-las-paso-conmueve-al-pro-1226038.jpg',
  'description': 'Economista y Politico',
  'location': 'Buenos Aires, Argentina',
  'instagram': 'javiermilei',
};

// ignore: must_be_immutable
class PageProfileFacebook extends StatelessWidget {
  PageProfileFacebook();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: MySliverAppBar(expandedHeight: 200),
              pinned: true,
            ),
            sliverBody(context: context),
          ],
        ),
      ),
    );
  }

  // WIDGETS
  PreferredSizeWidget appbar({required BuildContext context}) {
    return AppBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      elevation: 0,
      bottom: PreferredSize(
          child: Container(color: Colors.white, height: 0.1),
          preferredSize: Size.fromHeight(4.0)),
      actions: [
        WidgetsUtilsApp()
            .buttonThemeBrightness(context: context, color: Colors.white),
        IconButton(onPressed: () {}, icon: Icon(Icons.search)),
      ],
    );
  }

  SliverList sliverBody({required BuildContext context}) {
    return SliverList(
      delegate: SliverChildListDelegate(
        [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: profileInfo(context: context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: widgetButtons(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: contentInfo(),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: contentFriend(context: context),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20),
            child: listFriends(),
          ),
          SizedBox(height: 100, width: double.infinity),
        ],
      ),
    );
  }

  // WIDGETS COMPONENT
  Widget profileInfo({required BuildContext context}) {
    return Column(
      children: <Widget>[
        // Profile image
        Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(profile['name'],
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(profile['description'],
                  style: TextStyle(
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.white30
                          : Colors.black38)),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('864',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16)),
                        SizedBox(width: 8),
                        Text('amigos',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white60
                                    : Colors.black54)),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('2.8K',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            )),
                        SizedBox(width: 8),
                        Text('seguidores',
                            style: TextStyle(
                                fontWeight: FontWeight.normal,
                                color: Theme.of(context).brightness ==
                                        Brightness.dark
                                    ? Colors.white60
                                    : Colors.black54)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        )
      ],
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
                elevation: MaterialStateProperty.all(12),
                shadowColor: MaterialStateProperty.all(Colors.blue[300]),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.blue[400]),
                shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder(
                    side: BorderSide(color: Colors.transparent)))),
            icon: Icon(Icons.person_add, size: 20),
            label: Text("Agregar"),
          ),
        ),
        SizedBox(width: 12),
        Expanded(
          flex: 1,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ButtonStyle(
                elevation: MaterialStateProperty.all(0),
                padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                backgroundColor:
                    MaterialStateProperty.all<Color?>(Colors.grey[300]),
                shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder(
                    side: BorderSide(color: Colors.transparent)))),
            icon: Icon(
              Icons.chat_bubble,
              size: 20,
              color: Colors.black,
            ),
            label: Text("Mensaje", style: TextStyle(color: Colors.black)),
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
                  MaterialStateProperty.all<Color?>(Colors.grey[300]),
              shape: MaterialStateProperty.all<StadiumBorder>(
                  StadiumBorder(side: BorderSide(color: Colors.transparent)))),
          //icon: Icon(Icons.more_horiz, size: 20),
          child: Icon(
            Icons.more_horiz,
            size: 20,
            color: Colors.black,
          ),
        ),
      ],
    );
  }

  Widget contentInfo() {
    // values
    Color colorIcon = Colors.grey;
    TextStyle textStyle = TextStyle(fontWeight: FontWeight.normal);

    return Container(
      color: Colors.grey.withOpacity(0.1),
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          Row(children: [
            Icon(Icons.location_on, color: colorIcon),
            SizedBox(width: 8),
            Text(profile['location'], style: textStyle),
          ]),
          SizedBox(height: 8),
          Row(children: [
            Icon(Icons.web, color: colorIcon),
            SizedBox(width: 8),
            Text(profile['instagram'], style: textStyle),
          ]),
          SizedBox(height: 8),
          Row(children: [
            Icon(Icons.person, color: colorIcon),
            SizedBox(width: 8),
            Text('Más información', style: textStyle),
          ]),
        ],
      ),
    );
  }

  Widget contentFriend({required BuildContext context}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Amigos',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  Text('864 - 3 amigos en común',
                      style: TextStyle(
                          color: Theme.of(context).brightness == Brightness.dark
                              ? Colors.white60
                              : Colors.black54)),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {},
              child: Text('Ver todos', style: TextStyle(color: Colors.black)),
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all(0),
                  shadowColor: MaterialStateProperty.all(Colors.blue[300]),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                      EdgeInsets.symmetric(horizontal: 18, vertical: 12)),
                  backgroundColor:
                      MaterialStateProperty.all<Color?>(Colors.grey[300]),
                  shape: MaterialStateProperty.all<StadiumBorder>(StadiumBorder(
                      side: BorderSide(color: Colors.transparent)))),
            )
          ],
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Stack(
            children: [
              avatar(
                urlImage:
                    'https://thumbs.dreamstime.com/b/head-shot-normal-face-man-asian-103009511.jpg',
                margin: const EdgeInsets.only(left: 60),
                size: 50,
              ),
              avatar(
                urlImage:
                    'https://thumbs.dreamstime.com/b/real-person-face-smiling-woman-portrait-blue-background-34700616.jpg',
                margin: const EdgeInsets.only(left: 30),
                size: 50,
              ),
              avatar(
                urlImage:
                    'https://i.pinimg.com/474x/7d/35/01/7d3501c9a86aeacc94cf364e50acc021.jpg',
                margin: const EdgeInsets.only(left: 0),
                size: 50,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget avatar(
      {String urlImage = 'default',
      double size = 50,
      EdgeInsetsGeometry margin = EdgeInsets.zero,
      double elevation = 5}) {
    return Container(
      margin: margin,
      height: size,
      width: size,
      child: Material(
        borderRadius: BorderRadius.circular(100),
        elevation: elevation,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: CircleAvatar(
            radius: 50.0,
            backgroundColor: Colors.grey,
            backgroundImage: NetworkImage(urlImage),
          ),
        ),
      ),
    );
  }

  Widget listFriends() {
    return Container(
      height: 150,
      child: ListView(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        children: [
          card(
            urlAvatar:
                'https://i.pinimg.com/736x/7c/ff/6d/7cff6dc7d9917b4232e027967833b1fa.jpg',
            name: 'Juan Perez',
            padding:
                const EdgeInsets.only(bottom: 12, top: 12, left: 12, right: 0),
          ),
          card(
            urlAvatar:
                'https://i.pinimg.com/736x/93/d1/28/93d128402fc20b1aeee816ea2d25e6cd.jpg',
            name: 'Carolina Tenorio',
            padding:
                const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
          ),
          card(
            urlAvatar:
                'https://i.pinimg.com/originals/37/8f/7f/378f7fccc3176ccf8bc7cd68f2d5215a.jpg',
            name: 'Mica Cat',
            padding:
                const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
          ),
          card(
            urlAvatar:
                'https://i.pinimg.com/originals/9d/17/64/9d1764fcd84afdc1d005337d4214f46f.jpg',
            name: 'Leandro Saez',
            padding:
                const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
          ),
          card(
            urlAvatar:
                'https://i.pinimg.com/564x/f4/9c/5a/f49c5aaf04fbcb1ca47bc363f94ee1a6.jpg',
            name: 'Veronica Mercedez',
            padding:
                const EdgeInsets.only(bottom: 12, top: 12, left: 5, right: 0),
          ),
        ],
      ),
    );
  }

  Widget card(
      {String name = 'Nombre',
      String urlAvatar = 'default',
      EdgeInsetsGeometry padding = EdgeInsets.zero}) {
    return Padding(
      padding: padding,
      child: Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        elevation: 8,
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: 85,
          height: double.infinity,
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                  fadeInDuration: Duration(milliseconds: 200),
                  fit: BoxFit.cover,
                  imageUrl: urlAvatar,
                  placeholder: (context, urlImage) =>
                      Container(color: Colors.grey[100]),
                  errorWidget: (context, urlImage, error) =>
                      Center(child: Container(color: Colors.grey[100]))),
              Padding(
                padding: const EdgeInsets.only(top: 70),
                child: Container(
                  margin: EdgeInsets.only(top: 18),
                  height: double.infinity,
                  width: double.infinity,
                  color: Colors.white,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: Text(
                        name,
                        style: TextStyle(
                            fontSize: 10,
                            color: Colors.black,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  MySliverAppBar({required this.expandedHeight});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      fit: StackFit.expand,
      clipBehavior: Clip.none,
      children: [
        CachedNetworkImage(
            fadeInDuration: Duration(milliseconds: 200),
            fit: BoxFit.cover,
            imageUrl: profile['coverPageUrl'],
            placeholder: (context, urlImage) => Container(color: Colors.grey),
            errorWidget: (context, urlImage, error) =>
                Center(child: Container(color: Colors.grey))),
        Align(
          alignment: Alignment.topRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.search,color: Colors.white,size: 30,)),
          ),
        ),
        Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios_new_rounded,color: Colors.white,size: 30,)),
          ),
        ),
        Opacity(
          opacity: shrinkOffset / expandedHeight,
          child: Container(
            color: Theme.of(context).scaffoldBackgroundColor,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.arrow_back_ios_new_rounded)),
                Expanded(child: Container()),
                WidgetsUtilsApp().buttonThemeBrightness(context: context),
                IconButton(onPressed: () {}, icon: Icon(Icons.search)),
              ],
            ),
          ),
        ),
        Positioned(
          top: expandedHeight / 2 - shrinkOffset,
          left: MediaQuery.of(context).size.width / 3.5,
          child: Opacity(
            opacity: (1 - shrinkOffset / expandedHeight),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white, width: 3),
              ),
              child: SizedBox(
                height: expandedHeight,
                width: MediaQuery.of(context).size.width / 2.5,
                child: CircleAvatar(
                  radius: 41.0,
                  backgroundColor: Colors.grey,
                  backgroundImage: NetworkImage(profile["avatarUrl"]),
                ),
              ),
            ),
          ),
        ),
        
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}
