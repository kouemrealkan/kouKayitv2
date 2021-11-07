import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/cap_pdf.dart';
import 'package:basvurukayit/service/cap_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../secim_ekrani.dart';

class CapGoruntuleme extends StatefulWidget {
  const CapGoruntuleme({Key? key}) : super(key: key);

  @override
  _CapGoruntulemeState createState() => _CapGoruntulemeState();
}

class _CapGoruntulemeState extends State<CapGoruntuleme> {
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  CapBasvuruService _capBasvuruService = CapBasvuruService();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: StreamBuilder<QuerySnapshot>(
        stream: _capBasvuruService.basvurulariGetir(loggedInUser),
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
                        height: 385,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    "ÖĞRENCİ ADI : ",
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
                              Row(
                                children: [
                                  Text(
                                    "ÖĞRENCİ TC : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciTc']}",
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
                                    "ÖĞRENCİ EMAİL : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciEmail']}",
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
                                    "ÖĞRENCİ GSM : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciGsm']}",
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
                                    "ÖĞRENCİ ÜNİVERSİTE : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciUniversite']}",
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
                                  Text(
                                    "ÖĞRENCİ NOT ORTALAMASI : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciNotOrt']}",
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
                                    "ÖĞRENCİ NUMARASI : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciNumarasi']}",
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
                                    "ÖĞRENCİ YARIYIL : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciYariyil']}",
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
                                    "ÖĞRETİM TÜRÜ : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogretimTuru']}",
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
                                    "BAŞVURULAN FAKÜLTE : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['basvurulanFakulte']}",
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
                                    "BAŞVURULAN BÖLÜM : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['basvurulanBolum']}",
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
                                    "OLUŞTURMA TARİHİ : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['olusturmaTarihi']}",
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
                                    "RED TARİHİ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['reddedilmeTarihi']}",
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
                                    "ONAY TARİHİ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['onaylanmaTarihi']}",
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                    textAlign: TextAlign.center,
                                  ),
                                ],
                              ),
                              Padding(
                                padding: EdgeInsets.all(5.0),
                                child: Card(
                                  color: basvuruListesi['basvuruDurumu'] ==
                                          "onaylandı"
                                      ? Colors.green
                                      : Colors.red,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Text(
                                        "Başvuru Durumu : ${basvuruListesi['basvuruDurumu'].toString().toUpperCase()}",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  ElevatedButton(
                                    child: Text("PDF Önizleme"),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.blue),
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CapBasvuruPdf(
                                                      id: basvuruListesi[
                                                          "id"])));
                                    },
                                  ),
                                  ElevatedButton(
                                    child: Text("Anasayfa'ya Dön"),
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  SecimEkrani()));
                                    },
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                              Colors.green),
                                    ),
                                  ),
                                ],
                              )
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
