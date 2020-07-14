

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';

class NavigationPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_)=> new _NotificationModelProvider(),

      child: Scaffold(
        appBar: AppBar(
         backgroundColor: Colors.pink,
         title: Text('Notifications Page'),
         centerTitle: true,
       ),

        floatingActionButton: BoronFlotanteCustom(),
        bottomNavigationBar: BottomNavigationBarCustom(),

      ),
    );
  }
}

class BottomNavigationBarCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

     int numero = Provider.of<_NotificationModelProvider>(context).numero;


    return BottomNavigationBar(
      currentIndex: 0,
      selectedItemColor: Colors.pink,
      items: [
        BottomNavigationBarItem(
          title: Text('Bones'),
          icon: FaIcon(FontAwesomeIcons.bone)
        ),

        BottomNavigationBarItem(
            title: Text('Notifications'),
            icon: Stack(
              children: <Widget>[
                FaIcon(FontAwesomeIcons.bell),
                Positioned(
                  top: 0.0,
                  right: 0.0,
                  child: BounceInDown(
                    from: 10,
                    animate: (numero>0)?true:false,
                    child: Bounce(
                      from: 10,
                      duration: Duration(milliseconds: 800),
                      controller: (controller)=> Provider.of<_NotificationModelProvider>(context).bounceController = controller,
                      child: Container(
                        child: Text('$numero',style: TextStyle(color: Colors.white,fontSize: 9),),
                        alignment: Alignment.center,
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.redAccent,
                          shape: BoxShape.circle
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
        ),

        BottomNavigationBarItem(
            title: Text('My Dog'),
            icon: FaIcon(FontAwesomeIcons.dog)
        ),
      ],
    );
  }
}


class BoronFlotanteCustom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: FaIcon( FontAwesomeIcons.play ),
      backgroundColor: Colors.pink,
      onPressed:(){

        int numero = Provider.of<_NotificationModelProvider>(context,listen: false).numero;
        numero++;
        Provider.of<_NotificationModelProvider>(context,listen: false).numero=numero;

        if( numero >= 2){
          final controller = Provider.of<_NotificationModelProvider>(context,listen: false).bounceController;
          controller.forward(from: 0.0);
        }

      },
    );
  }
}

class _NotificationModelProvider extends ChangeNotifier {

  int _numero =0;
  AnimationController _bounceController;


  int get numero => this._numero;

  set numero(int valor){
    this._numero = valor;
    notifyListeners();
  }

  AnimationController get bounceController => this._bounceController;
  set bounceController (AnimationController controller){
    this._bounceController = controller;
    notifyListeners();
  }

}

