import 'dart:typed_data';

import 'package:basvurukayit/models/intibak_basvuru_model.dart';
import 'package:basvurukayit/models/yatay_basvuru_model.dart';
import 'package:basvurukayit/screens/basvuru_goruntuleme/yatay_gecis_goruntuleme.dart';
import 'package:basvurukayit/service/intibak_basvuru_service.dart';
import 'package:basvurukayit/service/yatay_basvuru_service.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_file/open_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:syncfusion_flutter_pdf/pdf.dart';
import 'dart:io';
import 'package:intl/date_symbol_data_local.dart';
import 'package:flutter/services.dart' show rootBundle;

class IntibakBasvuruPdf extends StatefulWidget {
  final String id;
  const IntibakBasvuruPdf({Key? key, required this.id}) : super(key: key);

  @override
  _IntibakBasvuruPdfState createState() => _IntibakBasvuruPdfState(id);
}

class _IntibakBasvuruPdfState extends State<IntibakBasvuruPdf> {
  final String id;
  IntibakBasvuruModel intibakBasvuruModel = IntibakBasvuruModel();
  IntibakBasvuruService _intibakBasvuruService = IntibakBasvuruService();
  _IntibakBasvuruPdfState(this.id);
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    FirebaseFirestore.instance
        .collection("intibak_basvuru")
        .doc(this.id)
        .get()
        .then((value) {
      this.intibakBasvuruModel =
          IntibakBasvuruModel.fromMap(value.data());
      setState(() {
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => YatayGecisGoruntuleme()));
              }),
          title: Text("Başvuru Önizleme Sayfası"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                child: Text("Başvuru PDF Önizleme"),
                onPressed: _createPdf,
              ),
              ElevatedButton(
                child: Text("Başvuruyu Onayla"),
                onPressed: () {},
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                color: Colors.green,
                padding: const EdgeInsets.all(5.0),
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(6),
                    child: AutoSizeText(
                        "Dikkat ! Onayla butonuna bastığınız zaman artık başvurunuzu tamamlamış olursunuz. Bu aşama sonrası değişiklik yapılamaz !"),
                  ),
                ),
              )
            ],
          ),
        ));
  }

  Future<void> _createPdf() async {
    PdfDocument document = PdfDocument();
    document.pageSettings.orientation = PdfPageOrientation.portrait;
    document.pageSettings.margins.all = 50;
    PdfPage page = document.pages.add();
    PdfGraphics graphics = page.graphics;
    //PdfImage image = PdfBitmap.fromBase64String('logo');
    page.graphics.drawImage(PdfBitmap(await _readImageData('logo.png')),
        Rect.fromLTWH(180, 0, 120, 130));
    PdfBrush solidBrush = PdfBrushes.black;
    Rect bounds = Rect.fromLTWH(0, 160, graphics.clientSize.width, 40);
    graphics.drawRectangle(brush: solidBrush, bounds: bounds);
    //  PdfTrueTypeFont(File(""));
    //PdfFont fontStyle = PdfFont.ttf(await rootBundle.load("assets/fonts/arial.tff"));
    PdfFont styleFont = PdfTrueTypeFont(await _readFontData(), 14);
    // PdfFont subHeadingFont = PdfTrueTypeFont(File("assets/fonts/arial.ttf").readAsBytesSync(),14);
    PdfTextElement element =
    PdfTextElement(text: "KOCAELI UNIVERSITESI", font: styleFont);
    element.brush = PdfBrushes.white;
    PdfLayoutResult result = element.draw(
        page: page, bounds: Rect.fromLTWH(10, bounds.top + 15, 0, 0))!;
    Intl.defaultLocale = "tr";
    initializeDateFormatting('tr', null);
    String currentDate =
        'TARIH ' + DateFormat.yMMMd('tr').format(DateTime.now());
    Size textSize = styleFont.measureString(currentDate);
    Offset textPosition = Offset(
        graphics.clientSize.width - textSize.width - 10, result.bounds.top);
    graphics.drawString(currentDate, styleFont,
        brush: element.brush,
        bounds: Offset(graphics.clientSize.width - textSize.width - 10,
            result.bounds.top) &
        Size(textSize.width + 2, 20));
    element = PdfTextElement(
        text: 'Ogrenci Ad : ${intibakBasvuruModel.ogrenciAd}',
        font: styleFont
    );
    element.brush = PdfBrushes.black;
    result = element.draw(
        page: page,
        bounds: Rect.fromLTWH(10, result.bounds.bottom + 25, 0, 0))!;


    // PdfFont helvetica = PdfStandardFont(PdfFontFamily.helvetica, 15);
    element.brush = PdfBrushes.black;
    result = element.draw(
        page: page,
        bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;
    element = PdfTextElement(
        text:
        'Basvurulan Fakulte : ${intibakBasvuruModel.ogrenciAd}',
        font: styleFont);
    element.brush = PdfBrushes.black;
    result = element.draw(
        page: page,
        bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;
    element = PdfTextElement(
        text: 'Basvurulan Bolum : ${intibakBasvuruModel.ogrenciBolum}',
        font: styleFont);
    element.brush = PdfBrushes.black;
    result = element.draw(
        page: page,
        bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;
    element = PdfTextElement(
        text: 'Ogrenci Numarasi : ${intibakBasvuruModel.ogrenciNo}',
        font: styleFont);
    element.brush = PdfBrushes.black;
    result = element.draw(
        page: page,
        bounds: Rect.fromLTWH(10, result.bounds.bottom + 10,
            page.getClientSize().width, page.getClientSize().height))!;
    const String paragraphText =
        'Beyan ettigim bilgilerin veya bilgilerin gercege aykiri olmasi veya daha once\n yatay gecis yapmis olmam halimde hakkimda '
        'cezai islemlerin yurutulecegini\n ve kaydim yapilmis olsa dahi silinecegini kabul ediyorum.';

    element = PdfTextElement(text: paragraphText, font: styleFont);
    element.brush = PdfBrushes.black;
    result = element.draw(
        page: page,
        bounds: Rect.fromLTWH(10, result.bounds.bottom + 10, 0, 0))!;
    element = PdfTextElement(text: 'Ad-Soyad', font: styleFont);
    element.brush = PdfBrushes.black;
    result = element.draw(
        page: page,
        bounds: Rect.fromLTRB(300, result.bounds.bottom + 50, 0, 0))!;
    element = PdfTextElement(text: 'imza', font: styleFont);
    element.brush = PdfBrushes.black;
    result = element.draw(
        page: page,
        bounds: Rect.fromLTRB(300, result.bounds.bottom + 10, 0, 0))!;
    // final page = document.pages.add();
    // page.graphics.drawImage(PdfBitmap(await _readImageData('logo.png')),Rect.fromLTWH(180, 0, 150, 160));
    //  page.graphics.drawString("${yatayGecisBasvuruModel.ogrenciAd}",PdfStandardFont(PdfFontFamily.helvetica, 30));
    // PdfTextElement element = PdfTextElement(text: 'asdasd',font: PdfStandardFont(PdfFontFamily.timesRoman, 10,style: PdfFontStyle.bold)
    List<int> bytes = document.save();
    document.dispose();
    saveAndLaunchFile(bytes, '${intibakBasvuruModel.ogrenciAd}.pdf');
  }

  Future<void> saveAndLaunchFile(List<int> bytes, String fileName) async {
    final path = (await getApplicationDocumentsDirectory()).path;
    final file = File('$path/$fileName');
    await file.writeAsBytes(bytes, flush: true);
    OpenFile.open('$path/$fileName');
  }
}

Future<Uint8List> _readImageData(String name) async {
  final data = await rootBundle.load('assets/images/$name');
  return data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
}

Future<List<int>> _readFontData() async {
  final ByteData bytes = await rootBundle.load('assets/fonts/arial.ttf');
  return bytes.buffer.asUint8List(bytes.offsetInBytes, bytes.lengthInBytes);
}

/*

StreamBuilder(
           stream: FirebaseFirestore.instance
          .collection('yatay_gecis_basvuru')
          .doc('997lnVhkdWBLZPHrq829')
               .snapshots(),
        builder: (context,snapshot){
             if(!snapshot.hasData){
               if(!snapshot.hasData){
                 return CircularProgressIndicator()
               }
               var basvuruData = snapshot.data;
             }
        },
      ),
 */
