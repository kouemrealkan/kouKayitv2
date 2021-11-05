import 'package:cloud_firestore/cloud_firestore.dart';

class CapBasvuruModel {
  String? id;
  String? ogrenciAd;
  String? ogrenciTc;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciAdres;
  String? ogrenciUniversite;
  String? ogrenciFakulte;
  String? ogrenciBolum;
  String? ogretimTuru;
  String? ogrenciYariyil;
  String? ogrenciDisiplin;
  String? ogrenciNotOrt;
  String? ogrenciNumarasi;
  String? basvurulanFakulte;
  String? basvurulanBolum;
  String? olusturmaTarihi;
  String? onaylanmaTarihi;
  String? reddedilmeTarihi;
  String? basvuruDurumu;

  CapBasvuruModel(
      {this.id,
        this.ogrenciAd,
        this.ogrenciTc,
        this.ogrenciEmail,
        this.ogrenciGsm,
        this.ogrenciAdres,
        this.ogrenciUniversite,
        this.ogrenciFakulte,
        this.ogrenciBolum,
        this.ogrenciYariyil,
        this.ogretimTuru,
        this.ogrenciDisiplin,
        this.ogrenciNotOrt,
        this.ogrenciNumarasi,
        this.basvurulanFakulte,
        this.basvurulanBolum,
        this.olusturmaTarihi,
        this.onaylanmaTarihi,
        this.reddedilmeTarihi,
        this.basvuruDurumu});

  factory CapBasvuruModel.fromSnapshot(DocumentSnapshot snapshot) {
    return CapBasvuruModel(
        id: snapshot.id,
        ogrenciAd: snapshot["ogrenciAd"],
        ogrenciTc: snapshot["ogrenciTc"],
        ogrenciEmail: snapshot["ogrenciEmail"],
        ogrenciGsm: snapshot["ogrenciGsm"],
        ogrenciAdres: snapshot["ogrenciAdres"],
        ogrenciUniversite: snapshot["ogrenciUniversite"],
        ogrenciFakulte: snapshot["ogrenciFakulte"],
        ogrenciBolum: snapshot["ogrenciBolum"],
        ogrenciYariyil: snapshot["ogrenciYariyil"],
        ogretimTuru: snapshot["ogretimTuru"],
        ogrenciDisiplin: snapshot["ogrenciDisiplin"],
        ogrenciNotOrt: snapshot["ogrenciNotOrt"],
        ogrenciNumarasi: snapshot["ogrenciNumarasi"],
        basvurulanFakulte: snapshot["basvurulanFakulte"],
        basvurulanBolum: snapshot["basvurulanBolum"],
        olusturmaTarihi: snapshot["olusturmaTarihi"],
        onaylanmaTarihi: snapshot["onaylanmaTarihi"],
        reddedilmeTarihi: snapshot["reddedilmeTarihi"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }

  factory CapBasvuruModel.fromMap(map){
    return CapBasvuruModel(
        id: map["id"],
        ogrenciAd: map["ogrenciAd"],
        ogrenciTc: map["ogrenciTc"],
        ogrenciEmail: map["ogrenciEmail"],
        ogrenciGsm: map["ogrenciGsm"],
        ogrenciAdres: map["ogrenciAdres"],
        ogrenciUniversite: map["ogrenciUniversite"],
        ogrenciFakulte: map["ogrenciFakulte"],
        ogrenciBolum: map["ogrenciBolum"],
        ogrenciYariyil: map["ogrenciYariyil"],
        ogretimTuru: map["ogretimTuru"],
        ogrenciDisiplin: map["ogrenciDisiplin"],
        ogrenciNotOrt: map["ogrenciNotOrt"],
        ogrenciNumarasi: map["ogrenciNumarasi"],
        basvurulanFakulte: map["basvurulanFakulte"],
        basvurulanBolum: map["basvurulanBolum"],
        olusturmaTarihi: map["olusturmaTarihi"].toString(),
        onaylanmaTarihi: map["onaylanmaTarihi"],
        reddedilmeTarihi: map["reddedilmeTarihi"],
        basvuruDurumu: map["basvuruDurumu"]);
  }

}