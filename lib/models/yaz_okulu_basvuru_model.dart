import 'package:cloud_firestore/cloud_firestore.dart';

class YazOkuluBasvuruModel {
  String? id;
  String? ogrenciAd;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciAdres;
  String? ogrenciFakulte;
  String? ogrenciBolum;
  // String? ogrenciNo;
  String? ogrenciDanisman;
  String? bolumBaskan;
  String? basvurulanUniversite;
  String? yazOkuluTarih;
  Map<String, dynamic>? sorumluOlunanDersler;
  Map<String, dynamic>? yazOkuluAlinanDersler;
  String? olusturmaTarihi;
  String? onaylanmaTarihi;
  String? reddedilmeTarihi;
  String? basvuruDurumu;
  YazOkuluBasvuruModel({
    this.id,
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
    this.olusturmaTarihi,
    this.onaylanmaTarihi,
    this.reddedilmeTarihi,
    this.basvuruDurumu,
  });
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
        olusturmaTarihi: snapshot["olusturmaTarihi"],
        onaylanmaTarihi: snapshot["onaylanmaTarihi"],
        reddedilmeTarihi: snapshot["reddedilmeTarihi"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }

  factory YazOkuluBasvuruModel.fromMap(map){
    return YazOkuluBasvuruModel(
        id: map["id"],
        ogrenciAd: map["ogrenciAd"],
        ogrenciEmail: map["ogrenciEmail"],
        ogrenciGsm: map["ogrenciGsm"],
        ogrenciAdres: map["ogrenciAdres"],
        ogrenciFakulte: map["ogrenciFakulte"],
        ogrenciBolum: map["ogrenciBolum"],
        ogrenciDanisman: map["ogrenciDanisman"],
        bolumBaskan: map["bolumBaskan"],
        basvurulanUniversite: map["basvurulanUniversite"],
        yazOkuluTarih: map["yazOkuluTarih"],
        sorumluOlunanDersler: map["sorumluOlunanDersler"],
        yazOkuluAlinanDersler: map["yazOkuluAlinanDersler"],
        olusturmaTarihi: map["olusturmaTarihi"],
        onaylanmaTarihi: map["onaylanmaTarihi"],
        reddedilmeTarihi: map["reddedilmeTarihi"],
        basvuruDurumu: map["basvuruDurumu"]);
  }


  /* Map<String, dynamic> sorumluDerslerItem() {
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
  */
  /* Map<String, dynamic> yazOkuluAlinanDerslerItem(String fakulteBolum,String dersAdikodu,String t, String u, String l ,String akts) {
    return {
      'yazOkuluAlinanDersler': FieldValue.arrayUnion([
        {
          "Fakulte ve Bolum": fakulteBolum,
          "Ders Adi ve Kodu": dersAdikodu,
          "t": t,
          "u": u,
          "l": l,
          "AKTS": akts
        }
      ])
    };
  }  */
}
