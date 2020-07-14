import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TwitterPage extends StatefulWidget {
  @override
  _TwitterPageState createState() => _TwitterPageState();
}

class _TwitterPageState extends State<TwitterPage> {


  bool estado = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1DA1F2),

      floatingActionButton: FloatingActionButton(
        child: FaIcon( FontAwesomeIcons.play),
        backgroundColor: Colors.green,
        onPressed: (){
          setState(() {
            estado = true;
          });
        },
      ),

      body: Center(
        child: ZoomOut(
            animate: estado,
            from: 30,
            duration: Duration(seconds: 1),
            child: FaIcon( FontAwesomeIcons.twitter,color: Colors.white,size: 40,)
        ),
        ),



    );

  }
}