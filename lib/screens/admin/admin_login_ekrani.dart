import 'package:basvurukayit/screens/admin/admin_paneli_dart.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../secim_ekrani.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';
class AdminLogin extends StatefulWidget {
  const AdminLogin({Key? key}) : super(key: key);

  @override
  _AdminLoginState createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final emailField = TextFormField(
      autofocus: false,
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value!.isEmpty) {
          return ('E-mail alanı boş olamaz');
        }
        if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]").hasMatch(value)) {
          return ("Geçerli bir email adresi girin");
        }
        return null;
      },
      onSaved: (value) {
        _emailController.text = value!;
      },
      textInputAction: TextInputAction.next,
      decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.mail,
            color: Colors.white,
          ),
          hintText: 'E-Mail',
          prefixText: ' ',
          hintStyle: TextStyle(color: Colors.white),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white))),
    );

    final passwordField = TextFormField(
        autofocus: false,
        controller: _passwordController,
        obscureText: true,
        validator: (value) {
          RegExp regex = new RegExp(r'^.{6,}$');
          if (value!.isEmpty) {
            return ("Şifre alanı boş bırakılamaz");
          }
          if (!regex.hasMatch(value)) {
            return "Geçerli bir şifre girin(Min. 6 Karakter)";
          }
        },
        onSaved: (value) {
          _passwordController.text = value!;
        },
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          prefixIcon: Icon(
            Icons.vpn_key,
            color: Colors.white,
          ),
          hintText: 'Parola',
          prefixText: ' ',
          hintStyle: TextStyle(
            color: Colors.white,
          ),
          focusColor: Colors.white,
          focusedBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.white,
          )),
        ));

    final loginButton = InkWell(
      onTap: () {
        girisYap(_emailController.text, _passwordController.text);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 5),
        decoration: BoxDecoration(
            border: Border.all(color: Colors.white, width: 2),
            //color: colorPrimaryShade,
            borderRadius: BorderRadius.all(Radius.circular(30))),
        child: Padding(
          padding: const EdgeInsets.all(5.0),
          child: Center(
              child: Text(
            "Giriş yap",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
            ),
          )),
        ),
      ),
    );

    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Container(
            height: 780,
            width: 500,
            decoration: BoxDecoration(
                color: Colors.green.withOpacity(.75),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(.75),
                      blurRadius: 10,
                      spreadRadius: 2)
                ]),
            child: Padding(
              padding: const EdgeInsets.all(36.0),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                        height: 150,
                        child: Image.asset(
                          "assets/images/logo.png",
                          fit: BoxFit.contain,
                        )),
                    SizedBox(height: 45),
                    Text("Admin Giriş Paneli",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                    SizedBox(height: 45),
                    emailField,
                    SizedBox(
                      height: 25,
                    ),
                    passwordField,
                    SizedBox(
                      height: 35,
                    ),
                    loginButton,
                    SizedBox(
                      height: 15,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }



  void girisYap(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then((uid) => {
                // Fluttertoast.showToast(msg: "Giriş Başarılı !"),
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AdminPaneli())),
                showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text("Giriş Başarılı"),
                        content: Text(
                          "Kayıt Sistemine Hoş Heldiniz",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      );
                    }),
              })
          .catchError((e) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("Giriş Başarısız"),
                content: Text("Tekrar deneyin"),
              );
            });
        Fluttertoast.showToast(msg: e!.message);
      });
    }
  }
}
