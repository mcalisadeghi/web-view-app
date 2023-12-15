import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
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
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}