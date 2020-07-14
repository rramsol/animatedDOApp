import 'package:animateddoapp/src/pages/navigation_page.dart';
import 'package:animateddoapp/src/pages/pagina1_page.dart';
import 'package:animateddoapp/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Animated_do',
      debugShowCheckedModeBanner: false,
      home: PaginaUnoPage(),
    );
  }
}
