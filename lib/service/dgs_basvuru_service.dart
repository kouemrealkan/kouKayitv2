import 'package:basvurukayit/models/dgs_basvuru_model.dart';
import 'package:basvurukayit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DgsBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DgsBasvuruModel> basvuruOlustur(
      String id,
      ogrenciAd,
      ogrenciTc,
      ogrenciDogumtarih,
      ogrenciEmail,
      ogrenciGsm,
      ogrenciAdres,
      ogrenciNumarasi,
      ogrenciUniversite,
      ogrenciFakulte,
      ogrenciBolum,
      ogrenciDiplomaNotu,
      ogrenciYerlesmePuani,
      ogrenciYerlesmeYili,
      String olusturmaTarihi,
      String onaylanmaTarihi,
      String reddedilmeTarihi,
      basvuruDurumu) async {
    var ref = _firestore.collection("dgs_basvuru");
    basvuruDurumu = "onay bekliyor";
    onaylanmaTarihi = "belirsiz";
    reddedilmeTarihi = "belirsiz";
    var newIdRef = ref.doc();
    newIdRef.set({
      'id': newIdRef.id,
      'ogrenciAd': ogrenciAd,
      'ogrenciTc': ogrenciTc,
      'ogrenciDogumtarih': ogrenciDogumtarih,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'ogrenciNumarasi': ogrenciNumarasi,
      'ogrenciUniversite': ogrenciUniversite,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'ogrenciDiplomaNotu': ogrenciDiplomaNotu,
      'ogrenciYerlesmePuani': ogrenciYerlesmePuani,
      'ogrenciYerlesmeYili': ogrenciYerlesmeYili,
      'olusturmaTarihi': DateTime.now().toString(),
      'onaylanmaTarihi': onaylanmaTarihi,
      'reddedilmeTarihi': reddedilmeTarihi,
      'basvuruDurumu': basvuruDurumu
    });
    /*   var documentRef = await ref.add({
      'ogrenciAd': ogrenciAd,
      'ogrenciTc': ogrenciTc,
      'ogrenciDogumtarih': ogrenciDogumtarih,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'ogrenciNumarasi': ogrenciNumarasi,
      'ogrenciUniversite': ogrenciUniversite,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'ogrenciDiplomaNotu': ogrenciDiplomaNotu,
      'ogrenciYerlesmePuani': ogrenciYerlesmePuani,
      'ogrenciYerlesmeYili': ogrenciYerlesmeYili,
      'olusturmaTarihi': DateTime.now().toString(),
      'onaylanmaTarihi': onaylanmaTarihi,
      'reddedilmeTarihi': reddedilmeTarihi,
      'basvuruDurumu': basvuruDurumu
    });  */
    return DgsBasvuruModel(
        id: newIdRef.id,
        ogrenciAd: ogrenciAd,
        ogrenciTc: ogrenciTc,
        ogrenciDogumTarih: ogrenciDogumtarih,
        ogrenciEmail: ogrenciEmail,
        ogrenciGsm: ogrenciGsm,
        ogrenciAdres: ogrenciAdres,
        ogrenciUniversite: ogrenciUniversite,
        ogrenciFakulte: ogrenciFakulte,
        ogrenciBolum: ogrenciBolum,
        ogrenciNumarasi: ogrenciNumarasi,
        ogrenciDiplomaNotu: ogrenciDiplomaNotu,
        ogrenciYerlesmePuani: ogrenciYerlesmePuani,
        ogrenciYerlesmeYili: ogrenciYerlesmeYili,
        olusturmaTarihi: olusturmaTarihi,
        onaylanmaTarihi: onaylanmaTarihi,
        reddedilmeTarihi: reddedilmeTarihi,
        basvuruDurumu: basvuruDurumu);
  }

  Stream<QuerySnapshot> basvurulariGetirAdmin() {
    CollectionReference collectionReference =
        _firestore.collection("dgs_basvuru");
    Query query =
        collectionReference.where("basvuruDurumu", isEqualTo: "onay bekliyor");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Future basvuruOnaylaAdmin(String selectedDoc) async {
    FirebaseFirestore.instance
        .collection("dgs_basvuru")
        .doc(selectedDoc)
        .update({
      'basvuruDurumu': "onaylandı",
      'onaylanmaTarihi': DateTime.now().toString(),
    });
  }

  Future basvuruReddetAdmin(String selectedDoc) async {
    FirebaseFirestore.instance
        .collection("dgs_basvuru")
        .doc(selectedDoc)
        .update({
      'basvuruDurumu': "reddedildi",
      'reddedilmeTarihi': DateTime.now().toString(),
    });
  }

  Stream<QuerySnapshot> onayliBasvurulariGetirAdmin() {
    CollectionReference collectionReference =
        _firestore.collection("dgs_basvuru");
    Query query =
        collectionReference.where("basvuruDurumu", isEqualTo: "onaylandı");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Stream<QuerySnapshot> reddedilenBasvurulariGetirAdmin() {
    CollectionReference collectionReference =
        _firestore.collection("dgs_basvuru");
    Query query =
        collectionReference.where("basvuruDurumu", isEqualTo: "reddedildi");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Stream<QuerySnapshot> basvurulariGetir(UserModel userModel) {
    CollectionReference collectionReference =
        _firestore.collection("dgs_basvuru");
    Query query =
        collectionReference.where("ogrenciEmail", isEqualTo: userModel.email);
    return query.snapshots();
  }
}
