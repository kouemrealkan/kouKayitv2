import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/dgs_pdf.dart';
import 'package:basvurukayit/service/dgs_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../secim_ekrani.dart';

class DgsGoruntuleme extends StatefulWidget {
  const DgsGoruntuleme({Key? key}) : super(key: key);

  @override
  _DgsGoruntulemeState createState() => _DgsGoruntulemeState();
}

class _DgsGoruntulemeState extends State<DgsGoruntuleme> {
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
  DgsBasvuruService _dgsBasvuruService = DgsBasvuruService();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: StreamBuilder<QuerySnapshot>(
        stream: _dgsBasvuruService.basvurulariGetir(loggedInUser),
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
                        height: 350,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.blue, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            children: [
                              SizedBox(
                                height: 10,
                              ),
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
                                    "ÖĞRENCİ TC NO : ",
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
                                    "ÖĞRENCİ YAZIŞMA ADRESİ : ",
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
                                    "ÖĞRENCİ YERLEŞME YILI : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciYerlesmeYili']}",
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
                                    "ÖĞRENCİ YERLEŞME PUANI : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciYerlesmePuani']}",
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
                                    "ÖĞRENCİ DİPLOMA NOTU : ",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black),
                                    textAlign: TextAlign.center,
                                  ),
                                  Text(
                                    "${basvuruListesi['ogrenciDiplomaNotu']}",
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
                                                  DgsBasvuruPdf(
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
