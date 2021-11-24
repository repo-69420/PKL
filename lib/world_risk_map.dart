// Note: The website https://education.neplinews.com/ is our own wesbite whose source code could be found in the Visualization/Global Nowcast folder in our github repo.
//The website contains the polygonal map we developed to represent landslide and is connected natively in the app.

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:webview_flutter/webview_flutter.dart';


class WorldRiskMap extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}
const String flutterUrl = "https://education.neplinews.com/"; 
class _MyAppState extends State<WorldRiskMap> {
  late WebViewController _controller;
  // ignore: unused_element
  _loadPage() async {
    var url = await _controller.currentUrl();
    _controller.loadUrl(
      url ="https://education.neplinews.com/",
  
    );
    print(url);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        leading: IconButton(
            icon: Icon(FontAwesomeIcons.arrowLeft,color: Colors.black,),
            onPressed: () => Navigator.pop(context)),
        title: Text("World Risky Areas",style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.white70,
      ),
      body: SafeArea(
        child: WebView(
          key: Key("webview"),
          initialUrl: flutterUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            _controller = webViewController;
          },
        ),
      ),
    );
  }
}