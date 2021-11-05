import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/secim_ekrani.dart';
import 'package:basvurukayit/service/dgs_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';
import 'package:intl/intl.dart';

class DgsBasvuru extends StatefulWidget {
  const DgsBasvuru({Key? key}) : super(key: key);

  @override
  _DgsBasvuruState createState() => _DgsBasvuruState();
}

class _DgsBasvuruState extends State<DgsBasvuru> {
  TextEditingController _ogrenciDiplomaNotuController = TextEditingController();
  TextEditingController _ogrenciYerlesmeYiliController =
  TextEditingController();
  TextEditingController _ogrenciYerlesmePuaniController =
  TextEditingController();
  String id = "";
  String basvuruDurum = "";
  String olusturmaTarihi = "";
  String onaylanmaTarihi = "";
  String reddedilmeTarihi = "";
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  DateTime currentTime = DateTime.now();

  DgsBasvuruService _dgsBasvuruService = DgsBasvuruService();

  List<String> _checkedOnay = [];
  String secilenHolderOnay = "";

  @override
  void initState() {
    super.initState();
    FirebaseFirestore.instance
        .collection("users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.loggedInUser = UserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final DateFormat dateFormat = DateFormat('dd-MM-yyyy');
    final String formattedDate = dateFormat.format(currentTime).toString();
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
                height: 150.0,
                width: 120.0,
              ),
              Container(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
                child: Text(
                  '       KOCAELİ ÜNİVERSİTESİ\nDGS BAŞVURU FORMU',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                '1-Kişisel Bilgiler',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 5,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.userName!.toUpperCase()}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.tcId}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.dogumTarihi}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.email}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.gsm}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.evAdres}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                '3-Öğrenimine ilişkin bilgiler',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.universite}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.fakulte}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.bolum}'),
                  readOnly: true,
                  showCursor: false,
                  autofocus: false,
                  onTap: () {
                    FocusScope.of(context).unfocus();
                  },
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                '3-Öğrenci Başvurusuna Ait Bilgiler',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'GENEL NOT ORTALAMASI'),
                  controller: _ogrenciDiplomaNotuController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: '${loggedInUser.ogrenciNo}'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                    decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'KAYITLI ÜNİVERSİTEYE YERLEŞME YILI'),
                    controller: _ogrenciYerlesmeYiliController),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
                child: TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'YERLEŞİLEN PUAN TÜRÜ VE PUANI'),
                  controller: _ogrenciYerlesmePuaniController,
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'Beyan ettiğim bilgilerin veya belgelerin gerçeğe aykırı olması veya daha önce yatay geçiş yapmış olmam halinde hakkımda cezai işlemlerin yürütüleceğini ve kaydım yapılmış olsa dahi silineceğini bildiğimi kabul ediyorum.'),
                      SizedBox(
                        height: 12,
                      ),
                      Row(
                        children: [
                          Text(' Tarih : ${formattedDate.toString()}'),
                          SizedBox(
                            width: 140,
                          ),
                          Column(
                            children: [
                              Text(
                                ' Ad-Soyad',
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('${loggedInUser.userName!.toUpperCase()}'),
                              SizedBox(
                                height: 14,
                              ),
                              Text('imza')
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
              Divider(
                color: Colors.black,
              ),
              Text(
                'BU BÖLÜM ÜNİVERSİTE YETKİLİ BİRİMLERİNCE DOLDURULACAKTIR',
                style: TextStyle(fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              ListView(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  CheckboxGroup(
                    labels: <String>[
                      "BAŞVURUSU UYGUNDUR",
                      "BAŞVURUSU UYGUN DEĞİLDİR",
                    ],
                    disabled: [
                      "BAŞVURUSU UYGUNDUR",
                      "BAŞVURUSU UYGUN DEĞİLDİR"
                    ],
                    checked: _checkedOnay,
                    onChange: (bool isChecked, String label, int index) => print(
                        "isChecked: $isChecked   label: $label  index: $index"),
                    onSelected: (List<String> selectedOnay) => setState(() {
                      if (selectedOnay.length > 1) {
                        selectedOnay.removeAt(0);
                        print('selected length  ${selectedOnay.length}');
                        print('selected value : ${selectedOnay.toString()}');
                        secilenHolderOnay = selectedOnay.join("");
                        print("değerrrrrr" + secilenHolderOnay);
                      } else {
                        print("only one");
                        print('selected value : ${selectedOnay.toString()}');
                        secilenHolderOnay = selectedOnay.join("");
                        print("değerrrrrr" + secilenHolderOnay);
                      }
                      _checkedOnay = selectedOnay;
                    }),
                  ),
                ],
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          'Varsa açıklamalar : .....................................'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        ' Tarih : ..../.../.....                           ',
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                          ' Başvuruyu alan görevlinin                                 Ad-Soyad İmza')
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 25),
                  child: InkWell(
                    onTap: () {
                      _dgsBasvuruService.basvuruOlustur(
                          id,
                          loggedInUser.userName,
                          loggedInUser.tcId,
                          loggedInUser.dogumTarihi,
                          loggedInUser.email,
                          loggedInUser.gsm,
                          loggedInUser.evAdres,
                          loggedInUser.ogrenciNo,
                          loggedInUser.universite,
                          loggedInUser.fakulte,
                          loggedInUser.bolum,
                          _ogrenciDiplomaNotuController.text,
                          _ogrenciYerlesmePuaniController.text,
                          _ogrenciYerlesmeYiliController.text,
                          olusturmaTarihi,
                          onaylanmaTarihi,
                          reddedilmeTarihi,
                          basvuruDurum);
                      showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            title: Text('Başvuru onayınız alındı'),
                            content: Text(
                                'Kontroller ardından onay/ret işlemi gerçekleştirilecektir'),
                          )).then((value) => Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => SecimEkrani())));
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.green, width: 2),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Center(
                          child: Text(
                            "Başvuruyu Gönder",
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
