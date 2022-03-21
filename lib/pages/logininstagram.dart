
// import 'package:flutter/material.dart';
// import 'package:flutter/material.dart';
// import 'package:simple_auth/simple_auth.dart' as simpleAuth;
// import 'package:simple_auth_flutter/simple_auth_flutter.dart';
//  class instagram extends StatelessWidget {
//    const instagram({ Key? key }) : super(key: key);
 
//    @override
//    Widget build(BuildContext context) {
//      return  MyApp();
//    }
//  }

// class MyApp extends StatelessWidget {

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     SimpleAuthFlutter.init(context);
//     return new MaterialApp(
//       title: 'Flutter Demo',
//       theme: new ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
//         // counter didn't reset back to zero; the application is not restarted.
//         primarySwatch: Colors.blue,
//       ),
//       home: new MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   MyHomePage({Key? key, this.title}) : super(key: key);

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String? title;

//   @override
//   _MyHomePageState createState() => new _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;
//   final simpleAuth.GoogleApi googleApi = new simpleAuth.GoogleApi("google",
//       "992461286651-k3tsbcreniknqptanrugsetiimt0lkvo.apps.googleusercontent.com",
//       "redirecturl",
//       clientSecret: "avrYAIxweNZwcHpsBlIzTp04",
//       scopes: [
//         "https://www.googleapis.com/auth/userinfo.email",
//         "https://www.googleapis.com/auth/userinfo.profile"
//       ]);

//   void _incrementCounter() async {
//     var profile = await googleApi.getUserProfile();
//     print(profile.name);
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return new Scaffold(
//       appBar: new AppBar(
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: new Text(widget.title!),
//       ),
//       body: new Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: new Column(
//           // Column is also layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Invoke "debug paint" (press "p" in the console where you ran
//           // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
//           // window in IntelliJ) to see the wireframe for each widget.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             new Text(
//               'You have pushed the button this many times:',
//             ),
//             new Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headline4,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: new FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: new Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }















// // library instagram_media;

// // import 'dart:async';
// // import 'package:http/http.dart';
// // import 'package:meta/meta.dart';
// // import 'package:flutter/material.dart';
// // import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// // import 'package:http/http.dart' as http;
// // import 'dart:convert';

// // class InstagramMedia extends StatefulWidget {
// //   final String appID;
// //   final String appSecret;
// //   final int mediaTypes;
// //   InstagramMedia(
// //       {required this.appID,
// //       required this.appSecret,
// //       required this.mediaTypes})
// //       : assert(appID != null),
// //         assert(mediaTypes != null),
// //         assert(appSecret != null);
// //   /*
// //   mediaTypes options:
// //   0 - images only (No CAROUSEL_ALBUM)
// //   1 - videos only (No CAROUSEL_ALBUM)
// //   2 - images and videos (No CAROUSEL_ALBUM)
// //   3 - everything - everything (CAROUSEL_ALBUM, VIDEO, IMAGE)
// //   */

// //   @override
// //   _InstagramMediaState createState() => _InstagramMediaState();
// // }

// // class _InstagramMediaState extends State<InstagramMedia> {
// //   final webViewPlugin = FlutterWebviewPlugin();
// //   StreamSubscription<String>? _onUrlChanged;
// //   GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

// //   String? accessToken;
// //   String? accessCode;
// //   String? igUserID;

// //   int stage = 0;

// //   @override
// //   void initState() {
// //     super.initState();
// //     _onUrlChanged = webViewPlugin.onUrlChanged.listen((String url) {
// //       if (mounted) {
// //         if (url.contains("code=")) {
// //           setState(() {
// //             accessCode = (url.split("code=")[1]).replaceAll("#_", "");
// //             stage = 1;
// //           });
// //           var map = new Map<String, dynamic>();
// //           map['client_id'] = widget.appID;
// //           map['client_secret'] = widget.appSecret;
// //           map['grant_type'] = 'authorization_code';
// //           map['redirect_uri'] = 'https://httpstat.us/200';
// //           map['code'] = accessCode;
// //           _getShortLivedToken(map);
// //         }
// //       }
// //     });
// //   }

// //   @override
// //   void dispose() {
// //     _onUrlChanged!.cancel();
// //     webViewPlugin.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     String urlOne =
// //         "https://instagram.com/oauth/authorize/?client_id=${widget.appID}&redirect_uri=https://httpstat.us/200&&scope=user_profile,user_media&response_type=code&hl=en";

// //     return Scaffold(
// //         body: StreamBuilder(
// //             stream: Stream.value(stage),
// //             builder: (context, stageSnap) {
// //               if (stageSnap.data == 0) {
// //                 return WebviewScaffold(
// //                   key: scaffoldKey,
// //                   appBar: AppBar(
// //                     title: Text('Instagram'),
// //                     centerTitle: true,
// //                   ),
// //                   url: urlOne,
// //                 );
// //               } else if (stageSnap.data == 1) {
// //                 return Container(
// //                   color: Colors.transparent,
// //                   width: MediaQuery.of(context).size.width,
// //                   height: MediaQuery.of(context).size.height,
// //                   child: Center(
// //                     child: Text('Fetching Media...'),
// //                   ),
// //                 );
// //               }
// //               return Container(
// //                 color: Colors.transparent,
// //                 width: MediaQuery.of(context).size.width,
// //                 height: MediaQuery.of(context).size.height,
// //                 child: Center(
// //                   child: Text('Fetching Media...'),
// //                 ),
// //               );
// //             }));
// //   }

// //   _getShortLivedToken(map) async {
// //      var urltwo = Uri.parse('https://api.instagram.com/oauth/access_token');
// //     //String urlTwo = 'https://api.instagram.com/oauth/access_token';
// //    // http.Response response = await http.post(urlTwo, body: map);
// //       Response  response  = await http.get(urltwo);
// //     var respData = json.decode(response.body);
// //     setState(() {
// //       accessToken = respData['access_token'];
// //       igUserID = (respData['user_id']).toString();
// //     });
// //     _getMedia(context);
// //   }

// //   _getMedia(context) async {
// //     var mediaUrls = [];
// //     var mediaTimestamps = [];
// //     var mediaIDs = [];
// //     var mediaTypes = [];
// //     var mediaCaptions = [];
// //     var respData;
// //         var urlthree = Uri.parse('https://graph.instagram.com/' + igUserID! + '/media?access_token=' +accessToken! + '&fields=timestamp,media_url,media_type,caption');



        
// //     //var response = await http.post(urlthree, body: param);
// //     //String urlThree = 'https://graph.instagram.com/' + igUserID! + '/media?access_token=' +accessToken! + '&fields=timestamp,media_url,media_type,caption';
// //     //http.Response response = await http.get(urlThree);
// //      Response  response  = await http.get(urlthree);
// //     respData = (json.decode(response.body))['data'];
// //     for (var i = 0; i < respData.length; i++) {
// //       if (widget.mediaTypes == 0 && (respData[i])['media_type'] == 'IMAGE') {
// //         mediaUrls.add((respData[i])['media_url']);
// //         mediaTimestamps.add((respData[i])['timestamp']);
// //         mediaIDs.add((respData[i])['id']);
// //         mediaTypes.add((respData[i])['media_type']);
// //         mediaCaptions.add((respData[i])['caption']);
// //       } else if (widget.mediaTypes == 1 &&
// //           (respData[i])['media_type'] == 'VIDEO') {
// //         mediaUrls.add((respData[i])['media_url']);
// //         mediaTimestamps.add((respData[i])['timestamp']);
// //         mediaIDs.add((respData[i])['id']);
// //         mediaTypes.add((respData[i])['media_type']);
// //         mediaCaptions.add((respData[i])['caption']);
// //       } else if (widget.mediaTypes == 2 &&
// //           ((respData[i])['media_type'] == 'VIDEO' ||
// //               (respData[i])['media_type'] == 'IMAGE')) {
// //         mediaUrls.add((respData[i])['media_url']);
// //         mediaTimestamps.add((respData[i])['timestamp']);
// //         mediaIDs.add((respData[i])['id']);
// //         mediaTypes.add((respData[i])['media_type']);
// //         mediaCaptions.add((respData[i])['caption']);
// //       } else if (widget.mediaTypes == 3) {
// //         mediaUrls.add((respData[i])['media_url']);
// //         mediaTimestamps.add((respData[i])['timestamp']);
// //         mediaIDs.add((respData[i])['id']);
// //         mediaTypes.add((respData[i])['media_type']);
// //         mediaCaptions.add((respData[i])['caption']);
// //       }
// //     }

// //     var returnData = [mediaUrls, mediaTimestamps, mediaIDs, mediaTypes, mediaCaptions];
// //     Navigator.of(context).pop(returnData);
// //   }
// // }