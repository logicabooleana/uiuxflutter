import 'dart:io';
import 'dart:math';
import 'package:external_path/external_path.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:permission_handler/permission_handler.dart';
import 'syntax_highlighter.dart';

// You can also test with your own ad unit IDs by registering your device as a
// test device. Check the logs for your device's ID value.
const String testDevicek = '2E6EADFFA12381E282624A46188BF58D';
const int maxFailedLoadAttempts = 3;

class SourceCodeView extends StatefulWidget {
  final String filePath;
  final String? codeLinkPrefix;
  final String titleCode;

  const SourceCodeView({Key? key, required this.filePath,this.titleCode="uiux_flutter_code", this.codeLinkPrefix})
      : super(key: key);

  @override
  _SourceCodeViewState createState() {
    return _SourceCodeViewState();
  }
}

class _SourceCodeViewState extends State<SourceCodeView> {

  // Var
  static final AdRequest request = AdRequest(
    keywords: <String>['developer', 'computer','programmer'],
    nonPersonalizedAds: true,
  );

  InterstitialAd? _interstitialAd;
  int _numInterstitialLoadAttempts = 0;
  double _textScaleFactor = 1.0;

  Future<void> saveStorage({required String filename, required String content}) async {
    String directory;
    directory = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
    final path = '$directory/$filename.txt';
    final file = File(path);
    await file.writeAsString(content);
  }
  // Formatea el código fuente
  Widget _getCodeView(String codeContent, BuildContext context) {
    
    codeContent = codeContent.replaceAll('\r\n', '\n');
    final SyntaxHighlighterStyle style = Theme.of(context).brightness == Brightness.dark? SyntaxHighlighterStyle.darkThemeStyle(): SyntaxHighlighterStyle.lightThemeStyle();
    
    return Container(
      constraints: BoxConstraints.expand(),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: SelectableText.rich(
          TextSpan(
            style: GoogleFonts.droidSansMono(fontSize: 12).apply(fontSizeFactor: this._textScaleFactor),
              children: <TextSpan>[ DartSyntaxHighlighter(style).format(codeContent)  ],
          ),
          style: DefaultTextStyle.of(context).style.apply(fontSizeFactor: this._textScaleFactor),
        ),
      ),
    );
  }

  List<SpeedDialChild> _buildFloatingButtons({required String title ,required String code}) {
    return <SpeedDialChild>[
      SpeedDialChild(
          child: Icon(Icons.content_copy),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onTap: () {
            Clipboard.setData(ClipboardData(text: code));
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Codigo copiado en porta papeles')));
          },
      ),
      SpeedDialChild(
          child: Icon(Icons.file_download),
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onTap: () async {
          
          /*  Verificaa el permiso de escritura */
          if (await Permission.storage.isGranted) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Se descargo el archivo.txt en DESCARGAS')));
            saveStorage(filename: "$title"+"_code",content:code);
          }else{
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Permiso de escritura denegado! por favor revise los permisos de la aplicación')));
            /*  Solicitar directamente el permiso sobre su estado. */
            Map<Permission, PermissionStatus> statuses = await [Permission.storage,Permission.storage,].request();
            print(statuses[Permission.location]);
          }
        },
      ),
      SpeedDialChild(
        child: Icon(Icons.zoom_out),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onTap: () => setState(() {
          this._textScaleFactor = max(0.8, this._textScaleFactor - 0.1);
        }),
      ),
      SpeedDialChild(
        child: Icon(Icons.zoom_in),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        onTap: () => setState(() {
          this._textScaleFactor += 0.1;
        }),
      ),
    ];
  }

  void _createInterstitialAd() {
    InterstitialAd.load(
      // TODO : UPDATE ID for release ( InterstitialAd )
        adUnitId: InterstitialAd.testAdUnitId, //"ca-app-pub-8441738551183357/3829815326",// InterstitialAd.testAdUnitId,
        request: request,
        adLoadCallback: InterstitialAdLoadCallback(
          onAdLoaded: (InterstitialAd ad) {
            _interstitialAd = ad;
            _numInterstitialLoadAttempts = 0;
          },
          onAdFailedToLoad: (LoadAdError error) {
            print('InterstitialAd failed to load: $error.');
            _numInterstitialLoadAttempts += 1;
            _interstitialAd = null;
            if (_numInterstitialLoadAttempts <= maxFailedLoadAttempts) {
              _createInterstitialAd();
            }
          },
        ));
  }

  void _showInterstitialAd() {
    if (_interstitialAd == null) {
      print('Warning: attempt to show interstitial before loaded.');
      return;
    }
    _interstitialAd!.fullScreenContentCallback = FullScreenContentCallback(
      onAdShowedFullScreenContent: (InterstitialAd ad) =>
          print('ad onAdShowedFullScreenContent.'),
      onAdDismissedFullScreenContent: (InterstitialAd ad) {
        print('$ad onAdDismissedFullScreenContent.');
        ad.dispose();
        _createInterstitialAd();
      },
      onAdFailedToShowFullScreenContent: (InterstitialAd ad, AdError error) {
        print('$ad onAdFailedToShowFullScreenContent: $error');
        ad.dispose();
        _createInterstitialAd();
      },
    );
    _interstitialAd!.show();
    _interstitialAd = null;
  }

  @override
  void initState() {
    super.initState();
    _createInterstitialAd();
    Future.delayed(Duration(seconds: 5), () => _showInterstitialAd()  );
  }
  @override
  void dispose() {
    super.dispose();
    _interstitialAd?.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DefaultAssetBundle.of(context).loadString(widget.filePath),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return Scaffold(
            body: Padding(padding: EdgeInsets.all(4.0),child: _getCodeView(snapshot.data!, context)),
            floatingActionButton: SpeedDial(
              renderOverlay: false,
              overlayOpacity: 0,
              children: _buildFloatingButtons(title:widget.titleCode,code:snapshot.data!),
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              activeBackgroundColor: Colors.red,
              activeForegroundColor: Colors.white,
              icon: Icons.menu,
              activeIcon: Icons.close,
            ),
          );
        } else { return Center(child: CircularProgressIndicator());}
      },
    );
  }
}
