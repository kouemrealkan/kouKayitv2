import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/intibak_pdf.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/yaz_okulu_pdf.dart';
import 'package:basvurukayit/service/intibak_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../secim_ekrani.dart';

class IntibakGoruntuleme extends StatefulWidget {
  const IntibakGoruntuleme({Key? key}) : super(key: key);

  @override
  _IntibakGoruntulemeState createState() => _IntibakGoruntulemeState();
}

class _IntibakGoruntulemeState extends State<IntibakGoruntuleme> {
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
  IntibakBasvuruService _intibakBasvuruService = IntibakBasvuruService();
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.green,
      child: StreamBuilder<QuerySnapshot>(
        stream: _intibakBasvuruService.basvurulariGetir(loggedInUser),
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
                        height: 395,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.green, width: 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
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
                                  Text(
                                    "ÖĞRENCİ AÇIK ADRES : ",
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
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: DataTable(
                                  columns: <DataColumn>[
                                    DataColumn(label: Text('Ders Adı ve Kodu')),
                                    DataColumn(label: Text('Akts')),
                                    DataColumn(label: Text('t')),
                                    DataColumn(label: Text('u')),
                                  ],
                                  rows: <DataRow>[
                                    DataRow(cells: [
                                      DataCell(Text(
                                          "${basvuruListesi['sorumluOlunanDersler']}")),
                                      DataCell(Text(
                                          "${basvuruListesi['sorumluOlunanDersler']}")),
                                      DataCell(Text(
                                          "${basvuruListesi['sorumluOlunanDersler']}")),
                                      DataCell(Text(
                                          "${basvuruListesi['sorumluOlunanDersler']}")),
                                    ])
                                  ],
                                ),
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


                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                                  IntibakBasvuruPdf(
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
