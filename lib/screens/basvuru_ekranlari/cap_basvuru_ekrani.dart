import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/secim_ekrani.dart';
import 'package:basvurukayit/service/cap_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:grouped_buttons/grouped_buttons.dart';

class CapBasvuruEkrani extends StatefulWidget {
  const CapBasvuruEkrani({Key? key}) : super(key: key);

  @override
  _CapBasvuruEkraniState createState() => _CapBasvuruEkraniState();
}

class _CapBasvuruEkraniState extends State<CapBasvuruEkrani> {
  CapBasvuruService _capBasvuruService = CapBasvuruService();
  List<String> _checkedOgretimTuru = [];
  List<String> _checkedSinifTuru = [];
  String basvuruDurum = "";
  String olusturmaTarihi = "";
  String onaylanmaTarihi = "";
  String reddedilmeTarihi = "";
  List<String> _checkedDisiplin = [];
  String secilenHolderOgretim = "";
  String secilenHolderSinif = "";
  String secilenHolderDisiplin = "";
  String id = "";

  TextEditingController _notOrtcontroller = TextEditingController();
  TextEditingController _kayitliOlununPrograminYariyili =
      TextEditingController();
  TextEditingController _basvurulanFakulteController = TextEditingController();
  TextEditingController _basvurulanBolumController = TextEditingController();
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  DateTime currentTime = DateTime.now();
  @override
  void initState() {
    // TODO: implement initState
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
                'KOCAELİ ÜNİVERSİTESİ\nÇAP BAŞVURU FORMU',
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.green,
                ),
              ),
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
              '2-Öğrenimine ilişkin bilgiler',
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
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: '${loggedInUser.ogrenciNo}'),
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
                    hintText: "Not Ortalamanızı girin",
                    labelText: 'Kayıtlı Olduğu Programın not ortalaması(AGNO)'),
                controller: _notOrtcontroller,
              ),
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Kayıtlı Olduğu Programın Öğrenim Türü',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    )),
                Divider(
                  color: Colors.black,
                ),
                CheckboxGroup(
                  labels: <String>[
                    "Örgün Öğretim",
                    "İkinci Öğretim",
                  ],
                  checked: _checkedOgretimTuru,
                  onChange: (bool isChecked, String label, int index) => print(
                      "isChecked: $isChecked   label: $label  index: $index"),
                  onSelected: (List<String> selectedOgretim) => setState(() {
                    if (selectedOgretim.length > 1) {
                      selectedOgretim.removeAt(0);
                      print('selected length  ${selectedOgretim.length}');
                      print('selected value : ${selectedOgretim.toString()}');
                      secilenHolderOgretim = selectedOgretim.join("");
                      print("değerrrrrr" + secilenHolderOgretim);
                    } else {
                      print("only one");
                      print('selected value : ${selectedOgretim.toString()}');
                      secilenHolderOgretim = selectedOgretim.join("");
                      print("değerrrrrr" + secilenHolderOgretim);
                    }
                    _checkedOgretimTuru = selectedOgretim;
                  }),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 5),
                  child: Text(
                    'Kayıtlı Olduğu Programın Yarıyılı',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
                Divider(
                  color: Colors.black,
                ),
                CheckboxGroup(
                  labels: <String>[
                    "3. Yarıyıl",
                    "5. Yarıyıl",
                  ],
                  checked: _checkedSinifTuru,
                  onChange: (bool isChecked, String label, int index) => print(
                      "isChecked: $isChecked   label: $label  index: $index"),
                  onSelected: (List<String> selectedSinif) => setState(() {
                    if (selectedSinif.length > 1) {
                      selectedSinif.removeAt(0);
                      print('selected length  ${selectedSinif.length}');
                      print('selected value : ${selectedSinif.toString()}');
                      secilenHolderSinif = selectedSinif.join("");
                      print("değerrrrrr" + secilenHolderSinif);
                    } else {
                      print("only one");
                      print('selected value : ${selectedSinif.toString()}');
                      secilenHolderSinif = selectedSinif.join("");
                      print("değerrrrrr" + secilenHolderSinif);
                    }
                    _checkedSinifTuru = selectedSinif;
                  }),
                )
              ],
            ),
            ListView(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 5),
                    child: Text(
                      'Disiplin Cezası',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.start,
                    )),
                Divider(
                  color: Colors.black,
                ),
                CheckboxGroup(
                  labels: <String>[
                    "VAR",
                    "YOK",
                  ],
                  checked: _checkedDisiplin,
                  onChange: (bool isChecked, String label, int index) => print(
                      "isChecked: $isChecked   label: $label  index: $index"),
                  onSelected: (List<String> selectedDisiplin) => setState(() {
                    if (selectedDisiplin.length > 1) {
                      selectedDisiplin.removeAt(0);
                      print('selected length  ${selectedDisiplin.length}');
                      print('selected value : ${selectedDisiplin.toString()}');
                      secilenHolderDisiplin = selectedDisiplin.join("");
                      print("değerrrrrr" + secilenHolderDisiplin);
                    } else {
                      print("only one");
                      print('selected value : ${selectedDisiplin.toString()}');
                      secilenHolderDisiplin = selectedDisiplin.join("");
                      print("değerrrrrr" + secilenHolderDisiplin);
                    }
                    _checkedDisiplin = selectedDisiplin;
                  }),
                ),
              ],
            ),
            Divider(
              color: Colors.black,
            ),
            Text(
              '4-ADAYIN BAŞVURDUĞU ÇAP PROGRAMINA İLİŞKİN BİLGİLER',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Başvuru Yapacağı Fakülte'),
                controller: _basvurulanFakulteController,
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
              child: TextFormField(
                decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Başvuru Yapacağı Lisans Programı'),
                controller: _basvurulanBolumController,
              ),
            ),
            InkWell(
              onTap: () {
                _capBasvuruService.basvuruOlustur(
                    id,
                    loggedInUser.userName!,
                    loggedInUser.tcId,
                    loggedInUser.email,
                    loggedInUser.gsm,
                    loggedInUser.evAdres,
                    loggedInUser.universite,
                    loggedInUser.fakulte,
                    loggedInUser.bolum,
                    secilenHolderOgretim,
                    secilenHolderSinif,
                    secilenHolderDisiplin,
                    _notOrtcontroller.text,
                    loggedInUser.ogrenciNo,
                    _basvurulanFakulteController.text,
                    _basvurulanBolumController.text,
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
                        )).then((value) => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SecimEkrani())));
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
                      "Başvuruyu Kaydet",
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            )
          ],
        )),
      ),
    );
  }
}
