import 'dart:ui';
import 'package:e_bac/StudentsPageSection/MatieresTypeBac/bac_function.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_bac/StudentsPageSection/MatieresTypeBac/pdf.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class Responsive {
  static width(double p, BuildContext context) {
    return MediaQuery.of(context).size.width * (p / 100);
  }

  static height(double p, BuildContext context) {
    return MediaQuery.of(context).size.height * (p / 100);
  }
}

class ParAnnee extends StatefulWidget {
  String nom = "Mathématiques";
  ParAnnee(this.nom);

  @override
  _ParAnneeState createState() => _ParAnneeState();
}

class _ParAnneeState extends State<ParAnnee> {
  List list = [];
  bool vf = true;
  var emptyMap = new Map();

  Future getData() async {
    final http.Response response = await http
        .get(Uri.https('bacplusplus.000webhostapp.com', 'Big_data.php'));
    if (response.statusCode == 200) {
      setState(() {
        emptyMap = jsonDecode(response.body);
        vf = false;
      });
    }
    // print(emptyMap['Scientifiques'][widget.nom]);
  }

  @override
  void initState() {
    super.initState();
    getData();
  }

  ListTile matiere(Map infos, String type, Function vas_la_bas) {
    return ListTile(
      leading: Icon(
        Icons.picture_as_pdf_outlined,color: Colors.red,size: 35,
      ),
      title: Text(
        "Bac " + infos['date'] + " " + infos['nom'],
        style: TextStyle(
          fontSize: 20,
        ),
      ),
      subtitle: Text(
        type,
        style: TextStyle(color: Colors.black26),
      ),
      trailing: IconButton(splashColor: Colors.lightBlue,
        onPressed: (){},
        icon: Icon(Icons.download_outlined,color: Colors.lightBlue,size: 30,)),
      onTap: () {
        vas_la_bas(infos);
      },
    );
  }

  void affichePdf(Map a) {
    print(a['url_enonce']);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => PdfViewer(
          url: a['url_enonce'],
          url2: a['url_corrige'],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    var padding = MediaQuery.of(context).padding;
    double newheight = height - padding.top - padding.bottom;
    return Scaffold(
      //AppBar
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        flexibleSpace: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.lightBlueAccent, Colors.blue],
                  begin: Alignment.bottomCenter,
                  end: Alignment.topRight)),
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.arrow_back),color: Colors.white,iconSize: 35,
              onPressed: () { Navigator.pop(context); }
            );
          },
        ),
        title: Text(
            "Epreuves de " + widget.nom,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Pacifico",
          ),
        ),
      ),
      //Body
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          //Affiche Epreuves avec un trait en dessous
          //SizedBox(height: 5,),
          Container(
            height: Responsive.width(170, context),
            child: vf
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                itemCount: emptyMap['Scientifiques'][widget.nom].length,
                itemBuilder: (context, index) {
                  var tab = emptyMap['Scientifiques'][widget.nom][index];
                  var tt = "Toutes Series";
                  if (tab['liste_matiere'].isEmpty) {
                    tt = "Toutes Series";
                  } else {
                    tt = "";
                  }
                  for (var i = 0; i < tab['liste_matiere'].length; i++) {
                    tt += tab['liste_matiere'][i] + ",";
                  }
                  var ff = "Groupe " +
                      tab['groupe'] +
                      ", Series (" +
                      tt +
                      ")";
                  return emptyMap['Scientifiques'][widget.nom][index]
                      .isEmpty
                      ? Center(
                    child: Text(
                      "Aucune Epreuve",
                      style: TextStyle(
                          color: Colors.black, fontSize: 20),
                    ),
                  )
                      : matiere(
                      emptyMap['Scientifiques'][widget.nom][index],
                      ff,
                      affichePdf);
                }),
          ),
          //Affiche la liste des epreuves par annee la plus recent
        ],
      ),
    );
  }
}