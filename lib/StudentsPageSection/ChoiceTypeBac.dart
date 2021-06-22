import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';

import 'MatieresTypeBac/PageMatiereL.dart';
import 'MatieresTypeBac/PageMatieresS.dart';



class ChoiceTypeBac extends StatefulWidget {
  const ChoiceTypeBac({Key? key}) : super(key: key);

  @override
  _ChoiceTypeBacState createState() => _ChoiceTypeBacState();
}

class _ChoiceTypeBacState extends State<ChoiceTypeBac> {

  void goToPageMatiereS() {
    //permet de naviguer d'une page à une autre avec une animation
    Navigator.push(context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, animationTime, child) {
          animation= CurvedAnimation(parent: animation,
              curve: Curves.elasticOut);
          return ScaleTransition(scale: animation,
            alignment: Alignment.center,
            child: child,
          );
        },
        pageBuilder:
            (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return PageMatiereS();
        }
    ));
  }
  void goToPageMatiereL() {
    //permet de naviguer d'une page à une autre avec une animation
    Navigator.push(context, PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 500),
        transitionsBuilder: (context, animation, animationTime, child) {
          animation= CurvedAnimation(parent: animation,
              curve: Curves.elasticOut);
          return ScaleTransition(scale: animation,
            alignment: Alignment.center,
            child: child,
          );
        },
        pageBuilder:
            (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
          return PageMatiereL();
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            child:
            Center(
          child: Card(
            clipBehavior: Clip.antiAlias,
            color: Colors.blueGrey,
            elevation: 10,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children:<Widget>[
                    Ink.image(image:
                    AssetImage("assets/StudentsImages/science.jpg"),
                      fit: BoxFit.cover,
                      height: 250,
                      child: InkWell(
                        onTap: () => goToPageMatiereS(),
                        splashColor: Colors.blue.withAlpha(30),
                      ),),
                    Positioned(
                      bottom: 16,
                        right: 16,
                        left: 16,
                        child: Text('Etes-vous scientifique ?',
                        style: TextStyle(fontSize: 25,
                            fontWeight: FontWeight.bold,
                        color: Colors.black),)),

                    const SizedBox(
                  width: 500,
                  height: 200,
                )

                  ],
                  ),
                Padding(padding: EdgeInsets.only(left: 5,right: 5,top: 10).copyWith(bottom: 10,
                ),
                  child: Text("Ce catalogue contient toutes les matières et épreuves scientifiques"
                      " de chaque sous-séries scientifique (s1, s2, s3, s4, s5)",
                  style: TextStyle(color: Colors.black,
                  fontSize: 16),),
                )
              ],
            ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child:
          Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.green,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children:<Widget>[
                      Ink.image(image:
                      AssetImage("assets/StudentsImages/etudiants6.jpg"),
                        fit: BoxFit.cover,
                        height: 250,
                        child: InkWell(
                          onTap: () => goToPageMatiereL(),
                          splashColor: Colors.blue.withAlpha(30),
                        ),),
                      Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text('Etes-vous littéraire ?',
                            style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),)),

                      const SizedBox(
                        width: 500,
                        height: 200,
                      )

                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 5,right: 5,top: 10).copyWith(bottom: 10,
                  ),
                    child: Text("Ce catalogue contient toutes les matières et épreuves littéraires"
                        " de chaque sous-séries littéraires (l1a, l1b, l1', l2, lA)",
                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child:
          Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.lightBlue,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children:<Widget>[
                      Ink.image(image:
                      AssetImage("assets/StudentsImages/etudiants9.jpg"),
                        fit: BoxFit.cover,
                        height: 250,
                        child: InkWell(
                          onTap: () {},
                          splashColor: Colors.blue.withAlpha(30),
                        ),),
                      Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text('Etes-vous du technique ?',
                            style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),)),

                      const SizedBox(
                        width: 500,
                        height: 200,
                      )

                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 5,right: 5,top: 10).copyWith(bottom: 10,
                  ),
                    child: Text("Ce catalogue contient toutes les matières et épreuves Techniques"
                        " de chaque sous-séries techniques(T1, T2,)",
                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                  )
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10,),
        Container(
          child:
          Center(
            child: Card(
              clipBehavior: Clip.antiAlias,
              color: Colors.redAccent,
              elevation: 10,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children:<Widget>[
                      Ink.image(image:
                      AssetImage("assets/StudentsImages/etudiants3.jpg"),
                        fit: BoxFit.cover,
                        height: 250,
                        child: InkWell(
                          onTap: () => {},
                          splashColor: Colors.blue.withAlpha(30),
                        ),),
                      Positioned(
                          bottom: 16,
                          right: 16,
                          left: 16,
                          child: Text('Ou plutôt du général ?',
                            style: TextStyle(fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: Colors.black),)),

                      const SizedBox(
                        width: 500,
                        height: 200,
                      )

                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 5,right: 5,top: 10).copyWith(bottom: 10,
                  ),
                    child: Text("Ce catalogue contient toutes les matières et épreuves Générales",

                      style: TextStyle(color: Colors.black,
                          fontSize: 16),),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
