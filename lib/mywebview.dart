import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MyWebView extends StatefulWidget {
  final controller;
  const MyWebView({super.key, this.controller});

  @override
  State<MyWebView> createState() => _MyWebViewState();
}

class _MyWebViewState extends State<MyWebView> {
  var loadingPercentage = 0;
  @override
  void initState() {
    super.initState();
    widget.controller
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (url) {
            setState(
              () {
                loadingPercentage = 0;
              },
            );
          },
          onProgress: (progress) {
            setState(
              () {
                loadingPercentage = progress;
              },
            );
          },
          onPageFinished: (url) {
            setState(
              () {
                loadingPercentage = 100;
              },
            );
          },
        ),
      )
      ..setJavaScriptMetode(
        JavaScriptMode.unrestricted,
      )
      ..addJavaScriptChannel(
        'SnacBar',
        onMessageReceived: (message) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                message.message,
              ),
            ),
          );
        },
      );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        WebViewWidget(
          controller: widget.controller,
        ),
        if (loadingPercentage < 100)
          LinearProgressIndicator(
            value: loadingPercentage / 100.0,
          ),
      ],
    );
  }
}
