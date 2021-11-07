import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/models/yatay_basvuru_model.dart';
import 'package:basvurukayit/models/yaz_okulu_basvuru_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YazOkuluBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? fakulteBolum, dersAdikodu, t, u, l, akts;
  Future<YazOkuluBasvuruModel> basvuruOlustur(
    String id,
    String ogrenciAd,
    String ogrenciEmail,
    String ogrenciGsm,
    String ogrenciAdres,
    String ogrenciFakulte,
    String ogrenciBolum,
    String ogrenciDanisman,
    String basvurulanUniversite,
    String yazOkuluTarih,
    sorumluOlunanDersler,
    yazOkuluAlinanDersler,
    String olusturmaTarihi,
    String onaylanmaTarihi,
    String reddedilmeTarihi,
    String basvuruDurumu,
  ) async {
    var ref = _firestore.collection("yaz_okulu_basvuru");
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
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'ogrenciDanisman': ogrenciDanisman,
      'basvurulanUniversite': basvurulanUniversite,
      'yazOkuluTarih': yazOkuluTarih,
      'sorumluOlunanDersler': sorumluOlunanDersler,
      'yazOkuluAlinanDersler': yazOkuluAlinanDersler,
      'olusturmaTarihi': DateTime.now().toString(),
      'onaylanmaTarihi': onaylanmaTarihi,
      'reddedilmeTarihi': reddedilmeTarihi,
      'basvuruDurumu': basvuruDurumu,
    });

    /*  var docRef = await ref.add({
      'ogrenciAd': ogrenciAd,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'ogrenciDanisman': ogrenciDanisman,
      'basvurulanUniversite': basvurulanUniversite,
      'yazOkuluTarih': yazOkuluTarih,
      'sorumluOlunanDersler': sorumluOlunanDersler,
      'yazOkuluAlinanDersler': yazOkuluAlinanDersler,
      'olusturmaTarihi': DateTime.now().toString(),
      'basvuruDurumu': basvuruDurumu,
      'onaylanmaTarihi': onaylanmaTarihi,
      'basvuruDurumu': basvuruDurumu,
    });  */
    return YazOkuluBasvuruModel(
        id: newIdRef.id,
        ogrenciAd: ogrenciAd,
        ogrenciEmail: ogrenciEmail,
        ogrenciGsm: ogrenciGsm,
        ogrenciAdres: ogrenciAdres,
        ogrenciFakulte: ogrenciFakulte,
        ogrenciBolum: ogrenciBolum,
        ogrenciDanisman: ogrenciDanisman,
        basvurulanUniversite: basvurulanUniversite,
        yazOkuluTarih: yazOkuluTarih,
        sorumluOlunanDersler: sorumluOlunanDersler,
        yazOkuluAlinanDersler: yazOkuluAlinanDersler,
        olusturmaTarihi: olusturmaTarihi,
        onaylanmaTarihi: onaylanmaTarihi,
        reddedilmeTarihi: reddedilmeTarihi,
        basvuruDurumu: basvuruDurumu);
  }

  Stream<QuerySnapshot> basvurulariGetir(UserModel userModel) {
    CollectionReference collectionReference =
        _firestore.collection("yaz_okulu_basvuru");
    Query query =
        collectionReference.where("ogrenciEmail", isEqualTo: userModel.email);
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Stream<QuerySnapshot> basvurulariGetirAdmin() {
    CollectionReference collectionReference =
    _firestore.collection("yaz_okulu_basvuru");
    Query query =
    collectionReference.where("basvuruDurumu", isEqualTo: "onay bekliyor");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Stream<QuerySnapshot> onayliBasvurulariGetirAdmin() {
    CollectionReference collectionReference =
    _firestore.collection("yaz_okulu_basvuru");
    Query query =
    collectionReference.where("basvuruDurumu", isEqualTo: "onaylandı");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Stream<QuerySnapshot> reddedilenBasvurulariGetirAdmin() {
    CollectionReference collectionReference =
    _firestore.collection("yaz_okulu_basvuru");
    Query query =
    collectionReference.where("basvuruDurumu", isEqualTo: "reddedildi");
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

  Future basvuruOnaylaAdmin(String selectedDoc) async {
    FirebaseFirestore.instance
        .collection("yaz_okulu_basvuru")
        .doc(selectedDoc)
        .update({
      'basvuruDurumu': "onaylandı",
      'onaylanmaTarihi': DateTime.now().toString(),
    });
  }

  Future basvuruReddetAdmin(String selectedDoc) async {
    FirebaseFirestore.instance
        .collection("yaz_okulu_basvuru")
        .doc(selectedDoc)
        .update({
      'basvuruDurumu': "reddedildi",
      'reddedilmeTarihi': DateTime.now().toString(),
    });
  }




}
