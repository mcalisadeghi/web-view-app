import 'package:flutter/material.dart';
import 'package:flutter_application_1/mywebview.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
      title: 'Webview App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const WebviewApp(),
    );
  }
}

class WebviewApp extends StatefulWidget {
  const WebviewApp({super.key});

  @override
  State<WebviewApp> createState() => _WebviewAppState();
}

class _WebviewAppState extends State<WebviewApp> {
  late final WebViewController controller;
  @override
  void initState() {
    super.initState();
    controller = WebViewController()
      ..loadRequest(
        Uri.parse(
          'https://google.com',
        ),
      );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Web view',
        ),
        actions: [
          IconButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              if (await controller.canGoBack()) {
                await controller.goBack();
              } else {
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text(
                      'No Back History Found',
                    ),
                  ),
                );
                return;
              }
            },
            icon: const Icon(
              Icons.arrow_back_ios,
            ),
          ),
          IconButton(
            onPressed: () async {
              final messenger = ScaffoldMessenger.of(context);
              if (await controller.canGoForward()) {
                await controller.goForward();
              } else {
                messenger.showSnackBar(
                  const SnackBar(
                    content: Text(
                      'No Forward History Found',
                    ),
                  ),
                );
                return;
              }
            },
            icon: const Icon(
              Icons.arrow_forward_ios,
            ),
          ),
          IconButton(
            onPressed: () {
              controller.reload();
            },
            icon: const Icon(
              Icons.reply,
            ),
          ),
        ],
      ),
      body: MyWebView(
        controller: controller,
      ),
    );
  }
}
