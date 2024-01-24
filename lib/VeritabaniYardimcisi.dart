import 'dart:io';
import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class VeritabaniYardimcisi{
  static final String veriTabaniAdi = "filmler.sqlite";

  static Future<Database> veritabaniErisim() async {
    String veritabaniYolu = join(await getDatabasesPath(),veriTabaniAdi);
    if(await databaseExists(veritabaniYolu)){
      print('veritabani vardir kopyalamaya gerek yok.');
    }else{
      ByteData data = await rootBundle.load("veritabani/$veriTabaniAdi");
      List<int> bytes = data.buffer.asUint8List(data.offsetInBytes,data.lengthInBytes);
      await File(veritabaniYolu).writeAsBytes(bytes,flush: true);
      print("veritabani kopyalandi");
    }
    return openDatabase(veritabaniYolu);
  }

}