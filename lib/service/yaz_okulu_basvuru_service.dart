import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/models/yatay_basvuru_model.dart';
import 'package:basvurukayit/models/yaz_okulu_basvuru_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class YazOkuluBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  String? fakulteBolum, dersAdikodu, t, u,  l ,  akts;
  Future<YazOkuluBasvuruModel> basvuruOlustur(
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
      String basvuruDurumu,) async {
    var ref = _firestore.collection("yaz_okulu_basvuru");
    basvuruDurumu = "onay bekliyor";

    var docRef = await ref.add({
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
      'basvuruDurumu': basvuruDurumu,
    });
    return YazOkuluBasvuruModel(
        id: docRef.id,
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
        yazOkuluAlinanDersler: yazOkuluAlinanDersler);
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

}
