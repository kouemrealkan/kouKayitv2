import 'package:basvurukayit/models/cap_basvuru_model.dart';
import 'package:basvurukayit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CapBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<CapBasvuruModel> basvuruOlustur(
      String id,
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
      String olusturmaTarihi,
      String onaylanmaTarihi,
      String reddedilmeTarihi,
      basvuruDurumu) async {
    var ref = _firestore.collection("cap_basvuru");
    basvuruDurumu = "onay bekliyor";
    onaylanmaTarihi = "belirsiz";
    reddedilmeTarihi = "belirsiz";
    var newIdRef = ref.doc();
    newIdRef.set({
      'id': newIdRef.id,
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
      'olusturmaTarihi': DateTime.now().toString(),
      'onaylanmaTarihi': onaylanmaTarihi,
      'reddedilmeTarihi': reddedilmeTarihi,
      'basvuruDurumu': basvuruDurumu
    });
    /* var docRef = await ref.add({
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
      'olusturmaTarihi': DateTime.now(),
      'onaylanmaTarihi': onaylanmaTarihi,
      'reddedilmeTarihi': reddedilmeTarihi,
      'basvuruDurumu': basvuruDurumu
    });  */
    return CapBasvuruModel(
        id: newIdRef.id,
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
        olusturmaTarihi: olusturmaTarihi,
        onaylanmaTarihi: onaylanmaTarihi,
        reddedilmeTarihi: reddedilmeTarihi,
        basvuruDurumu: basvuruDurumu);
  }

  Stream<QuerySnapshot> basvurulariGetir(UserModel userModel) {
    CollectionReference collectionReference =
        _firestore.collection("cap_basvuru");
    Query query =
        collectionReference.where("ogrenciEmail", isEqualTo: userModel.email);
    return query.snapshots();
  }

  Future basvuruOnaylaAdmin(String selectedDoc) async {
    FirebaseFirestore.instance
        .collection("cap_basvuru")
        .doc(selectedDoc)
        .update({
      'basvuruDurumu': "onaylandı",
      'onaylanmaTarihi': DateTime.now().toString(),
    });
  }

  Future basvuruReddetAdmin(String selectedDoc) async {
    FirebaseFirestore.instance
        .collection("cap_basvuru")
        .doc(selectedDoc)
        .update({
      'basvuruDurumu': "reddedildi",
      'reddedilmeTarihi': DateTime.now().toString(),
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
