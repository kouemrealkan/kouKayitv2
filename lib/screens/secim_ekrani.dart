import 'package:auto_size_text/auto_size_text.dart';
import 'package:basvurukayit/models/user_model.dart';
import 'package:basvurukayit/screens/basvuru_ekranlari/dgs_basvuru_ekrani.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/cap_basvuru_goruntuleme.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/dgs_basvuru_goruntuleme.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/intibak_basvuru_goruntuleme.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/yatay_gecis_goruntuleme.dart';
import 'package:basvurukayit/screens/basvuru_ekranlari/cap_basvuru_ekrani.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/yaz_okulu_goruntuleme.dart';
import 'package:basvurukayit/screens/home_screen.dart';
import 'package:basvurukayit/screens/basvuru_ekranlari/intibak_basvuru_ekrani.dart';
import 'package:basvurukayit/screens/login_ekrani.dart';
import 'package:basvurukayit/screens/basvuru_ekranlari/yatay_gecis_basvuru_ekrani.dart';
import 'package:basvurukayit/screens/basvuru_ekranlari/yaz_okulu_basvuru_ekrani.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SecimEkrani extends StatefulWidget {
  const SecimEkrani({Key? key}) : super(key: key);

  @override
  _SecimEkraniState createState() => _SecimEkraniState();
}

class _SecimEkraniState extends State<SecimEkrani> {
  User? user = FirebaseAuth.instance.currentUser;
  UserModel loggedInUser = UserModel();

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
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("${loggedInUser.userName}"),
              accountEmail: Text("${loggedInUser.email}"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage("${loggedInUser.resimUrl}"),
              ),
            ),



            ListTile(
              title: Text('Yatay Geçiş Başvuru Formu'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YatayGecisBasvuru()));
              },
            ),
            ListTile(
              title: Text('DGS başvuru formu'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => DgsBasvuru()));
              },
            ),
            ListTile(
              title: Text('Yaz okulu dilekçesi'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => YazOkuluBasvuru()));
              },
            ),
            ListTile(
              title: Text('İntibak başvuru dilekçesi'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => IntibakBasvuru()));
              },
            ),
            ListTile(
              title: Text('Çap başvurusu'),
              leading: Icon(
                Icons.home,
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CapBasvuruEkrani()));
              },
            ),
            Divider(
              color: Colors.black,
            ),
            ExpansionTile(
              leading: Icon(
                Icons.save
              ),
              title: Text("Kayıtlı Başvurularım"),
              children: [
                ListTile(
                  title: Text('Yatay Geçiş Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>YatayGecisGoruntuleme()));
                  },
                ),
                ListTile(
                  title: Text('İntibak Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>IntibakGoruntuleme()));
                  },
                ),
                ListTile(
                  title: Text('ÇAP Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>CapGoruntuleme()));
                  },
                ),
                ListTile(
                  title: Text('Yaz Okulu Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>YazOkuluBasvuruGoruntuleme()));
                  },
                ),
                ListTile(
                  title: Text('DGS Başvurularım'),
                  leading: Icon(
                    Icons.home,
                  ),
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>DgsGoruntuleme()));
                  },
                ),
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
            )
          ],
        ),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 150,
                  child:
                      Image.asset("assets/images/logo.png", fit: BoxFit.contain),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  "KULLANICI BİLGİLERİ",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                Card(
                  color: Colors.green,
                  shadowColor: Colors.white,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        AutoSizeText("  Kullanıcı Ad-Soyad : ${loggedInUser.userName}",style: TextStyle(color: Colors.white),),
                        AutoSizeText("  Kullanıcı Email : ${loggedInUser.email}",style: TextStyle(color: Colors.white,)),
                        AutoSizeText("  Kullanıcı Telefon No : ${loggedInUser.gsm}",style: TextStyle(color: Colors.white)),
                        AutoSizeText("  Kullanıcı Fakülte : ${loggedInUser.fakulte}",style: TextStyle(color: Colors.white)),
                        AutoSizeText("  Kullanıcı Bölüm : ${loggedInUser.bolum}",style: TextStyle(color: Colors.white)),
                        AutoSizeText("  Kullanıcı Üniversite : ${loggedInUser.universite}",style: TextStyle(color: Colors.white)),


                      ],
                    ),
                  ),
                ),

                SizedBox(
                  height: 15,
                ),
                ActionChip(
                    label: Text("Çıkış Yap"),
                    onPressed: () {
                      cikisYap(context);
                    }),
              ],
            ),
          ),
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


/*
  Text("  Kullanıcı Ad-Soyad : ${loggedInUser.userName}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Kullanıcı E-mail :  ${loggedInUser.email}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Kullanıcı GSM     : ${loggedInUser.gsm}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Kayıtlı olunan Üniversite    : ${loggedInUser.universite}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Kayıtlı olunan fakülte/myo    : ${loggedInUser.fakulte}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
                      Text("Kayıtlı olunan bölüm/program    : ${loggedInUser.bolum}",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          )),
 */