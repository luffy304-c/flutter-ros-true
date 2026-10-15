import 'package:flutter/material.dart';

import 'pages/home_page.dart';
import 'widgets/comic.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: comicTheme(),
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
