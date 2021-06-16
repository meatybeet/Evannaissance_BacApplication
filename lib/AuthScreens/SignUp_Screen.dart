
import 'dart:convert';

import 'package:e_bac/TuteurPagesSection/FirtsEditingProfile/Bienvenue.dart';
import 'package:e_bac/TuteurPagesSection/FirtsEditingProfile/EditeProfileImage.dart';
import 'package:e_bac/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'login_screen.dart';



class SignUpScreen extends StatefulWidget {
  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool _rememberMe = false;


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
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Montserrat',
                          fontSize: 30.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10,),
                      FormInscription(),
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

class FormInscription extends StatefulWidget {

  const FormInscription({Key? key}) : super(key: key);

  @override
  _FormInscriptionState createState() => _FormInscriptionState();
}

class _FormInscriptionState extends State<FormInscription> {
  bool  _isSecret = true;
  //la clé de validation du formulaire
  final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String email='';
  String pwd= '';
  String name='';
  String Confirmpwd= '';
  final RegExp emailValidator = RegExp(r"[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]+");

  //Controller pour le formulaire
  TextEditingController username = new TextEditingController();
  TextEditingController emailController = new TextEditingController();
  TextEditingController pwdController = new TextEditingController();
  TextEditingController ConfirmpwdController = new TextEditingController();

  Future<void> register()async {
    var url = Uri.parse("http://192.168.1.16/workstation/flutter%20app%20auth/register.php");
    var response = await http.post(url,
        body: {
          "username" : username.text,
          "email" : emailController.text,
          "password" : pwdController.text,

        }
    );
    var data = jsonDecode(response.body);
    if(data == "Error"){
      Fluttertoast.showToast(
          msg: "cet utilisateur existe",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.red,
          textColor: Colors.red,
          fontSize: 20.0
      );
    }else{
      Fluttertoast.showToast(
          msg: "enregistrement résussi",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 3,
          backgroundColor: Colors.green,
          textColor: Colors.green,
          fontSize: 20
      );
      goToNextPage();
    }
  }

  void goToNextPage() {
    Navigator.push(context, MaterialPageRoute(builder:
        (context) {
      return BienvenuePage();
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
            'Complet name',
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
                hintText: 'Enter your full name',
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
          Text(
            'Password',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
                controller: pwdController,
              onChanged: (value) => setState(() => pwd = value),
              validator: (value) => value!.length<6 ? 'Mot de passe trop court' : null,
              obscureText:  _isSecret,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
              decoration: InputDecoration(

                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock_outline,
                  color: Colors.white,
                ),
                suffixIcon: InkWell(
                  onTap: (){
                    setState(() {
                      _isSecret = !_isSecret;
                    });
                  },
                  child: Icon(
                      !_isSecret ?
                      Icons.visibility : Icons.visibility_off,
                  color: Colors.white,),
                ),
                hintText: 'Enter your Password',
                hintStyle: kHintTextStyle,
              ),
            ),
          ),
          SizedBox(height: 10,),
          Text(
            'Confirm Password',
            style: kLabelStyle,
          ),
          SizedBox(height: 10.0),
          Container(
            alignment: Alignment.centerLeft,
            decoration: kBoxDecorationStyle,
            height: 60.0,
            child: TextFormField(
                controller: ConfirmpwdController,
              onChanged: (value) => setState(() => Confirmpwd = value),
              validator: (value) => Confirmpwd != pwd ? 'Mot de passe incorrect' : null,
              obscureText: _isSecret,
              style: TextStyle(
                color: Colors.white,
                fontFamily: 'Montserrat',
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14.0),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
                suffixIcon: InkWell(
                  onTap: (){
                    setState(() {
                      _isSecret = !_isSecret;
                    });
                  },
                  child: Icon(
                      !_isSecret ?
                      Icons.visibility : Icons.visibility_off,
                    color: Colors.white,),
                ),
                hintText: 'Confirm your Password',
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
                  register();

                }
                },

              padding: EdgeInsets.only(top: 25,left: 25,right: 25,bottom: 25),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              color: Colors.white,
              child: Text(
                'Sign Up',
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
            child: GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context){
                    return LoginScreen();})),
              child: RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: 'Have you an Account? ',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    TextSpan(
                      text: 'Sign In',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      ),
    );
  }
}




