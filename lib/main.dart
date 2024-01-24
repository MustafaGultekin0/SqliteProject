import 'package:db_foreignkey_deneme2/Filmler.dart';
import 'package:db_foreignkey_deneme2/Filmlerdao.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<void> goster()async{
    var liste = await Filmlerdao().tumFilmler();

    for(Filmler f in liste){
      print("*******************");
      print("film id ${f.film_id}");
      print("film ad ${f.film_ad}");
      print("film yil ${f.film_yil}");
      print("film resim ${f.film_resim}");
      print("kategori ad ${f.kategori.kategori_ad}");
      print("yonetmen ad ${f.yonetmen.yonetmen_ad}");
    }
  }

  @override
  void initState() {
    super.initState();
    goster();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              ElevatedButton(onPressed: (){
              }, child: Text("Ekle"))
          ],
        ),
      ),

    );
  }
}
