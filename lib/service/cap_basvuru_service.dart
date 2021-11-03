import 'package:basvurukayit/models/cap_basvuru_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CapBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CapBasvuruModel> basvuruOlustur(
      String ogrenciAd,
      ogrenciTc,
      ogrenciEmail,
      ogrenciGsm,
      ogrenciAdres,
      ogrenciUniversite,
      ogrenciFakulte,
      ogrenciBolum,
      ogretimTuru,
      ogrenciYariyil,
      ogrenciDisiplin,
      ogrenciNotOrt,
      ogrenciNumarasi,
      basvurulanFakulte,
      basvurulanBolum,
      basvuruDurumu) async {
    var ref = _firestore.collection("cap_basvuru");
    basvuruDurumu = "onay bekliyor";
    var docRef = await ref.add({
      'ogrenciAd': ogrenciAd,
      'ogrenciTc': ogrenciTc,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'ogrenciUniversite': ogrenciUniversite,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'ogretimTuru': ogretimTuru,
      'ogrenciYariyil': ogrenciYariyil,
      'ogrenciDisiplin': ogrenciDisiplin,
      'ogrenciNotOrt': ogrenciNotOrt,
      'ogrenciNumarasi': ogrenciNumarasi,
      'basvurulanFakulte': basvurulanFakulte,
      'basvurulanBolum': basvurulanBolum,
      'basvuruDurumu': basvuruDurumu
    });
    return CapBasvuruModel(
        id: docRef.id,
        ogrenciAd: ogrenciAd,
        ogrenciEmail: ogrenciEmail,
        ogrenciGsm: ogrenciGsm,
        ogrenciAdres: ogrenciAdres,
        ogrenciUniversite: ogrenciUniversite,
        ogrenciBolum: ogrenciBolum,
        ogretimTuru: ogretimTuru,
        ogrenciYariyil: ogrenciYariyil,
        ogrenciDisiplin: ogrenciDisiplin,
        ogrenciNotOrt: ogrenciNotOrt,
        ogrenciNumarasi: ogrenciNumarasi,
        basvurulanFakulte: basvurulanFakulte,
        basvurulanBolum: basvurulanBolum,
        basvuruDurumu: basvuruDurumu);
  }

  Stream<QuerySnapshot> basvurulariGetir() {
    var ref = _firestore.collection("cap_basvuru").snapshots();
    return ref;
  }

  Future basvuruOnaylaAdmin(String selectedDoc) async {
    FirebaseFirestore.instance.collection("cap_basvuru").doc(selectedDoc).update({
      'basvuruDurumu': "onaylandı"
    });
  }

  Future basvuruReddetAdmin(String selectedDoc) async {
    FirebaseFirestore.instance.collection("cap_basvuru").doc(selectedDoc).update({
      'basvuruDurumu': "reddedildi"
    });
  }

  Stream<QuerySnapshot> onayliBasvurulariGetirAdmin() {
    CollectionReference collectionReference =
    _firestore.collection("cap_basvuru");
    Query query =
    collectionReference.where("basvuruDurumu", isEqualTo: "onaylandı");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Stream<QuerySnapshot> reddedilenBasvurulariGetirAdmin() {
    CollectionReference collectionReference =
    _firestore.collection("cap_basvuru");
    Query query =
    collectionReference.where("basvuruDurumu", isEqualTo: "reddedildi");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }


  Stream<QuerySnapshot> basvurulariGetirAdmin() {
    CollectionReference collectionReference =
    _firestore.collection("cap_basvuru");
    Query query =
    collectionReference.where("basvuruDurumu", isEqualTo: "onay bekliyor");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

}
