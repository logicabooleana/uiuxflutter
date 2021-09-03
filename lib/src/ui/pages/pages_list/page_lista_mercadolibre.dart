/// Copyright 2020 Logica Booleana Authors

// Dependencias */
import 'package:flutter/material.dart';
// Los link de de las depedencias se pueden encontrar en "Más" => Dependencias */
import 'package:cached_network_image/cached_network_image.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageListMercadoLibre extends StatelessWidget {
  PageListMercadoLibre({Key ?key}) : super(key: key);

  // var
  late Size  screenSize;

  @override
  Widget build(BuildContext context) {

    // var
    screenSize = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.yellow[600],
      appBar:appbar(),
      body: body(),
      drawer:Drawer() ,
    );
  }
  // WIDGETS VIEWS
  PreferredSizeWidget appbar(){
    return AppBar(
      backgroundColor: Colors.yellow[600],
      elevation: 0.0,
      toolbarHeight: 90.0,
      brightness: Brightness.dark,
      iconTheme:IconThemeData(color:Colors.grey[800]),
      title: buttonBuscador(),
      actions: [Padding(
        padding: const EdgeInsets.all(12.0),
        child: Icon(Icons.add_shopping_cart,color: Colors.black54,),
      )],
      bottom: PreferredSize(
          preferredSize: Size.fromHeight(20.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(Icons.location_on, size: 14.0, color: Colors.black45),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("Enviar a Capital Federal",style: TextStyle(color: Colors.black45, fontSize: 14.0)),
                ),
                Icon(Icons.arrow_forward_ios,
                    size: 14.0, color: Colors.black45),
              ],
            ),
          ),
        ),
    );
  }
  Widget body(){
    return Container(
        color: Colors.grey[100],
        child: ListView(
          children: [
            horizontalCards(),
            // Lista horizontal de botones
            ListButtonsHorizontal(),
            //  creamos algunas vista de prueba de productos en venta
            CardOfertas(
              cuotasSinIntes: 3,
              flash: true,
              url:"https://saborstore.com/wp-content/uploads/2019/10/Remera-SkateCho-Rosa-Negro-Frente.jpg",
              title: "Oferta temporal",
              descripcion:"Remeras Lisas Mujer Manga Corta Algodón 24 Colores!",
              precio: 600,
              textoButton: "Ver todas las ofertas temporales",
            ),
            CardOfertas(
              envioGratis: true,
              flash: true,
              cuotasSinIntes: 12,
              url:"https://i.pinimg.com/originals/02/4f/5c/024f5c0cf3c14327785c2d68873d658c.jpg",
              title: "Visto recuentemente",
              descripcion:"Pantalon Jogger Cargo Chupin Gabardina Rofor Slim Work Hard",
              precio: 8500,
              textoButton: "Ver historial de navegacion",
            ),
            CardOfertas(
              cuotasSinIntes: 24,
              flash: true,
              envioGratis: true,
              url:"https://www.casasilvia.com/media/catalog/product/cache/1/image/650x/040ec09b1e35df139433887a97daa66f/p/h/philco-split-2f.jpg",
              title: "Oferta del dia",
              descripcion:"Aire Acondicionado Philco Split Frío/calor 2881 Frígorias Blanco 220v - 250v",
              precio: 49000,
              textoButton: "Ver todas las ofertas",
            ),
            CardOfertas(
              flash: true,
              url:"https://http2.mlstatic.com/D_NQ_NP_662410-MLA42163720986_062020-O.jpg",
              title: "¡Lleva tu favorito!",
              descripcion:"Soporte Brazo Flexible Para Celular - Agarre Con Pinzas",
              precio: 730,
              textoButton: "Ver todas los favoritos",
            ),
          ],
        ),
      );
  }
  Widget horizontalCards(){
    
    return Container(
      decoration: new BoxDecoration(gradient: LinearGradient(colors: [Colors.yellow[600]!,Colors.grey[100]!],stops: [0.3,0.8], begin: FractionalOffset.topCenter,end: FractionalOffset.bottomCenter)),
      margin:EdgeInsets.symmetric(vertical: 0.0),
      width:double.infinity,
      height: 180.0,
      child: ListView(
        scrollDirection:Axis.horizontal,
        children: [
          cardPublicidad(url: "https://infogei.com/uploads/noticias/5/2020/07/20200729153013_hot-sale-mercado-libre.jpg"),
          cardPublicidad(url: "https://www.ingenierowhite.com/sitio_core/wp-content/uploads/2018/06/mercado-libre-app.jpg"),
          cardPublicidad(url: "https://www.webretail.com.ar/v2/wp-content/uploads/2019/09/Mostaza-Hamburguesa.jpg"),
        ],
      ),
    );
  }
  /// WIDGETS COMPONENTS
  Widget buttonBuscador(){
    return Container(
      width: double.infinity,
      child: ElevatedButton.icon(
          onPressed: (){},
          icon: Icon(Icons.search,color: Colors.grey,size: 16.0,),
          label: Text("Busca en Mercado Libre",style: TextStyle(fontSize: 14.0,color: Colors.grey,fontWeight:FontWeight.w500)),
          style: ButtonStyle(elevation: MaterialStateProperty.all<double?>(0),backgroundColor: MaterialStateProperty.all<Color>(Colors.white),shape:MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))) ),
        ),
    );
  }
  Widget cardPublicidad({ required String url}){
    return Padding(
      padding: const EdgeInsets.all(1.0),
      child:Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0),),
        child:InkWell(
          onTap:(){},
          child: Container(
              width: screenSize.width*0.90,
              height: 100.0,
              decoration: BoxDecoration(shape: BoxShape.circle),
              child: CachedNetworkImage(fadeInDuration: Duration(milliseconds: 200),fit: BoxFit.cover,imageUrl:url,placeholder: (context, urlImage) => Container(color: Colors.grey),errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey))),
            ),
        ),
      ),
    );
  }
}

class ListButtonsHorizontal extends StatelessWidget {
  const ListButtonsHorizontal({Key ?key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:EdgeInsets.only(top: 12.0),
      height: 130.0,
      width: double.infinity,
      child: ListView(
        shrinkWrap:true,
        scrollDirection:Axis.horizontal,
        children: [
          buttonCircle(icon: FontAwesomeIcons.qrcode,texto: "Pagar con QR"),
          buttonCircle(icon: Icons.local_offer,texto: "Ofertas del día"),
          buttonCircle(icon: Icons.camera_enhance,texto: "Electrodomesticos"),
          buttonCircle(icon: Icons.shopping_basket,texto: "Supermercado"),
          buttonCircle(icon: Icons.directions_car,texto: "Autos, motos y otros"),
          buttonCircle(icon: Icons.add,texto: "ver más"),
        ],
      ),
    );
  }
  Widget buttonCircle({ required String texto, required IconData icon}){
    
    // var
    double sizeIcon=60.0;

    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment:MainAxisAlignment.start,
        children: [
          Container(width: sizeIcon,height: sizeIcon,child: RawMaterialButton(onPressed: () {},elevation: 1.0,fillColor: Colors.white,child: Icon(icon,size: sizeIcon/2,color: Colors.black45,),padding: EdgeInsets.all(15.0),shape: CircleBorder())),
          Padding(padding: const EdgeInsets.symmetric(vertical: 8.0),child: Container(width: 70.0,child: Text(texto, maxLines:2,overflow:TextOverflow.ellipsis,textAlign:TextAlign.center,style: TextStyle(color: Colors.black45,fontSize: 10.0)))),
        ],
      ),
    );
  }
}

// CLASS COMPONENTS
class CardOfertas extends StatelessWidget {
  const CardOfertas({this.title = "",this.descripcion = "",this.url="", this.precio=0, this.textoButton="",this.flash=false,this.envioGratis=false,this.cuotasSinIntes=0});
  // var
  final int cuotasSinIntes;
  final bool envioGratis;
  final bool flash;
  final String url;
  final String title;
  final String descripcion;
  final int precio;
  final String textoButton;
  
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Card(
        color: Colors.white,
        elevation: 10,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
        clipBehavior: Clip.antiAlias,
        child: InkWell(
          onTap: () {},
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  title!=""?Padding(padding: const EdgeInsets.all(16.0),child: Text(title,textAlign: TextAlign.start,style: TextStyle(color: Colors.black,fontSize: 18.0,fontWeight: FontWeight.normal)),):Container(),
                  title!=""?Divider(color:Colors.grey[400],height: 1.0):Container(),
                  widgetImagenProducto(urlImage: this.url),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.start,
                      children: [
                        Text(descripcion,style: TextStyle(color: Colors.grey[700])),
                        Row(
                          children: [
                            Text("\$ "+precio.toString(),style: TextStyle(color: Colors.black87,fontSize: 20.0,fontWeight: FontWeight.normal)),
                            Text("", style: TextStyle(color: Colors.black)),
                          ],
                        ),
                        cuotasSinIntes!=0.0?Padding(padding: const EdgeInsets.symmetric(vertical: 3.0),child: Text(cuotasSinIntes.toString()+"x \$ ${(precio/cuotasSinIntes).toStringAsFixed(2)} sin interés",style: TextStyle(fontSize: 14.0, color: Colors.green[600]),textAlign:TextAlign.start),):Container(),
                        envioGratis?Padding(padding: const EdgeInsets.symmetric(vertical: 3.0),child: Text("Envío Gratis",style: TextStyle(fontSize: 14.0, color: Colors.green[600]),textAlign:TextAlign.start),):Container(),
                        flash?Padding(padding: const EdgeInsets.symmetric(vertical: 3.0),child: Row(children: [Icon(Icons.flash_on,size: 14.0,color: Colors.green),Text("Flash",style: TextStyle(fontSize: 14.0, color: Colors.green[600]))])):Container(),
                      ],
                    ),
                  ),
                  Divider(color:Colors.grey[300],height: 0.0),
                  InkWell(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          Expanded(child: Text(textoButton,textAlign: TextAlign.start,style: TextStyle(fontSize: 14.0, color: Colors.blue))),
                          Icon(Icons.arrow_forward_ios,color: Colors.blue,size: 14.0),
                        ],
                      ),
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
  /// Un widget imagen que intenta ajustar el tamaño del niño a una relación de aspecto específica 
  Widget widgetImagenProducto({ required String urlImage}) {
    return AspectRatio(
      aspectRatio: 100 / 100,
      child: urlImage != ""
          ? CachedNetworkImage(
              fadeInDuration: Duration(milliseconds: 200),
              fit: BoxFit.cover,
              imageUrl: urlImage,
              placeholder: (context, urlImage) => FadeInImage(fit: BoxFit.cover,image: AssetImage("assets/loading.gif"),placeholder: AssetImage("assets/loading.gif")),
              errorWidget: (context, urlImage, error) => Center(child: Container(color: Colors.grey)),
          ):Container(color: Colors.black26),
    );
  }
}
