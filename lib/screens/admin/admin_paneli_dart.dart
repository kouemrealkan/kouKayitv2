import 'package:basvurukayit/models/admin_user_model.dart';
import 'package:basvurukayit/screens/admin/bekleyen_basvurular/bekleyen_cap_liste.dart';
import 'package:basvurukayit/screens/admin/bekleyen_basvurular/bekleyen_dgs_liste.dart';
import 'package:basvurukayit/screens/admin/bekleyen_basvurular/bekleyen_intibak_liste_dart.dart';
import 'package:basvurukayit/screens/admin/bekleyen_basvurular/bekleyen_yatay_gecis_liste.dart';
import 'package:basvurukayit/screens/admin/bekleyen_basvurular/bekleyen_yaz_okulu_liste.dart';
import 'package:basvurukayit/screens/admin/onaylanan_basvurular/onayli_cap_liste.dart';
import 'package:basvurukayit/screens/admin/onaylanan_basvurular/onayli_dgs_liste.dart';
import 'package:basvurukayit/screens/admin/onaylanan_basvurular/onayli_intibak_liste.dart';
import 'package:basvurukayit/screens/admin/onaylanan_basvurular/onayli_yaz_okulu_liste.dart';
import 'package:basvurukayit/screens/admin/reddedilen_basvurular/reddedilen_cap_basvuru_liste.dart';
import 'package:basvurukayit/screens/admin/reddedilen_basvurular/reddedilen_dgs_basvuru_liste.dart';
import 'package:basvurukayit/screens/admin/reddedilen_basvurular/reddedilen_intibak_liste.dart';
import 'package:basvurukayit/screens/admin/reddedilen_basvurular/reddedilen_yatay_basvuru_liste.dart';
import 'package:basvurukayit/screens/admin/reddedilen_basvurular/reddedilen_yaz_okulu_liste.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../login_ekrani.dart';
import 'onaylanan_basvurular/onayli_yatay_gecis_liste.dart';
class AdminPaneli extends StatefulWidget {
  const AdminPaneli({Key? key}) : super(key: key);

  @override
  _AdminPaneliState createState() => _AdminPaneliState();
}

class _AdminPaneliState extends State<AdminPaneli> {
  User? user = FirebaseAuth.instance.currentUser;
  AdminUserModel adminUserModel = AdminUserModel();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseFirestore.instance
        .collection("admin_users")
        .doc(user!.uid)
        .get()
        .then((value) {
      this.adminUserModel = AdminUserModel.fromMap(value.data());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Admin Paneli"),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Giriş Yapan Kullanıcı : ${adminUserModel.userName}"),
              accountEmail: Text("Email : ${adminUserModel.email}"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("${adminUserModel.imgUrl}",),
                backgroundColor: Colors.white,
              ),
            ),
            ExpansionTile(
              leading: Icon(Icons.save),
              title: Text("Kayıtlı Öğrenci Başvuruları"),
              children: [
                ExpansionTile(title: Text("Yatay Geçiş Başvuruları"),children: [
                  ListTile(
                    title: Text('Onay Bekleyen Başvurular'),
                    leading: Icon(
                      Icons.save_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BekleyenYatayGecisListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Onaylanan Başvurular'),
                    leading: Icon(
                      Icons.assignment_turned_in_rounded,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnayliYatayGecisListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Reddedilen Başvurular'),
                    leading: Icon(
                      Icons.warning_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReddedilenYatayBasvuruListesi()));
                    },
                  ),
                ],),

                ExpansionTile(title: Text("DGS Başvuruları"),children: [
                  ListTile(
                    title: Text('Onay Bekleyen Başvurular'),
                    leading: Icon(
                      Icons.save_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BekleyenDgsListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Onaylanan Başvurular'),
                    leading: Icon(
                      Icons.assignment_turned_in_rounded,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnayliDgsListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Reddedilen Başvurular'),
                    leading: Icon(
                      Icons.warning_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReddedilenDgsListesi()));
                    },
                  ),
                ],),

                ExpansionTile(title: Text("Yaz Okulu Başvuruları"),children: [
                  ListTile(
                    title: Text('Onay Bekleyen Başvurular'),
                    leading: Icon(
                      Icons.save_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BekleyenYazOkuluListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Onaylanan Başvurular'),
                    leading: Icon(
                      Icons.assignment_turned_in_rounded,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnayliYazOkuluListe()));
                    },
                  ),
                  ListTile(
                    title: Text('Reddedilen Başvurular'),
                    leading: Icon(
                      Icons.warning_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReddedilenYazOkuluListe()));
                    },
                  ),
                ],),
                ExpansionTile(title: Text("İntibak Başvuruları"),children: [
                  ListTile(
                    title: Text('Onay Bekleyen Başvurular'),
                    leading: Icon(
                      Icons.save_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BekleyenIntibakListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Onaylanan Başvurular'),
                    leading: Icon(
                      Icons.assignment_turned_in_rounded,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnayliIntibakListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Reddedilen Başvurular'),
                    leading: Icon(
                      Icons.warning_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReddedilenIntibakListe()));
                    },
                  ),
                ],),
                ExpansionTile(title: Text("Çap Başvuruları"),children: [
                  ListTile(
                    title: Text('Onay Bekleyen Başvurular'),
                    leading: Icon(
                      Icons.save_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>BekleyenCapListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Onaylanan Başvurular'),
                    leading: Icon(
                      Icons.assignment_turned_in_rounded,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>OnayliCapListesi()));
                    },
                  ),
                  ListTile(
                    title: Text('Reddedilen Başvurular'),
                    leading: Icon(
                      Icons.warning_sharp,
                    ),
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ReddedilenCapListesi()));
                    },
                  ),
                ],),

              ],
            ),
            Divider(color: Colors.black,),
            ListTile(
              title: Text('Çıkış Yap'),
              leading: Icon(
                Icons.logout,
              ),
              onTap: () {
                cikisYap(context);
              },
            ),
          ],
        ),
      ),
    );
  }
  Future<void> cikisYap(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => LoginEkrani()));
  }
}
