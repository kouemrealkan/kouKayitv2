import 'package:cloud_firestore/cloud_firestore.dart';

class YatayGecisBasvuruModel {
  String? id;
  String? basvuruTuru;
  String? ogrenciAd;
  String? ogrenciTc;
  String? ogrenciDogumtarih;
  String? ogrenciEmail;
  String? ogrenciGsm;
  String? ogrenciAdres;
  String? ogrenciUniversite;
  String? ogrenciFakulte;
  String? ogrenciBolum;
  String? ogretimTuru;
  String? ogrenciSinif;
  String? ogrenciDisiplin;
  String? ogrenciNotOrt;
  String? ogrenciNumarasi;
  String? ogrenciYerlesmeYili;
  String? ogrenciPuan;
  String? yabanciDilPuan;
  String? basvurulanFakulte;
  String? basvurulanBolum;
  String? basvurulanBolumPuan;
  String? olusturmaTarihi;
  String? onaylanmaTarihi;
  String? reddedilmeTarihi;
  String? basvuruDurumu;
  String? docId;
  YatayGecisBasvuruModel(
      {this.id,
      this.basvuruTuru,
      this.ogrenciAd,
      this.ogrenciTc,
      this.ogrenciDogumtarih,
      this.ogrenciEmail,
      this.ogrenciGsm,
      this.ogrenciAdres,
      this.ogrenciUniversite,
      this.ogrenciFakulte,
      this.ogrenciBolum,
      this.ogretimTuru,
      this.ogrenciSinif,
      this.ogrenciDisiplin,
      this.ogrenciNotOrt,
      this.ogrenciNumarasi,
      this.ogrenciYerlesmeYili,
      this.ogrenciPuan,
      this.yabanciDilPuan,
      this.basvurulanFakulte,
      this.basvurulanBolum,
      this.basvurulanBolumPuan,
      this.olusturmaTarihi,
      this.onaylanmaTarihi,
      this.reddedilmeTarihi,
      this.docId,
      this.basvuruDurumu});

  factory YatayGecisBasvuruModel.fromSnapshot(DocumentSnapshot snapshot) {
    return YatayGecisBasvuruModel(
        id: snapshot.id,
        basvuruTuru: snapshot["basvuruTuru"],
        ogrenciAd: snapshot["ogrenciAd"],
        ogrenciTc: snapshot["ogrenciTc"],
        ogrenciDogumtarih: snapshot["ogrenci"],
        ogrenciEmail: snapshot["ogrenciEmail"],
        ogrenciGsm: snapshot["ogrenciGsm"],
        ogrenciAdres: snapshot["ogrenciAdres"],
        ogrenciFakulte: snapshot["ogrenciFakulte"],
        ogrenciBolum: snapshot["ogrenciBolum"],
        ogretimTuru: snapshot["ogretimTuru"],
        ogrenciSinif: snapshot["ogrenciSinif"],
        ogrenciDisiplin: snapshot["ogrenciDisiplin"],
        ogrenciNotOrt: snapshot["ogrenciNotOrt"],
        ogrenciNumarasi: snapshot["ogrenciNumarasi"],
        ogrenciYerlesmeYili: snapshot["ogrenciYerlesmeYili"],
        ogrenciPuan: snapshot["ogrenciPuan"],
        yabanciDilPuan: snapshot["yabanciDilPuan"],
        basvurulanFakulte: snapshot["basvurulanFakulte"],
        basvurulanBolum: snapshot["basvurulanBolum"],
        basvurulanBolumPuan: snapshot["basvurulanBolumPuan"],
        olusturmaTarihi: snapshot["olusturmaTarihi"],
        onaylanmaTarihi: snapshot["onaylanmaTarihi"],
        reddedilmeTarihi: snapshot["reddedilmeTarihi"],
        basvuruDurumu: snapshot["basvuruDurumu"]);
  }

  factory YatayGecisBasvuruModel.fromMap(map) {
    return YatayGecisBasvuruModel(
        id: map["id"],
        basvuruTuru: map["basvuruTuru"],
        ogrenciAd: map["ogrenciAd"],
        ogrenciTc: map["ogrenciTc"],
        ogrenciDogumtarih: map["ogrenci"],
        ogrenciEmail: map["ogrenciEmail"],
        ogrenciGsm: map["ogrenciGsm"],
        ogrenciAdres: map["ogrenciAdres"],
        ogrenciFakulte: map["ogrenciFakulte"],
        ogrenciBolum: map["ogrenciBolum"],
        ogretimTuru: map["ogretimTuru"],
        ogrenciSinif: map["ogrenciSinif"],
        ogrenciDisiplin: map["ogrenciDisiplin"],
        ogrenciNotOrt: map["ogrenciNotOrt"],
        ogrenciNumarasi: map["ogrenciNumarasi"],
        ogrenciYerlesmeYili: map["ogrenciYerlesmeYili"],
        ogrenciPuan: map["ogrenciPuan"],
        yabanciDilPuan: map["yabanciDilPuan"],
        basvurulanFakulte: map["basvurulanFakulte"],
        basvurulanBolum: map["basvurulanBolum"],
        basvurulanBolumPuan: map["basvurulanBolumPuan"],
        olusturmaTarihi: map["olusturmaTarihi"],
        onaylanmaTarihi: map["onaylanmaTarihi"],
        reddedilmeTarihi: map["reddedilmeTarihi"],
        basvuruDurumu: map["basvuruDurumu"],
        docId: map["docId"]);
  }
}
