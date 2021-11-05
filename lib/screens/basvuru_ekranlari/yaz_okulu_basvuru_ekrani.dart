import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/secim_ekrani.dart';
import 'package:basvurukayit/service/yaz_okulu_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class YazOkuluBasvuru extends StatefulWidget {
  const YazOkuluBasvuru({Key? key}) : super(key: key);

  @override
  _YazOkuluBasvuruState createState() => _YazOkuluBasvuruState();
}

class _YazOkuluBasvuruState extends State<YazOkuluBasvuru> {
  TextEditingController _dersControllerKou1 = TextEditingController();
  TextEditingController _teoriControllerKou1 = TextEditingController();
  TextEditingController _uygulamaControllerKou1 = TextEditingController();
  TextEditingController _labControllerKou1 = TextEditingController();
  TextEditingController _aktsControllerKou1 = TextEditingController();

  TextEditingController _dersControllerKou2 = TextEditingController();
  TextEditingController _teoriControllerKou2 = TextEditingController();
  TextEditingController _uygulamaControllerKou2 = TextEditingController();
  TextEditingController _labControllerKou2 = TextEditingController();
  TextEditingController _aktsControllerKou2 = TextEditingController();

  TextEditingController _dersControllerKou3 = TextEditingController();
  TextEditingController _teoriControllerKou3 = TextEditingController();
  TextEditingController _uygulamaControllerKou3 = TextEditingController();
  TextEditingController _labControllerKou3 = TextEditingController();
  TextEditingController _aktsControllerKou3 = TextEditingController();

  TextEditingController _dersControllerYaz1 = TextEditingController();
  TextEditingController _teoriControllerYaz1 = TextEditingController();
  TextEditingController _uygulamaControllerYaz1 = TextEditingController();
  TextEditingController _labControllerYaz1 = TextEditingController();
  TextEditingController _aktsYaz1 = TextEditingController();
  TextEditingController _dersControllerYaz2 = TextEditingController();
  TextEditingController _teoriControllerYaz2 = TextEditingController();
  TextEditingController _uygulamaControllerYaz2 = TextEditingController();
  TextEditingController _labControllerYaz2 = TextEditingController();
  TextEditingController _aktsYaz2 = TextEditingController();

  TextEditingController _dersControllerYaz3 = TextEditingController();
  TextEditingController _teoriControllerYaz3 = TextEditingController();
  TextEditingController _uygulamaControllerYaz3 = TextEditingController();
  TextEditingController _labControllerYaz3 = TextEditingController();
  TextEditingController _aktsYaz3 = TextEditingController();

  TextEditingController _danismanController = TextEditingController();
  TextEditingController _baskanController = TextEditingController();

  TextEditingController _universiteController = TextEditingController();
  TextEditingController _yazOkuluTarihController = TextEditingController();
  String basvuruDurum = "";
  String olusturmaTarihi = "";
  String onaylanmaTarihi = "";
  String reddedilmeTarihi = "";
  String id = "";
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();
  YazOkuluBasvuruService _yazOkuluBasvuruService = YazOkuluBasvuruService();
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
                  'Yaz Okulu Başvuru Formu',
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.green,
                  ),
                ),
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text(
                          '${loggedInUser.fakulte} ${loggedInUser.bolum}  Bölümü ${loggedInUser.ogrenciNo} numaralı ${loggedInUser.userName} isimli öğrencisiyim.'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          '20…/20… Eğitim Öğretim yılı yaz öğretimi kapsamında aşağıda bilgilerini verdiğim ders/dersleri almak istiyorum. Kontrol listesinde belirtilen adımları tamamladım.Gereği için arz ederim.'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '                                                                          İmza',
                      ),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'E-mail : ${loggedInUser.email}'),
                  readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Adres : ${loggedInUser.evAdres}'),
                  readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'GSM : ${loggedInUser.gsm}'),
                  readOnly: true,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Danışman Ad-Soyad'),
                  controller: _danismanController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Başvurulan Üniversite'),
                  controller: _universiteController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Yaz Okulu Başlama-Bitiş Tarihleri'),
                  controller: _yazOkuluTarihController,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child: Text(
                        'Kocaeli Üniversitesi ${loggedInUser.bolum} Bölümü’nde sorumlu olunan ders/dersler:'),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 80.0,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Dersin adı ve kodu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'T                 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'U                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'L                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'AKTS                         ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _dersControllerKou1,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _teoriControllerKou1,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _uygulamaControllerKou1,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _labControllerKou1,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _aktsControllerKou1,
                            ),
                            showEditIcon: true),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _dersControllerKou2,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _teoriControllerKou2,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _uygulamaControllerKou2,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _labControllerKou2,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _aktsControllerKou2,
                            ),
                            showEditIcon: true),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _dersControllerKou3,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _teoriControllerKou3,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _uygulamaControllerKou3,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _labControllerKou3,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _aktsControllerKou3,
                            ),
                            showEditIcon: true),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Center(
                    child:
                        Text('Yaz öğretimi kapsamında alınacak ders/dersler'),
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 80.0,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        'Dersin adı ve kodu',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'T                 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'U                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'L                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'AKTS                         ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _dersControllerYaz1,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _teoriControllerYaz1,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _uygulamaControllerYaz1,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _labControllerYaz1,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _aktsYaz1,
                            ),
                            showEditIcon: true),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _dersControllerYaz2,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _teoriControllerYaz2,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _uygulamaControllerYaz2,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _labControllerYaz2,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _aktsYaz2,
                            ),
                            showEditIcon: true),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _dersControllerYaz3,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _teoriControllerYaz3,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _uygulamaControllerYaz3,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _labControllerYaz3,
                            ),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _aktsYaz3,
                            ),
                            showEditIcon: true),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text('Dilekçe Ekleri'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          '1-Yaz döneminde ders almak istenilen Üniversite ve Kocaeli Üniversitesinin ilgili bölümlerinin, öğrencinin üniversiteye giriş yılındaki taban puanlarını gösteren belge ektedir'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        '2-Alınmak istenilen derslerin karşı Üniversitedeki ders saati/kredi/AKTS ve ders içeriklerini gösteren belge ektedir',
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          '3-Başvurulan dönem içinde alınmış transkript ektedir          '),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columnSpacing: 80.0,
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text(
                        '         ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Unvan, Adı, Soyadı                 ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'İmza                           ',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                  rows: <DataRow>[
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Öğrenci Danışmanı     '),
                            showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _danismanController,
                            ),
                            showEditIcon: true),
                        DataCell(Text('          '), showEditIcon: true),
                      ],
                    ),
                    DataRow(
                      cells: <DataCell>[
                        DataCell(Text('Bölüm Başkanı'), showEditIcon: true),
                        DataCell(
                            TextFormField(
                              keyboardType: TextInputType.text,
                              controller: _baskanController,
                            ),
                            showEditIcon: true),
                        DataCell(Text('           '), showEditIcon: true),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Card(
                margin: EdgeInsets.fromLTRB(2, 2, 2, 2),
                child: Padding(
                  padding: EdgeInsets.all(12),
                  child: Column(
                    children: [
                      Text('KOCAELİ ÜNİVERSİTESİ YAZ ÖĞRETİMİ ESASLARI'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          'ESAS 1-(1) Spor Bilimleri Fakültesi dışındaki tüm akademik birimlerde okuyan öğrencilerin, diğer yükseköğretim kurumlarından yaz öğretiminde ders alabilmeleri için; Üniversiteye giriş yılı esas olmak üzere ilgili bölüm/program taban puanın en fazla 40 puan düşük olma koşulu aranır'
                          ' (3) Yaz okulunda diğer yükseköğretim kurumlarından alınacak dersler için öğrencinin kayıtlı olduğu ilgili birimin Bölüm/Anabilim Dalı veya Program Başkanlığının onayı gerekir.(4) Yaz okulunda Bölüm/Anabilim Dalı veya Program Başkanlığı bu konudaki değerlendirmesini; ilgili bölüm müfredatındaki benzer içeriğe veya program yeterliliğine sahip olmakla birlikte, ders(ler)in AKTS/kedi/saat değer(ler)inden herhangi birini dikkate alarak yapar'),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                        'ESAS 2- (l) Öğrenciler, yaz öğretiminde derslerin AKTS/kredi/saat değerlerine bakılmaksızın, en çok 3 ders alabilir. ',
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Text(
                          'ESAS 3-(l) Güz ve/veya bahar yarıyıllarında kayıt donduran öğrenciler, kayıt dondurdukları yarıyıllara ilişkin dersleri yaz öğretiminde alamazlar          '),
                      Text(
                          'ESAS 6- (l)Yaz öğretimi kapsamında alınan ders(ler)in notu genel not ortalamasına bakılmaksızın 4,lük sistem üzerinden 2,nin altında ise öğrenci bu ders(ler)den başarısız sayılır.          '),
                      Text(
                          'ESAS 9-  (l) Yaz öğretimi aynı öğretim yılına ait üçüncü bir yarıyıl değildir. Yaz öğretiminde alınan ders(ler)in notları, öğrencilerin güz ve bahar yarıyıllarındaki yarıyıl not ortalamalarını ve yarıyıllardaki derslerin koşul durumlarını etkilemez. Ancak, öğrencinin genel not ortalaması (GNO) hesaplanmasına dahil edilir.          '),
                      SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              InkWell(
                onTap: () {
                  _yazOkuluBasvuruService.basvuruOlustur(
                      id,
                      loggedInUser.userName!,
                      loggedInUser.email!,
                      loggedInUser.gsm!,
                      loggedInUser.evAdres!,
                      loggedInUser.fakulte!,
                      loggedInUser.bolum!,
                      _danismanController.text,
                      _universiteController.text,
                      _yazOkuluTarihController.text,
                      {
                        'sorumluOlunanDersler': FieldValue.arrayUnion([
                          {
                            "Ders Adi ve Kodu": _dersControllerKou1.text,
                            "t": _teoriControllerKou1.text,
                            "u": _uygulamaControllerKou1.text,
                            "l": _labControllerKou1.text,
                          },
                          {
                            "Ders Adi ve Kodu": _dersControllerKou2.text,
                            "t": _teoriControllerKou2.text,
                            "u": _uygulamaControllerKou2.text,
                            "l": _labControllerKou2.text,
                          },
                          {
                            "Ders Adi ve Kodu": _dersControllerKou3.text,
                            "t": _teoriControllerKou3.text,
                            "u": _uygulamaControllerKou3.text,
                            "l": _labControllerKou3.text,
                          }
                        ])
                      },
                      {
                        'yazOkuluAlinanDersler': FieldValue.arrayUnion([
                          {
                            "Ders Adi ve Kodu": _dersControllerYaz1.text,
                            "t": _teoriControllerYaz1.text,
                            "u": _uygulamaControllerYaz1.text,
                            "l": _labControllerYaz1.text,
                          },
                          {
                            "Ders Adi ve Kodu": _dersControllerYaz2.text,
                            "t": _teoriControllerYaz2.text,
                            "u": _uygulamaControllerYaz2.text,
                            "l": _labControllerYaz2.text,
                          },
                          {
                            "Ders Adi ve Kodu": _dersControllerYaz3.text,
                            "t": _teoriControllerYaz3.text,
                            "u": _uygulamaControllerYaz3.text,
                            "l": _labControllerYaz3.text,
                          },
                        ])
                      },
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
                    padding: const EdgeInsets.all(3.0),
                    child: Center(
                      child: Text(
                        "Başvuruyu Kaydet",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),

              /*DataTable(
                columns: const <DataColumn> [
                  DataColumn(label: Text('E-mail',style: TextStyle(fontWeight: FontWeight.bold),)),
                ],
                rows: const <DataRow> [
                  DataRow(
                    cells: <DataCell>[
                      DataCell(Text('Sarah')),

                    ],
                  ),
                ],
              )   */
            ],
          ),
        ),
      ),
    );
  }
}
