import 'package:basvurukayit/models/intibak_basvuru_model.dart';
import 'package:basvurukayit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class IntibakBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? fakulteBolum, dersAdikodu, t, u, l, akts;

  Future<IntibakBasvuruModel> basvuruOlustur(
    String id,
    String ogrenciAd,
    String ogrenciEmail,
    String ogrenciGsm,
    String ogrenciAdres,
    String ogrenciNo,
    String ogrenciFakulte,
    String ogrenciBolum,
    String muafOlunanUniversite,
    sorumluOlunanDersler,
    dahaOnceAlinanDersler,
    String olusturmaTarihi,
    String onaylanmaTarihi,
    String reddedilmeTarihi,
    String basvuruDurumu,
  ) async {
    var ref = _firestore.collection("intibak_basvuru");
    basvuruDurumu = "onay bekliyor";
    onaylanmaTarihi = "belirsiz";
    reddedilmeTarihi = "belirsiz";
    var newIdRef = ref.doc();
    newIdRef.set({
      'id': newIdRef.id,
      'ogrenciAd': ogrenciAd,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'ogrenciNo': ogrenciNo,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'muafOlunanUniversite': muafOlunanUniversite,
      'sorumluOlunanDersler': sorumluOlunanDersler,
      'dahaOnceAlinanDersler': dahaOnceAlinanDersler,
      'olusturmaTarihi': DateTime.now().toString(),
      'onaylanmaTarihi': onaylanmaTarihi,
      'reddedilmeTarihi': reddedilmeTarihi,
      'basvuruDurumu': basvuruDurumu,
    });
    /* var docRef = await ref.add({
      'ogrenciAd': ogrenciAd,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'ogrenciNo': ogrenciNo,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'muafOlunanUniversite': muafOlunanUniversite,
      'sorumluOlunanDersler': sorumluOlunanDersler,
      'dahaOnceAlinanDersler': dahaOnceAlinanDersler,
      'olusturmaTarihi': DateTime.now().toString(),
      'basvuruDurumu': basvuruDurumu,
      'onaylanmaTarihi': onaylanmaTarihi,
      'reddedilmeTarihi': reddedilmeTarihi,
    });  */
    return IntibakBasvuruModel(
        id: newIdRef.id,
        ogrenciAd: ogrenciAd,
        ogrenciEmail: ogrenciEmail,
        ogrenciGsm: ogrenciGsm,
        ogrenciAdres: ogrenciAdres,
        ogrenciNo: ogrenciNo,
        ogrenciFakulte: ogrenciFakulte,
        ogrenciBolum: ogrenciBolum,
        muafOlunanUniversite: muafOlunanUniversite,
        sorumluOlunanDersler: sorumluOlunanDersler,
        dahaOnceAlinanDersler: dahaOnceAlinanDersler,
        olusturmaTarihi: olusturmaTarihi,
        onaylanmaTarihi: onaylanmaTarihi,
        reddedilmeTarihi: reddedilmeTarihi);
  }

  Stream<QuerySnapshot> basvurulariGetir(UserModel userModel) {
    CollectionReference collectionReference =
        _firestore.collection("intibak_basvuru");
    Query query =
        collectionReference.where("ogrenciEmail", isEqualTo: userModel.email);
    return query.snapshots();
  }

  Future basvuruOnaylaAdmin(String selectedDoc) async {
    FirebaseFirestore.instance
        .collection("intibak_basvuru")
        .doc(selectedDoc)
        .update({
      'basvuruDurumu': "onaylandı",
      'onaylanmaTarihi': DateTime.now().toString(),
    });
  }

  Future basvuruReddetAdmin(String selectedDoc) async {
    FirebaseFirestore.instance
        .collection("intibak_basvuru")
        .doc(selectedDoc)
        .update({
      'basvuruDurumu': "reddedildi",
      'reddedilmeTarihi': DateTime.now().toString(),
    });
  }

  Stream<QuerySnapshot> onayliBasvurulariGetirAdmin() {
    CollectionReference collectionReference =
        _firestore.collection("intibak_basvuru");
    Query query =
        collectionReference.where("basvuruDurumu", isEqualTo: "onaylandı");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Stream<QuerySnapshot> reddedilenBasvurulariGetirAdmin() {
    CollectionReference collectionReference =
        _firestore.collection("intibak_basvuru");
    Query query =
        collectionReference.where("basvuruDurumu", isEqualTo: "reddedildi");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Stream<QuerySnapshot> basvurulariGetirAdmin() {
    CollectionReference collectionReference =
        _firestore.collection("intibak_basvuru");
    Query query =
        collectionReference.where("basvuruDurumu", isEqualTo: "onay bekliyor");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }
}
