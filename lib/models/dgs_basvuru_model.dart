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
  String? olusturmaTarihi;
  String? onaylanmaTarihi;
  String? reddedilmeTarihi;
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
      this.olusturmaTarihi,
      this.onaylanmaTarihi,
      this.reddedilmeTarihi,
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
        olusturmaTarihi: snapshot["olusturmaTarihi"],
        onaylanmaTarihi: snapshot["onaylanmaTarihi"],
        reddedilmeTarihi: snapshot["reddedilmeTarihi"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }

  factory DgsBasvuruModel.fromMap(map){
     return DgsBasvuruModel(
         id: map["id"],
         ogrenciAd: map["ogrenciAd"],
         ogrenciTc: map["ogrenciTc"],
         ogrenciDogumTarih: map["ogrenciDogumTarih"],
         ogrenciEmail: map["ogrenciEmail"],
         ogrenciGsm: map["ogrenciGsm"],
         ogrenciAdres: map["ogrenciAdres"],
         ogrenciNumarasi: map["ogrenciNumarasi"],
         ogrenciUniversite: map["ogrenciUniversite"],
         ogrenciFakulte: map["ogrenciFakulte"],
         ogrenciBolum: map["ogrenciBolum"],
         ogrenciDiplomaNotu: map["ogrenciDiplomaNotu"],
         ogrenciYerlesmePuani: map["ogrenciYerlesmePuani"],
         ogrenciYerlesmeYili: map["ogrenciYerlesmeYili"],
         olusturmaTarihi: map["olusturmaTarihi"],
         onaylanmaTarihi: map["onaylanmaTarihi"],
         reddedilmeTarihi: map["reddedilmeTarihi"],
         basvuruDurumu: map["basvuruDurumu"]);
  }

}
