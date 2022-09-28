import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Webview',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:Home(),
      
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home>{
  @override
  Widget build(BuildContext context){
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.bottom]);
    return WebView(
      allowsInlineMediaPlayback: false,
        debuggingEnabled: false,
        initialMediaPlaybackPolicy: AutoMediaPlaybackPolicy.always_allow,
        initialUrl: "https://www.google.com/",
        javascriptMode: JavascriptMode.unrestricted,
        javascriptChannels: Set.from([
          JavascriptChannel(
            name: "flutter",
            onMessageReceived: (JavascriptMessage message) {
              if (message.message == "onSubscribeClick") {
                print("onSubscribeClick");
              }
            },
          )
        ]),
        onWebViewCreated: (WebViewController webviewcontroller) {
          try {} catch (error, stackTrace) {}
        },
        onPageStarted: (String page) {},
        onPageFinished: (String page) {},
        onWebResourceError: (websourceerror) {
          print("=> onWebResourceError " + websourceerror.domain.toString());
        },
    );
  }
}