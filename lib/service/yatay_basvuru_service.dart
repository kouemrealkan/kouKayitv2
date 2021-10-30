import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/models/yatay_basvuru_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class YatayBasvuruService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
Future<YatayGecisBasvuruModel> basvuruOlustur(
      String basvuruTuru,
      ogrenciAd,
      ogrenciTc,
      ogrenciDogumtarih,
      ogrenciEmail,
      ogrenciGsm,
      ogrenciAdres,
      ogrenciFakulte,
      ogrenciBolum,
      ogretimTuru,
      ogrenciSinif,
      ogrenciDisiplin,
      ogrenciNotOrt,
      ogrenciNumarasi,
      ogrenciYerlesmeYili,
      ogrenciPuan,
      yabanciDilPuan,
      basvurulanFakulte,
      basvurulanBolum,
      basvurulanBolumPuan,
      basvuruDurumu) async {
    var ref = _firestore.collection("yatay_gecis_basvuru");
    basvuruDurumu = "onay bekliyor";
    var documentRef = await ref.add({
      'basvuruTuru': basvuruTuru,
      'ogrenciAd': ogrenciAd,
      'ogrenciTc': ogrenciTc,
      'ogrenciDogumtarih': ogrenciDogumtarih,
      'ogrenciEmail': ogrenciEmail,
      'ogrenciGsm': ogrenciGsm,
      'ogrenciAdres': ogrenciAdres,
      'ogrenciFakulte': ogrenciFakulte,
      'ogrenciBolum': ogrenciBolum,
      'ogretimTuru': ogretimTuru,
      'ogrenciSinif': ogrenciSinif,
      'ogrenciDisiplin': ogrenciDisiplin,
      'ogrenciNotOrt': ogrenciNotOrt,
      'ogrenciNumarasi': ogrenciNumarasi,
      'ogrenciYerlesmeYili': ogrenciYerlesmeYili,
      'ogrenciPuan': ogrenciPuan,
      'yabanciDilPuan': yabanciDilPuan,
      'basvurulanFakulte': basvurulanFakulte,
      'basvurulanBolum': basvurulanBolum,
      'basvurulanBolumPuan': basvurulanBolumPuan,
      'basvuruDurumu': basvuruDurumu
    });
    return YatayGecisBasvuruModel(id: documentRef.id,basvuruTuru: basvuruTuru,ogrenciAd: ogrenciAd,ogrenciDogumtarih: ogrenciDogumtarih,ogrenciEmail: ogrenciEmail,ogrenciGsm: ogrenciGsm,ogrenciAdres: ogrenciAdres,ogrenciBolum: ogrenciBolum,ogretimTuru: ogretimTuru,ogrenciSinif: ogrenciSinif,ogrenciDisiplin: ogrenciDisiplin,ogrenciNotOrt: ogrenciNotOrt,ogrenciNumarasi: ogrenciNumarasi,ogrenciYerlesmeYili: ogrenciYerlesmeYili,ogrenciPuan: ogrenciPuan,yabanciDilPuan: yabanciDilPuan,basvurulanFakulte: basvurulanFakulte,basvurulanBolum: basvurulanBolum,basvurulanBolumPuan: basvurulanBolumPuan,basvuruDurumu: basvuruDurumu);
  }

   Stream<QuerySnapshot> basvurulariGetir (UserModel userModel) {
    CollectionReference collectionReference = _firestore.collection("yatay_gecis_basvuru");
    Query query = collectionReference.where("ogrenciEmail",isEqualTo: userModel.email);
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }
  Stream<QuerySnapshot> basvurulariGetirPdf (YatayGecisBasvuruModel yatayGecisBasvuruModel) {
    CollectionReference collectionReference = _firestore.collection("yatay_gecis_basvuru");
    Query query = collectionReference.where(yatayGecisBasvuruModel.docId!,isEqualTo: collectionReference.doc().id);
    //print("email degeri +++:" + loggedInUser.email!);
    return query.snapshots();
    //var ref = _firestore.collection("yatay_gecis_basvuru").snapshots();
    //return ref;
  }

}
