import 'package:basvurukayit/service/yatay_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../admin_paneli_dart.dart';
class OnayliYatayGecisListesi extends StatefulWidget {
  const OnayliYatayGecisListesi({Key? key}) : super(key: key);

  @override
  _OnayliYatayGecisListesiState createState() => _OnayliYatayGecisListesiState();
}

class _OnayliYatayGecisListesiState extends State<OnayliYatayGecisListesi> {
  YatayBasvuruService _yatayBasvuruService = YatayBasvuruService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Onaylanan Yatay Geçiş Başvuruları",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Material(
        color: Colors.green,
        child: StreamBuilder<QuerySnapshot>(
          stream: _yatayBasvuruService.onayliBasvurulariGetirAdmin(),
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
                    height: 380,
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
                                "BAŞVURU TÜRÜ : ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${basvuruListesi['basvuruTuru']}",
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
                                "${basvuruListesi['ogrenciPuan']}",
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
                                "ÖĞRENCİ SINIFI : ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${basvuruListesi['ogrenciSinif']}",
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
                                "BAŞVURULAN BÖLÜMÜNÜN PUANI : ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${basvuruListesi['basvurulanBolumPuan']}",
                                style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: EdgeInsets.all(5.0),
                            child: Card(
                              color: Colors.green,
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
