import 'package:db_foreignkey_deneme2/Filmler.dart';
import 'package:db_foreignkey_deneme2/Kategoriler.dart';
import 'package:db_foreignkey_deneme2/VeritabaniYardimcisi.dart';
import 'package:db_foreignkey_deneme2/Yonetmenler.dart';

class Filmlerdao{
  //SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id AND filmler.yonetmen_id = yonetmenler.yonetmen_id

  Future<List<Filmler>> tumFilmler() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String,dynamic>> maps = await db!.rawQuery("SELECT * FROM filmler,kategoriler,yonetmenler WHERE filmler.kategori_id = kategoriler.kategori_id AND filmler.yonetmen_id = yonetmenler.yonetmen_id");
    return List.generate(maps.length, (i) {
      var satir = maps[i];
      var k = Kategoriler(satir["kategori_id"], satir["kategori_ad"]);
      var y = Yonetmenler(satir["yonetmen_id"], satir["yonetmen_ad"]);
      var f = Filmler(satir["film_id"], satir["film_ad"], int.tryParse(satir["film_yil"].toString()) ?? 0, satir["film_resim"], k, y);

      return f;
    });
  }

}