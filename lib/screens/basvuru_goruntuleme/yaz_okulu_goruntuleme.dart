import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/service/yaz_okulu_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class YazOkuluBasvuruGoruntuleme extends StatefulWidget {
  const YazOkuluBasvuruGoruntuleme({Key? key}) : super(key: key);

  @override
  _YazOkuluBasvuruGoruntulemeState createState() =>
      _YazOkuluBasvuruGoruntulemeState();
}

class _YazOkuluBasvuruGoruntulemeState extends State<YazOkuluBasvuruGoruntuleme> {
  YazOkuluBasvuruService _yazOkuluBasvuruService = YazOkuluBasvuruService();

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<QuerySnapshot>(
        stream: _yazOkuluBasvuruService.basvurulariGetir(loggedInUser),
        builder: (context, snapshot) {
          return !snapshot.hasData
              ? CircularProgressIndicator()
              : ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    DocumentSnapshot basvuruListesi =
                        snapshot.data!.docs[index];
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "ÖĞRENCİ AD : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciAd']}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Text(
                                    "ÖĞRENCİ ADRES : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciAdres']}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "ÖĞRENCİ FAKÜLTE : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciFakulte']}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Text(
                                    "ÖĞRENCİ BÖLÜM : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciBolum']}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Row(
                                children: [

                                ],
                              ),
                              MaterialButton(
                                color: Colors.lightGreen,
                                child: Text("PDF Önizleme"),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>YatayBasvuruPdf()));
                                },
                              ),
                              MaterialButton(
                                color: Colors.lightGreen,
                                child: Text("Anasayfaya dön"),
                                onPressed: () {
                                  // Navigator.push(context, MaterialPageRoute(builder: (context)=>SecimEkrani()));
                                },
                              ),
                              Text(
                                "SORUMLU OLUNAN DERSLER : ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${basvuruListesi['sorumluOlunanDersler']}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],

                          ),
                        ),
                      ),
                    );
                  },
                );
        },
      ),
    );
  }
}
