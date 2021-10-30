import 'package:basvurukayit/models/dgs_basvuru_model.dart';
import 'package:basvurukayit/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DgsBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DgsBasvuruModel> basvuruOlustur(
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
      basvuruDurumu) async {
    var ref = _firestore.collection("dgs_basvuru");
    basvuruDurumu = "onay bekliyor";
    var documentRef = await ref.add({
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
      'basvuruDurumu': basvuruDurumu
    });
    return DgsBasvuruModel(
        id: documentRef.id,
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
        basvuruDurumu: basvuruDurumu);
  }

  Stream<QuerySnapshot> basvurulariGetir(UserModel userModel) {
    CollectionReference collectionReference = _firestore.collection("dgs_basvuru");
    Query query = collectionReference.where("ogrenciEmail",isEqualTo: userModel.email);
    return query.snapshots();
  }

}
