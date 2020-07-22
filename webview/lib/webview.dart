import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class SampleWebView extends StatefulWidget {
  SampleWebView({Key key}) : super(key: key);

  @override
  _SampleWebViewState createState() => _SampleWebViewState();
}

class _SampleWebViewState extends State<SampleWebView> {
  String home = "http://tdk.gov.tr/";
  WebViewController controller;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: SafeArea(
        child: buildWebView(),
      ),
    );
  }

  WebView buildWebView() {
    return WebView(
      onWebViewCreated: (controller) {
        this.controller = controller;
      },
      initialUrl: "http://tdk.gov.tr/tdk/kurumsal/gorev-ve-hedef/",
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      iconTheme: IconThemeData(color: Colors.red),
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: buildIconButtonBack(),
      actions: <Widget>[buildIconButtonHome()],
    );
  }

  IconButton buildIconButtonHome() {
    return IconButton(
        icon: Icon(Icons.home),
        onPressed: () {
          controller.loadUrl(home);
        });
  }

  IconButton buildIconButtonBack() {
    return IconButton(
        icon: Icon(Icons.backspace, color: Colors.red),
        onPressed: () {
          controller.goBack();
        });
  }
}
