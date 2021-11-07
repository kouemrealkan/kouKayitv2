import 'package:basvurukayit/service/yaz_okulu_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../admin_paneli_dart.dart';

class OnayliYazOkuluListe extends StatefulWidget {
  const OnayliYazOkuluListe({Key? key}) : super(key: key);

  @override
  _OnayliYazOkuluListeState createState() => _OnayliYazOkuluListeState();
}

class _OnayliYazOkuluListeState extends State<OnayliYazOkuluListe> {
  YazOkuluBasvuruService _yazOkuluBasvuruService = YazOkuluBasvuruService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Onaylı Yaz Okulu Başvuruları",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Material(
        color: Colors.green,
        child: StreamBuilder<QuerySnapshot>(
          stream: _yazOkuluBasvuruService.onayliBasvurulariGetirAdmin(),
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
                            border: Border.all(color: Colors.green, width: 1),
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
                                      "Yaz Okulu İçin Başvurulan Üniversite : ",
                                      style: TextStyle(
                                          fontSize: 14, color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ),
                                    Text(
                                      "${basvuruListesi['basvurulanUniversite']}",
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
                                      "Belge Oluşturulma Tarihi : ",
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
                                      "Belge Onaylanma Tarihi : ",
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
                                    color: Colors.blue,
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
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
          },
        ),
      ),
    );
  }
}
