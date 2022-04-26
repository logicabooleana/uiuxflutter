
import 'dart:math';
import 'package:desingapp/src/utils/widget_with_codeview/source_code_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'widgets_utils_app.dart';

class CodeFileWidget extends StatefulWidget {
  final String recipeName;
  final String codeFilePath;

  CodeFileWidget({this.recipeName = "", required this.codeFilePath});

  @override
  CodeFileWidgetState createState() {
    return CodeFileWidgetState();
  }

  Future<Navigator?> navigation(BuildContext context) {
    return Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => CodeFileWidget(
                recipeName: recipeName, codeFilePath: codeFilePath)));
  }

  // [ START - Vista ButtonIcon ]
  IconButton getIConButtonView(
      {required BuildContext context, Color color = Colors.white}) {
    return IconButton(
        icon: Theme.of(context).brightness == Brightness.dark
            ? Icon(Icons.code, size: 24.0, color: color)
            : Icon(Icons.code, size: 24.0, color: color),
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => CodeFileWidget(
                      recipeName: recipeName, codeFilePath: codeFilePath)));
        });
  }
  // [FINISH . Vista ButtonIcon ]

}

class CodeFileWidgetState extends State<CodeFileWidget> {
  // admob
  final BannerAd bannerAd = BannerAd(
    adUnitId:
        'ca-app-pub-3940256099942544/6300978111', //TODO : release: 'ca-app-pub-8441738551183357/7168683003' , test: 'ca-app-pub-3940256099942544/6300978111',
    request: AdRequest(),
    size: AdSize.banner,
    listener: BannerAdListener(
      onAdLoaded: (Ad ad) {
        print('################################## onAdLoaded:  $ad.');
      },
      onAdFailedToLoad: (Ad ad, LoadAdError error) {
        print('################################## onAdFailedToLoad: $ad ');
        ad.dispose();
      },
      onAdOpened: (Ad ad) {
        {
          print('################################## onAdOpened. $ad');
        }
      },
      onAdClosed: (Ad ad) {
        print('################################## onAdClosed.  $ad');
      },
      onAdWillDismissScreen: (Ad ad) {
        print('################################## onAdWillDismissScreen. $ad');
      },
    ),
  );

  late String sContentCode;
  double scaleFactorText = 1.0;

  Future<void> saveStorage(
      {required String filename, required String content}) async {
    /* String directory = await AndroidExternalStorage.getExternalStoragePublicDirectory(DirType.downloadDirectory) as String; 
            final path = '$directory/$filename';
            final file = File(path);
            await file.writeAsString(content); */
  }

  @override
  void initState() {
    super.initState();
    bannerAd.load();
  }
  @override
  void dispose(){

  }

  @override
  Widget build(BuildContext context) {

    final AdWidget adWidget = AdWidget(ad: bannerAd);
    final Container adContainer = Container(
      alignment: Alignment.center,
      child: adWidget,
      width: bannerAd.size.width.toDouble(),
      height: bannerAd.size.height.toDouble(),
    );

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text("Código fuente"),
        actions: <Widget>[
          WidgetsUtilsApp().buttonThemeBrightness(context: context)
        ],
      ),
      body: FutureBuilder(
        future: rootBundle.loadString(widget.codeFilePath),
        builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
              sContentCode = snapshot.data ?? widget.codeFilePath;
              if (snapshot.hasData) {
                return Scaffold(
                  body: Padding(
                    padding: EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Expanded(child: SourceCodeView(titleCode:widget.recipeName ,filePath:widget.codeFilePath),),
                    adContainer,
                  ],
                ), 
              ),
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
    );



  }

  List<Widget> fabButtons(BuildContext context) {
    return <Widget>[
      FloatingActionButton(
        heroTag: "copy",
        child: Icon(Icons.content_copy),
        tooltip: 'Copiar codigo a porta papeles',
        onPressed: () => setState(() {
          Clipboard.setData(ClipboardData(text: sContentCode));
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Codigo copiado en porta papeles')));
        }),
      ),
      FloatingActionButton(
          heroTag: "decargar",
          child: Icon(Icons.file_download),
          tooltip: 'Decargar codigo en Descargas',
          onPressed: () async {
            /*  Verificaa el permiso de escritura */
            if (await Permission.storage.isGranted) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text('Se descargo el archivo.txt en DESCARGAS')));
              saveStorage(
                  filename: "${widget.recipeName}.txt", content: sContentCode);
            } else {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'Permiso de escritura denegado! por favor revise los permisos de la aplicación')));
              /*  Solicitar directamente el permiso sobre su estado. */
              Map<Permission, PermissionStatus> statuses =
                  await [Permission.storage].request();
            }
          }),
      FloatingActionButton(
        heroTag: "zoom_out",
        child: Icon(Icons.zoom_out),
        tooltip: 'Zoom out',
        onPressed: () => setState(() {
          this.scaleFactorText = max(0.3, this.scaleFactorText - 0.1);
        }),
      ),
      FloatingActionButton(
        heroTag: "zoom_in",
        child: Icon(Icons.zoom_in),
        tooltip: 'Zoom in',
        onPressed: () => setState(() {
          this.scaleFactorText += 0.1;
        }),
      ),
    ];
  }

  Widget adsWidget({required BannerAd ad}) {
    return Center(
      child: Container(
        alignment: Alignment.center,
        child: AdWidget(ad: ad),
        width: ad.size.width.toDouble(),
        height: ad.size.height.toDouble(),
      ),
    );
  }
}
