import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'home.dart';

class RecipeView extends StatefulWidget {
  String url;
  RecipeView(this.url);

  @override
  State<RecipeView> createState() => _RecipeViewState();
}

class _RecipeViewState extends State<RecipeView> {
  late String finalUrl;
  final Completer<WebViewController> controller = Completer<WebViewController>();

  @override
  void initState() {
    // TODO: implement initState
    if(widget.url.toString().contains("http://"))
      {
        finalUrl = widget.url.toString().replaceAll("http://", "https://");

      }else{
      finalUrl = widget.url;
    }
    super.initState();

  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Food Buddy"),
      ),
      body: Container(
        child: WebView(// Pass the controller argument
          initialUrl: finalUrl,
          javascriptMode: JavascriptMode.unrestricted,
          onWebViewCreated: (WebViewController webViewController) {
            setState(() {
              controller.complete(webViewController);
            });
          },
        ),
      ),
    );
  }
}
