import 'package:basvurukayit/service/cap_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class CapGoruntuleme extends StatefulWidget {
  const CapGoruntuleme({Key? key}) : super(key: key);

  @override
  _CapGoruntulemeState createState() => _CapGoruntulemeState();
}

class _CapGoruntulemeState extends State<CapGoruntuleme> {
  CapBasvuruService _capBasvuruService = CapBasvuruService();
  @override
  Widget build(BuildContext context) {
    return Material(
      child: StreamBuilder<QuerySnapshot>(
        stream: _capBasvuruService.basvurulariGetir(),
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
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Öğrenci Adı ${basvuruListesi['ogrenciAd']}",
                          style: TextStyle(fontSize: 16),
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "${basvuruListesi['ogrenciTc']}",
                          style: TextStyle(fontSize: 16),
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
