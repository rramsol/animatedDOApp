import 'package:animateddoapp/src/pages/navigation_page.dart';
import 'package:animateddoapp/src/pages/twitter_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animate_do/animate_do.dart';

class PaginaUnoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animate_do'),
        actions: <Widget>[

          FadeIn(
            child: IconButton(
              icon: FaIcon( FontAwesomeIcons.twitter),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>TwitterPage()));
              },
            ),
          ),

          FadeInLeft(
            duration: Duration(milliseconds: 500),
            from: 25,
            child: IconButton(
              icon: Icon(Icons.navigate_next),
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>PaginaUnoPage()));
              },
            ),
          )

        ],
      ),

      floatingActionButton:BounceInRight(
        duration: Duration(milliseconds: 500),
        child: FloatingActionButton(
          child: FaIcon( FontAwesomeIcons.play ),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>NavigationPage()));
          },
        ),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Roulette(child: Icon(Icons.new_releases,color: Colors.blue,size: 40,)),
            ZoomIn(
              delay: Duration(milliseconds: 500),
              duration: Duration(milliseconds: 1000),
                child: Text('Titulo',style: TextStyle(fontSize: 40, fontWeight: FontWeight.w200),)
            ),
            ZoomIn(
                delay: Duration(milliseconds: 1000),
                duration: Duration(milliseconds: 500),
                child: Text('Soy un texto pequenio',style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),)
            ),
            Container(
              width: 220,
              height: 2,
              color: Colors.blue,
            )
          ],
        ),
      ),
    );
  }
}