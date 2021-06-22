import 'dart:convert';

import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import '../BottomNaBar.dart';
import '../ChoiceTypeBac.dart';


class PageMatiereS extends StatefulWidget {
  const PageMatiereS ({Key? key}) : super(key: key);

  @override
  _PageMatiereSState createState() => _PageMatiereSState();
}

class _PageMatiereSState extends State<PageMatiereS> {

  void goToBottomNavBar() {
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
          return BottomNavBar();
        }
    ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Matières Bac S",
          style: TextStyle(fontSize: 20,
          color: Colors.black),),
      elevation: 0,
      backgroundColor: Colors.white,
      leading: Builder(
        builder:(BuildContext context){
          return IconButton(onPressed: ()=> goToBottomNavBar(),
              icon:  Icon(EvaIcons.arrowBack,
                size: 35,
                color: Colors.lightBlue,)
          );},
      ),
    ),
      body: ListViewWidget(),

    );
  }
}




class ListViewWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ListeTileWidget(),
      ],

    );
  }
}

class ListeTileWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 30,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("FRANCAIS",style:
          TextStyle(fontSize: 20,),),
            subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
            trailing: Icon(Icons.keyboard_arrow_right),
            onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("PHILOSOPHIE",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("HISTOIRE GEOGRAPHIE",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("ANGLAIS",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("MATHEMATIQUES",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Matière dominante en s1,s2,s3,s4,s5",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("SCIENCES PHYSIQUES",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Matière dominante en s1,s2,s3,s4,s5",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("SCIENCES DE LA VIE ET DE TERRE",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Matière dominante en s2,s4,s5",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("EDUCATION PHYSIQUE",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("CONSTRUCTION MECANIQUE",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Matière dominante en s3",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("ANA.DE FABRICAT TECHNO.AUTOMAT",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("EPREUVE PRATIQUE ATELIER",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("ECOLOGIE ENVIRONNEMENT",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("ZOOTECHNIQUE",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("PHYTOTECHNIQUE",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("TECH. TRANSF.CONSERV",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Matière dominante en s5",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
        ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundImage: AssetImage(""),
          ),
          title: Text("BIOCHIMIE",style:
          TextStyle(fontSize: 20,),),
          subtitle: Text("Non dominante",style: TextStyle(color: Colors.blue),),
          trailing: Icon(Icons.keyboard_arrow_right),
          onTap: () => print("yooo"),
        ),
        SizedBox(height: 10,),
      ],
    );
  }
}
