// Copyright 2020 Logica Booleana Authors

// import
import 'dart:ui';
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en el apartado => Dependencias
import 'package:cached_network_image/cached_network_image.dart';
import 'package:animate_do/animate_do.dart';
import 'package:desingapp/src/utils/widgets/widgets_utils_app.dart';


// Data
List category = [
  {
    "color":Colors.red[200],
    "coverPage":"https://st3.depositphotos.com/8543466/i/600/depositphotos_318812364-stock-photo-white-wooden-clothes-hangers-on.jpg",
    "url_image":"https://ae01.alicdn.com/kf/Hd6fe2b3d04f544929a263272990c72e73.jpg",
    "name":"Mujer",
    "products":productsWoman,
    },
  {
    "color":Colors.blue,
    "coverPage":"https://sevilla.abc.es/contenidopromocionado/wp-content/uploads/sites/2/2018/10/portada-wp-modahombre.jpg",
    "url_image":"https://i.pinimg.com/originals/92/f2/3f/92f23faa25b07d09d88c28797fddb6c4.jpg",
    "products":productsMen,
    "name":"Hombre",
    },
  {
    "color":Colors.pink,
    "coverPage":"https://tendencybook.com/wp-content/uploads/2021/02/ninos-portada.jpg",
    "products":productsKids,
    "name":"Niñ@s",
    "url_image":"https://i.pinimg.com/736x/83/cc/f6/83ccf6c9705fe52f1ddaf7f1764a8e4c.jpg",
    },
  {
    "color":Colors.brown,
    "coverPage":"https://mott.social/wp-content/uploads/2019/06/portada-como-reconocer-el-calzado-de-cuero-legitimo-e1559625053733.jpg",
    "products":productsCalzados,
    "name":"Calzados",
    "url_image":"https://www.dhresource.com/0x0/f2/albu/g9/M00/82/A0/rBVaWF7xg-uABNOnAAUBQ7yLwXU355.jpg/new-2020-shoes-woman-solid-sandals-slingbacks.jpg",
    },
  {
    "color":Colors.purple,
    "coverPage":"https://www.cutypaste.com/wp-content/uploads/2018/11/foto-portada-trajes-de-ban%CC%83o-ripley-1-790x400.jpg",
    "products":productsMen,
    "name":"Bikini","url_image":"https://mebikinis.com/wp-content/uploads/2018/10/3057-a37314e01e720fdf8d0b06d2b80b60c1-300x300.jpg"},
  {
    "color":Colors.cyan,
    "coverPage":"",
    "products":productsMen,
    "name":"Pileta",
    "url_image":"https://i.pinimg.com/originals/73/94/a2/7394a2e10a1fd5d94d3d705918ffbb23.jpg",
    },
];
List productsWoman = [
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://i.pinimg.com/originals/53/4d/08/534d08a844da55b2ae1aa95e3790be54.jpg"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"http://st2.depositphotos.com/2171279/7264/i/450/depositphotos_72649623-Outdoor-summer-closeup-portrait-of-young-stylish-fashion-glamorous-sexy-brunette-woman-or-girl-posed-in-sunny-day-jeans-shorts-swimsuit-bra-and-sunglasses-standing-near-blue-wall.jpg"},
  {"title":"Vestido Flown Lenny","price":"7999","point":"1.5","url_image":"https://www.theplace2.ru/archive/anna_selezneva/img/anna_selezneva8.jpg"},
  {"title":"Blazer Rojo","price":"6.500","point":"1.5","url_image":"https://i.pinimg.com/474x/c4/be/2e/c4be2e29b20e1a8779cbc0a7359cf4dc.jpg"},
];
List productsMen = [
  {"title":"Camisa Dama Escocesa Cuadros Entallada Varios Colores","price":"999","point":"1.5","url_image":"https://image1.masterfile.com/getImage/NjkzLTA2MzI0MTA5ZW4uMDAwMDAwMDA=ANdGJu/693-06324109en_Masterfile.jpg"},
  {"title":"Camisa Leñadora Hombre","price":"4.499","point":"1.5","url_image":"https://image.freepik.com/free-photo/portrait-handsome-smiling-stylish-young-man-model-dressed-red-checkered-shirt-fashion-man-posing_158538-4914.jpg"},
  {"title":"Camisa Leñadora Hombre","price":"4.499","point":"1.5","url_image":"https://lh3.googleusercontent.com/proxy/DwbjJxRxR-TSfZ_X5JiNtWi8ggTXRCqYGAIOQo2Ec1j8ULMnuTHNfbLnME1M_tDY4pJwJNFK2H36wNBzSI7SP3uikgJfiGzgkj5wRyPAyHnsWb_9atSi_LaWv5cfm1l6dBE0Oes5CYv_ElVw"},
  {"title":"Camisa Jean Hombre","price":"4.499","point":"1.5","url_image":"https://image.freepik.com/foto-gratis/hombre-brazos-cruzados-sobre-fondo-colores_1368-10327.jpg"},
];
List productsKids=[
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://img.ltwebstatic.com/images3_pi/2020/02/27/158276769772358b7d9bef03a8f1f5822f14594f7b.webp"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://img.ltwebstatic.com/images3_pi/2019/12/28/15774974150d946f552a770c70be9f9e0d362f74c6.webp"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://i.pinimg.com/474x/d5/b8/9e/d5b89edcb3842da36f4915952a97657f.jpg"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://i.pinimg.com/originals/f2/63/28/f263280bd4b20c04782cbaf8468ef772.jpg"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://thumbs.dreamstime.com/b/nueva-york-ny-de-octubre-un-modelo-camina-la-pista-durante-el-avance-de-la-ropa-del-aria-children-en-la-semana-de-la-moda-de-los-45847300.jpg"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://bomboncitokids.com/1112-large_default/vestido-evase.jpg"},
];
List productsCalzados = [
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://images.clarin.com/2018/08/26/zapatillas-y-moda-una-alianza___Bkggg1XwQ_340x340__1.jpg"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://i.pinimg.com/564x/05/18/bc/0518bc074111107726a9a9ccd0a141d4.jpg"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://modaellos.com//wp-content/uploads/2020/05/moda-calzado-hombre-otono-invierno-tendencias-zapatos-y-zapatillas-zara-600x900.jpg"},
  {"title":"Prenda","price":"120","point":"1.5","url_image":"https://estaticos.marie-claire.es/media/cache/680x_thumb/uploads/images/gallery/55dd81cf26e1043b24a9f090/maccui-1-v1-95992.jpg"},

];
// values
int indexCategory=0;

class PageListBoutique extends StatefulWidget {
  @override
  _PageListBoutiqueState createState() => _PageListBoutiqueState();
}

class _PageListBoutiqueState extends State<PageListBoutique> {

  // var 
  Color colorIcon = Colors.white;
  Color colorIconText = Colors.black;
  Color colorText = Colors.black; 
  final MaterialColor colorCanvas = Colors.grey;
  Color colorAccent = Colors.purple;
  late MaterialColor colorFond ;

  @override
  Widget build(BuildContext context) {

    // get - values 
    colorAccent = category[indexCategory]["color"];
    colorText=Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black;
    colorIcon=Theme.of(context).brightness==Brightness.dark?Colors.white:Colors.black;
    colorIconText=Theme.of(context).brightness==Brightness.dark?Colors.black:Colors.white;

    return Scaffold(
      backgroundColor:Theme.of(context).brightness==Brightness.dark?Colors.grey[900]:Colors.grey[100],
      body: body(context: context),
    );
  }
  // WIDGETS VIEWS
  Widget body({required BuildContext context}) {
    return Stack(
          children: [
            CustomScrollView(
              slivers: [
                sliverAppBar(context: context),
                SliverToBoxAdapter(child: FadeInLeft(child: _buildTitleBubble(),delay: const Duration(milliseconds: 500))),
                SliverToBoxAdapter(child: FadeInLeft(child: SearchBox(),delay: const Duration(milliseconds: 1000))),
                _gridViewProducts(context: context),
                _sliverContentInfo(),
              ],
            ),
            Column(children: [Expanded(child: Container()), BottomNavigationBar(colorAccent: colorAccent)]),
          ],
      );
  }
  SliverAppBar sliverAppBar({required BuildContext context}){
    return SliverAppBar(
      backgroundColor: Theme.of(context).brightness==Brightness.dark?colorCanvas[900]:colorAccent,
            primary: true,
            pinned: true,
            expandedHeight: 150,
            flexibleSpace: FlexibleSpaceBar(
              collapseMode: CollapseMode.parallax,centerTitle: false,
              title: Text('Tienda Boutique',style: TextStyle(color: Colors.white),),
              background: CachedNetworkImage(width: double.infinity,height: double.infinity,imageUrl: category[indexCategory]["coverPage"]??"default",fadeInDuration:Duration(milliseconds: 500) ,fit: BoxFit.cover,progressIndicatorBuilder: (context, url, downloadProgress) => Container(color: Colors.grey[300]),errorWidget: (context, url, error) => Center(child: Icon(Icons.error))),
            ),
            leading:buttonRoundAppBar(onPressed:(){Navigator.of(context).pop();},context: context,icon: Icons.arrow_back,edgeInsets: EdgeInsets.all(8.0)),
      actions: [
        buttonRoundAppBar(onPressed: (){},context: context,icon: Icons.new_releases,child: WidgetsUtilsApp().buttonThemeBrightness(context: context),edgeInsets: EdgeInsets.only(right: 2.0,top: 8.0,bottom: 8.0)),
        buttonRoundAppBar(onPressed: (){},context: context,icon: Icons.shopping_bag_outlined,edgeInsets: EdgeInsets.only(right: 2.0,top: 8.0,bottom: 8.0)),
      ],
          );
  }
  SliverToBoxAdapter _sliverContentInfo() { 
    return SliverToBoxAdapter(
      child: Container(
        height: 400,width: double.infinity,
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Boutieque".toUpperCase(),style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold)),
                SizedBox(height: 20),
                Text("Nos definimos como una empresa joven dedicada a la comercialización y distribución de artículos de moda urbana. Actualizamos constantemente nuestro plan de trabajo y nos adaptamos a las necesidades de quienes nos eligen, asumiendo el compromiso de brindar el mejor servicio y la mejor atención",textAlign: TextAlign.center,style: TextStyle(fontSize: 14,fontWeight: FontWeight.normal)),
              ],
            ),
          ),
        )
      )
    );
  }
  Widget _buildTitleBubble() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12,vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Explore nuestra nueva colección",style:TextStyle(fontSize: 20,color: colorText,fontWeight:FontWeight.normal)),
            ],
          ),
        ),
        SizedBox(
          height: 110.0,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: category.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    InkWell(onTap: (){setState((){indexCategory=index;});},child: Card(clipBehavior: Clip.antiAlias,shape: CircleBorder(),elevation: 10.0,margin: EdgeInsets.all(0.0),child: CircleAvatar(radius: 30,backgroundColor: Colors.white,child: CircleAvatar(radius: indexCategory==index?28:30,backgroundImage:NetworkImage(category[index]["url_image"]), backgroundColor: Colors.grey,)))),
                    Padding(padding: const EdgeInsets.only(top: 8.0),child: Text(category[index]["name"],style: TextStyle(color: colorText),),),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
  Widget _gridViewProducts({required BuildContext context}){

    SliverGridDelegateWithMaxCrossAxisExtent gridDelegate =SliverGridDelegateWithMaxCrossAxisExtent(
      maxCrossAxisExtent: 300.0,
      crossAxisSpacing: 0.0,
      mainAxisSpacing: 1.0,
      childAspectRatio: 200 / 290,
    );
    return SliverGrid(
            gridDelegate: gridDelegate,
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index){ 
                return FadeInUp(key:Key( DateTime.now().toString()),child: CardProduct(colorAccent: colorAccent,obj: category[indexCategory]["products"][index]),delay: const Duration(milliseconds: 500),);
              },
              childCount: category[indexCategory]["products"].length,
            )
    );
  }
  // WIDGETS COMPONENTS
  Widget buttonRoundAppBar({required void Function() onPressed,required BuildContext context,Widget ?child,required IconData icon,required EdgeInsets edgeInsets})=>Material(color: Colors.transparent,child: Center( child: Padding(padding: const EdgeInsets.all(8.0),child: Ink(decoration: ShapeDecoration(color: Brightness.dark==Theme.of(context).brightness?Colors.black:Colors.white,shape: CircleBorder()), child: child==null?IconButton(icon: Icon(icon),color:Brightness.dark==Theme.of(context).brightness?Colors.white:Colors.black,onPressed: onPressed):child))));
}

// CLASS WIDGETS COMPONENTS

class SearchBox extends StatefulWidget {
  SearchBox({Key? key}) : super(key: key);

  @override
  _SearchBoxState createState() => _SearchBoxState();
}
class _SearchBoxState extends State<SearchBox> {

  // var
  TextEditingController textEditingController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: new Card(
        elevation: 0,
        shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
          decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.grey.shade400,Theme.of(context).brightness==Brightness.dark?Colors.grey.shade900:Colors.grey.shade100],begin: Alignment.centerLeft,end: Alignment.centerRight),borderRadius: BorderRadius.circular(20)),
          child: new ListTile(
            leading: new Icon(Icons.search,color: Colors.white),
            title: new TextField(
              controller: textEditingController,
              decoration: new InputDecoration(hintText: 'Buscar', border: InputBorder.none,hintStyle: TextStyle(color: Colors.white),labelStyle: TextStyle(color: Colors.white)),
              onChanged: (_){setState(() {});},
            ),
            trailing: new IconButton(
              icon: CircleAvatar(backgroundColor: textEditingController.text!=""?Colors.grey:Theme.of(context).primaryColor,child: new Icon(textEditingController.text!=""?Icons.clear:Icons.filter_list_outlined,color: Colors.white)),
              onPressed: () {setState(() {textEditingController.clear();});},
            ),
          ),
        ),
      ),
    );
  }
}
// CardProduct
class CardProduct extends StatefulWidget {
  CardProduct({required this.obj,this.colorAccent=Colors.purple});
  late final Map obj;
  late final Color colorAccent;

  @override
  _CardProductState createState() => _CardProductState();
}
class _CardProductState extends State<CardProduct>  with SingleTickerProviderStateMixin{
  Color colorFond = Colors.red.shade100.withOpacity(0.1);

  late double _scale;

  late AnimationController _controller;

  /// FUNCTION
  void _tapDown(TapDownDetails details) =>  _controller.forward();
  void _tapUp(TapUpDetails details) =>  _controller.reverse();

  @override
  void initState() {
    _controller = AnimationController(vsync: this,duration: Duration(milliseconds: 500,),lowerBound: 0.0,upperBound: 0.1,)..addListener(() {setState(() {});});
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {

    _scale = 1 - _controller.value;

    return Transform.scale(
      scale: _scale,
      child: Card(
        elevation: 10.0,
        clipBehavior: Clip.antiAlias,
        color: colorFond.withOpacity(0.5),
        margin: EdgeInsets.all(12.0),
        shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: GestureDetector(
          onTapDown: _tapDown,
          onTapUp:_tapUp,
          onTap:(){},
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(imageUrl: widget.obj["url_image"],fit: BoxFit.cover,errorWidget: (context, url, error) => Center(child: Icon(Icons.error)),placeholder: (context, url) => Container(color: Colors.grey,),),
              Column(
                children: [
                  Row(
                    children: [
                      Expanded(child: Container()),
                      Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(Icons.star,size: 16,color:widget.colorAccent.withOpacity(0.7)),
                            Text(widget.obj["point"],style:TextStyle(color:widget.colorAccent.withOpacity(0.5),fontSize: 14,fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Expanded(child: Container()),
                  _buildContentInfo(obj: widget.obj),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Card _buildContentInfo({required var obj}) {
    return Card(
              shape: new RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
              clipBehavior: Clip.hardEdge,
              color: Colors.transparent,
              child:  new ClipRect(
                child: new BackdropFilter(
                  filter: new ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: new Container(
                    padding: EdgeInsets.all(12.0),
                    width: double.infinity,
                    decoration: new BoxDecoration( color: Colors.grey.shade200.withOpacity(0.3)),
                    child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(obj["title"],style:TextStyle(color:Colors.white,fontSize: 14,fontWeight: FontWeight.bold),overflow: TextOverflow.ellipsis,maxLines: 2,),
                  Text("\$"+widget.obj["price"],style:TextStyle(color:Colors.white,fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.end),
                ],
              ),
                  ),
                ),
              ),
            );
  }
}
// BottomNavigationBar
class BottomNavigationBar extends StatefulWidget {
  BottomNavigationBar({this.colorAccent=Colors.purple});

  late final Color colorAccent;

  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}
class _BottomNavigationBarState extends State<BottomNavigationBar> {

  var currentIndex = 0;
  List<IconData> listOfIcons = [Icons.home_rounded,Icons.favorite_rounded,Icons.person_rounded];

  @override
  Widget build(BuildContext context) {

    double _width = MediaQuery.of(context).size.width;

    return Container(
        margin: EdgeInsets.all(20),
        height: _width * .140,
        decoration: BoxDecoration(color: Colors.white,boxShadow: [BoxShadow( color: Colors.black.withOpacity(.15),blurRadius: 30,offset: Offset(0, 10))],borderRadius: BorderRadius.circular(50)),
        child: ListView.builder(shrinkWrap: true,
          itemCount: listOfIcons.length,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: _width * .024),
          itemBuilder: (context, index) => InkWell(
            onTap: () {setState(() {currentIndex = index;print(index);}); },
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AnimatedContainer(
                  duration: Duration(milliseconds: 1500),
                  curve: Curves.fastLinearToSlowEaseIn,
                  margin: EdgeInsets.only(bottom: index == currentIndex ? 0 : _width * .029,right: _width * .0422,left: _width * .0422),
                  width: _width * .128,
                  height: index == currentIndex ? _width * .014 : 0,
                  decoration: BoxDecoration(color: widget.colorAccent,borderRadius: BorderRadius.vertical(bottom: Radius.circular(10))),
                ),
                Icon(listOfIcons[index],size: _width * .076, color: index == currentIndex? widget.colorAccent : Colors.black38 ),
                SizedBox(height: _width * .01),
              ],
            ),
          ),
        ),
      );
  }
}
