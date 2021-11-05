import 'package:cloud_firestore/cloud_firestore.dart';

class IntibakBasvuruModel {
  String? id;
  String? ogrenciAd;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciAdres;
  String? ogrenciNo;
  String? ogrenciFakulte;
  String? ogrenciBolum;
  String? muafOlunanUniversite;
  Map<String, dynamic>? sorumluOlunanDersler;
  Map<String, dynamic>? dahaOnceAlinanDersler;
  String? olusturmaTarihi;
  String? onaylanmaTarihi;
  String? reddedilmeTarihi;
  String? basvuruDurumu;
  IntibakBasvuruModel(
      {this.id,
      this.ogrenciAd,
      this.ogrenciEmail,
      this.ogrenciGsm,
      this.ogrenciAdres,
      this.ogrenciNo,
      this.ogrenciFakulte,
      this.ogrenciBolum,
      this.muafOlunanUniversite,
      this.sorumluOlunanDersler,
      this.dahaOnceAlinanDersler,
      this.olusturmaTarihi,
      this.onaylanmaTarihi,
      this.reddedilmeTarihi,
      this.basvuruDurumu});

  factory IntibakBasvuruModel.fromSnapshot(DocumentSnapshot snapshot) {
    return IntibakBasvuruModel(
        id: snapshot.id,
        ogrenciAd: snapshot["ogrenciAd"],
        ogrenciEmail: snapshot["ogrenciEmail"],
        ogrenciGsm: snapshot["ogrenciGsm"],
        ogrenciAdres: snapshot["ogrenciAdres"],
        ogrenciNo: snapshot["ogrenciNo"],
        ogrenciFakulte: snapshot["ogrenciFakulte"],
        ogrenciBolum: snapshot["ogrenciBolum"],
        muafOlunanUniversite: snapshot["muafOlunanUniversite"],
        sorumluOlunanDersler: snapshot["sorumluOlunanDersler"],
        dahaOnceAlinanDersler: snapshot["dahaOnceAlinanDersler"],
        olusturmaTarihi: snapshot["olusturmaTarihi"],
        onaylanmaTarihi: snapshot["onaylanmaTarihi"],
        reddedilmeTarihi: snapshot["reddedilmeTarihi"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }

  factory IntibakBasvuruModel.fromMap(map) {
    return IntibakBasvuruModel(
        id: map["id"],
        ogrenciAd: map["ogrenciAd"],
        ogrenciEmail: map["ogrenciEmail"],
        ogrenciGsm: map["ogrenciGsm"],
        ogrenciAdres: map["ogrenciAdres"],
        ogrenciNo: map["ogrenciNo"],
        ogrenciFakulte: map["ogrenciFakulte"],
        ogrenciBolum: map["ogrenciBolum"],
        muafOlunanUniversite: map["muafOlunanUniversite"],
        sorumluOlunanDersler: map["sorumluOlunanDersler"],
        dahaOnceAlinanDersler: map["dahaOnceAlinanDersler"],
        olusturmaTarihi: map["olusturmaTarihi"],
        onaylanmaTarihi: map["onaylanmaTarihi"],
        reddedilmeTarihi: map["reddedilmeTarihi"],
        basvuruDurumu: map["basvuruDurumu"]);
  }
}
