import 'package:basvurukayit/service/intibak_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../admin_paneli_dart.dart';
class BekleyenIntibakListesi extends StatefulWidget {
  const BekleyenIntibakListesi({Key? key}) : super(key: key);

  @override
  _BekleyenIntibakListesiState createState() => _BekleyenIntibakListesiState();
}

class _BekleyenIntibakListesiState extends State<BekleyenIntibakListesi> {
  IntibakBasvuruService _intibakBasvuruService = IntibakBasvuruService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bekleyen Intibak Başvuruları",
          style: TextStyle(fontSize: 18),
        ),
      ),
      body: Material(
        color: Colors.green,
        child: StreamBuilder<QuerySnapshot>(
          stream: _intibakBasvuruService.basvurulariGetirAdmin(),
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
                                "ÖĞRENCİ NUMARASI : ",
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black),
                                textAlign: TextAlign.center,
                              ),
                              Text(
                                "${basvuruListesi['ogrenciNo']}",
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
                          Row(
                            mainAxisAlignment:
                            MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                child: Text("Başvuruyu Onayla"),
                                onPressed: () async {
                                  _intibakBasvuruService.basvuruOnaylaAdmin(snapshot.data!.docs[index].id);

                                  /*   var docIdData = FirebaseFirestore.instance.collection("yatay_gecis_basvuru");
                                        var docIdFromDb = await docIdData.get();

                                        var docId = snapshot.data!.docs[index];
                                        for (var snapshot in docIdFromDb.docs) {
                                          var documentId = snapshot.id;
                                          print("value :" + documentId);
                                          documentId = docId[index];
                                          docIdData.doc(documentId).update({'basvuruDurumu': 'onaylandı'});
                                        } */
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: Text(
                                            'Sayın Admin Kullanıcısı'),
                                        content: Text(
                                            'Başvuru Onay İşlemi Tamamlandı'),
                                      )).then((value) =>
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminPaneli())));
                                },
                              ),
                              // SizedBox(width: 10,),
                              ElevatedButton(
                                child: Text("Başvuruyu Reddet"),
                                onPressed: () async{
                                  _intibakBasvuruService.basvuruReddetAdmin(snapshot.data!.docs[index].id);
                                  showDialog(
                                      context: context,
                                      builder: (_) => AlertDialog(
                                        title: Text(
                                            'Sayın Admin Kullanıcısı'),
                                        content: Text(
                                            'Başvuru Reddetme İşlemi Tamamlandı'),
                                      )).then((value) =>
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AdminPaneli())));
                                },
                                style: ButtonStyle(
                                  backgroundColor: MaterialStateProperty.all(Colors.red),
                                ),
                              )
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
      ),
    );
  }
}
