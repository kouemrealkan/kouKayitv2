import 'package:cloud_firestore/cloud_firestore.dart';

class DgsBasvuruModel {
  String? id;
  String? ogrenciAd;
  String? ogrenciTc;
  String? ogrenciDogumTarih;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciAdres;
  String? ogrenciNumarasi;
  String? ogrenciUniversite;
  String? ogrenciFakulte;
  String? ogrenciBolum;
  String? ogrenciDiplomaNotu;
  String? ogrenciYerlesmePuani;
  String? ogrenciYerlesmeYili;
  String? basvuruDurumu;

  DgsBasvuruModel(
      {this.id,
      this.ogrenciAd,
      this.ogrenciTc,
      this.ogrenciDogumTarih,
      this.ogrenciEmail,
      this.ogrenciGsm,
      this.ogrenciAdres,
      this.ogrenciUniversite,
      this.ogrenciFakulte,
      this.ogrenciBolum,
      this.ogrenciDiplomaNotu,
      this.ogrenciNumarasi,
      this.ogrenciYerlesmeYili,
      this.ogrenciYerlesmePuani,
      this.basvuruDurumu});

  factory DgsBasvuruModel.fromSnapshot(DocumentSnapshot snapshot) {
    return DgsBasvuruModel(
        id: snapshot.id,
        ogrenciAd: snapshot["ogrenciAd"],
        ogrenciTc: snapshot["ogrenciTc"],
        ogrenciDogumTarih: snapshot["ogrenciDogumTarih"],
        ogrenciEmail: snapshot["ogrenciEmail"],
        ogrenciGsm: snapshot["ogrenciGsm"],
        ogrenciAdres: snapshot["ogrenciAdres"],
        ogrenciNumarasi: snapshot["ogrenciNumarasi"],
        ogrenciUniversite: snapshot["ogrenciUniversite"],
        ogrenciFakulte: snapshot["ogrenciFakulte"],
        ogrenciBolum: snapshot["ogrenciBolum"],
        ogrenciDiplomaNotu: snapshot["ogrenciDiplomaNotu"],
        ogrenciYerlesmePuani: snapshot["ogrenciYerlesmePuani"],
        ogrenciYerlesmeYili: snapshot["ogrenciYerlesmeYili"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }
}
