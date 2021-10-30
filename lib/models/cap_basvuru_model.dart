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
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }

}