import 'package:e_bac/AuthScreens/login_screen.dart';
import 'package:e_bac/Loading/Loading.dart';
import 'package:e_bac/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'Bienvenue.dart';


class PersonalInformations extends StatefulWidget {
  const PersonalInformations({Key? key}) : super(key: key);

  @override
  _PersonalInformationsState createState() => _PersonalInformationsState();
}

class _PersonalInformationsState extends State<PersonalInformations> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle.light,
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Stack(
            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color(0xFF3594DD),
                      Color(0xFF4563DB),
                      Color(0xFF5036D5),
                      Color(0xFF5B16D0),
                    ],
                    stops: [0.1, 0.4, 0.7, 0.9],
                  ),
                ),
              ),
              Container(
                alignment: Alignment.topCenter,
                //color: Colors.white,
                height: double.infinity,
                child: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  padding: EdgeInsets.symmetric(
                    horizontal: 40.0,
                    vertical: 120.0,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        'Enter your Personal\n       Informations',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 50.0),
                      TuteurPersonalInformations(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  }




class TuteurPersonalInformations extends StatefulWidget {
  const TuteurPersonalInformations({Key? key}) : super(key: key);

  @override
  _TuteurPersonalInformationsState createState() => _TuteurPersonalInformationsState();
}

class _TuteurPersonalInformationsState extends State<TuteurPersonalInformations> {

  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();


  String email='';
  String fname= '';
  String name='';
  String age= '';
  String number = '';
  final RegExp emailValidator = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  //Controller pour le formulaire
  TextEditingController username = new TextEditingController();
  TextEditingController userFullName = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController ageController = new TextEditingController();
  TextEditingController numberController = new TextEditingController();

  void goToNextPage() {
    Navigator.push(context, MaterialPageRoute(builder:
        (context) {
      return LoadingPage();
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Container(

      child: Form(
        key:_formkey,
        child:
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Name',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                controller: username,
                //change l'etat du champ nom
                onChanged: (value) => setState(() => name = value),
                validator: (value) =>value!.isEmpty ?
                'Please enter your name' : null,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your name',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            SizedBox(height: 10,),
            //il faut changer de controller le onchange et le validator
            Text(
              'Family Name',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                controller: userFullName,
                //change l'etat du champ nom
                onChanged: (value) => setState(() => fname = value),
                validator: (value) =>value!.isEmpty ?
                'Please enter your family name' : null,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your family name',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            SizedBox(height: 10,),
            //il faut changer de controller le onchange et le validator
            Text(
              'Age',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                controller: ageController,
                //change l'etat du champ nom
                onChanged: (value) => setState(() => age = value),
                validator: (value) =>value!.isEmpty ?
                'Please enter your âge' : null,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your family âge',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            SizedBox(height: 10,),
            Text(
              'Email',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                controller: emailController,
                //change l'etat du champ email
                onChanged: (value) => setState(() => email = value),
                validator: (value) =>value!.isEmpty || !emailValidator.hasMatch(value) ?
                'Please enter a valid E-mail' : null,
                keyboardType: TextInputType.emailAddress,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your Email',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),
            SizedBox(height: 10,),
            //il faut changer de controller le onchange et le validator
            Text(
              'Phone number',
              style: kLabelStyle,
            ),
            SizedBox(height: 10.0),
            Container(
              alignment: Alignment.centerLeft,
              decoration: kBoxDecorationStyle,
              height: 60.0,
              child: TextFormField(
                controller: numberController,
                //change l'etat du champ nom
                onChanged: (value) => setState(() => number = value),
                validator: (value) =>value!.isEmpty ?
                'Please enter your Phone number' : null,
                keyboardType: TextInputType.number,
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: 'Montserrat',
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.only(top: 14.0),
                  prefixIcon: Icon(
                    Icons.phone_android,
                    color: Colors.white,
                  ),
                  hintText: 'Enter your phone number',
                  hintStyle: kHintTextStyle,
                ),
              ),
            ),

            SizedBox(height: 10,),
            Container(
              padding: EdgeInsets.symmetric(vertical: 25.0),
              width: double.infinity,
              child: RaisedButton(
                elevation: 5.0,
                onPressed: !emailValidator.hasMatch(email)? null :() {
                  if(_formkey.currentState!.validate()){
                  goToNextPage();
                  }

                },
                padding: EdgeInsets.all(15.0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                color: Colors.white,
                child: Text(
                  'Continuer',
                  style: TextStyle(
                    color: Color(0xFF527DAA),
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,),
           Center(
             child:  Text('Fill this form',
               style: TextStyle(fontSize: 20,color: Colors.white,
               fontFamily: 'Montserrat'),),
           )
          ],
        ),
      ),
    );
  }
}
