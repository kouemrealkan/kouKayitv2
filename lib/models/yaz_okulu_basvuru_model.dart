import 'package:cloud_firestore/cloud_firestore.dart';

class YazOkuluBasvuruModel {
  String? id;
  String? ogrenciAd;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciAdres;
  String? ogrenciFakulte;
  String? ogrenciBolum;
  String? ogrenciDanisman;
  String? bolumBaskan;
  String? basvurulanUniversite;
  String? yazOkuluTarih;
  Map<String,dynamic>? sorumluOlunanDersler;
  Map<String,dynamic>? yazOkuluAlinanDersler;
  String? basvuruDurumu;

  YazOkuluBasvuruModel(
      {this.id,
      this.ogrenciAd,
      this.ogrenciEmail,
      this.ogrenciGsm,
      this.ogrenciAdres,
      this.ogrenciFakulte,
      this.ogrenciBolum,
      this.ogrenciDanisman,
      this.bolumBaskan,
      this.basvurulanUniversite,
      this.yazOkuluTarih,
      this.sorumluOlunanDersler,
      this.yazOkuluAlinanDersler,
      this.basvuruDurumu,});
  factory YazOkuluBasvuruModel.fromSnapshot(DocumentSnapshot snapshot) {
    return YazOkuluBasvuruModel(
        id: snapshot.id,
        ogrenciAd: snapshot["ogrenciAd"],
        ogrenciEmail: snapshot["ogrenciEmail"],
        ogrenciGsm: snapshot["ogrenciGsm"],
        ogrenciAdres: snapshot["ogrenciAdres"],
        ogrenciFakulte: snapshot["ogrenciFakulte"],
        ogrenciBolum: snapshot["ogrenciBolum"],
        ogrenciDanisman: snapshot["ogrenciDanisman"],
        bolumBaskan: snapshot["bolumBaskan"],
        basvurulanUniversite: snapshot["basvurulanUniversite"],
        yazOkuluTarih: snapshot["yazOkuluTarih"],
        sorumluOlunanDersler: snapshot["sorumluOlunanDersler"],
        yazOkuluAlinanDersler: snapshot["yazOkuluAlinanDersler"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }
  Map<String, dynamic> sorumluDerslerItem() {
    return {
      'sorumluOlunanDersler': FieldValue.arrayUnion([
        {
          "Ders Adi ve Kodu": "dersAdiveKodu",
          "t": "t",
          "u": "u",
          "l": "l",
          "AKTS": "akts"
        }
      ])
    };
  }

  Map<String, dynamic> yazOkuluAlinanDerslerItem() {
    return {
      'yazOkuluAlinanDersler': FieldValue.arrayUnion([
        {
          "Fakulte ve Bolum": "fakulteBolum",
          "Ders Adi ve Kodu": "dersAdiveKodu",
          "t": "t",
          "u": "u",
          "l": "l",
          "AKTS": "akts"
        }
      ])
    };
  }
}
