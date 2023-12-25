import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:http/http.dart' as http;
import 'package:mahasiswa_app/halaman/informasi.dart';
import 'package:mahasiswa_app/halaman/mahasiswa.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert' as convert;

//halaman
import '../halaman/profil.dart';

final List<String> imgList = [
  'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

//menu
Widget widgetMenu(BuildContext context) {
  return Container(
    color: Colors.white,
    child: GridView.count(
      crossAxisCount: 3,
      shrinkWrap: true,
      crossAxisSpacing: 5.0,
      mainAxisSpacing: 5.0,
      childAspectRatio: 3 / 2,
      children: [
        GestureDetector(
          onTap: () {
            print("Klik menu profil");

            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Profil(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.yellow,
              border: Border.all(
                color: Colors.deepOrange,
                width: 1.0,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [
                Image(
                  image: AssetImage("assets/icons/icon-akun.png"),
                  height: 50,
                ),
                Text("Profil"),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("Klik menu Kontak");
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.deepOrange, width: 1.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icons/icon-akun.png"),
                  height: 50,
                ),
                Text("Kontak")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("Klik menu INFO");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Informasi(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.deepOrange, width: 1.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icons/icon-akun.png"),
                  height: 50,
                ),
                Text("Informasi")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("Klik menu Gallery");
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.deepOrange, width: 1.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icons/icon-akun.png"),
                  height: 50,
                ),
                Text("Gallery")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("Klik menu Dokumen");
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.deepOrange, width: 1.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icons/icon-akun.png"),
                  height: 50,
                ),
                Text("Dokumen")
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            print("Klik menu WEB");
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => Mahasiswa(),
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
                color: Colors.yellow,
                border: Border.all(color: Colors.deepOrange, width: 1.0)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage("assets/icons/icon-akun.png"),
                  height: 50,
                ),
                Text("CRUD")
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

//info terbaru
final List<String> info = <String>['Info 1', 'Info 2', 'Info 3'];
var infoTerbaru = Container(
  color: Colors.white,
  child: ListView.separated(
    shrinkWrap: true,
    padding: const EdgeInsets.all(8),
    itemCount: info.length,
    itemBuilder: (BuildContext context, int index) {
      return Container(
        height: 100,
        color: Colors.cyan,
        child: Center(child: Text('List ${info[index]}')),
      );
    },
    separatorBuilder: (BuildContext context, int index) => const Divider(),
  ),
);

//info terbaru dari API
Future<List<dynamic>> getInfo() async {
  var url = Uri.http('localhost:3000', 'informasi');

  try {
    var hasil = await http.get(
      url,
      headers: {"token": "123456"},
    ).timeout(
        const Duration(seconds: 5)); // Tambahkan timeout di sini (5 detik)

    var json = convert.jsonDecode(hasil.body);
    return json['data'];
  } catch (e) {
    print('Error: $e');
    // Handle error, misalnya kembalikan list kosong atau throw exception sesuai kebutuhan.
    return [];
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mahasiswa App',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Fanthom Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List> responseInfo;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
    });
  }

  @override
  void initState() {
    responseInfo = getInfo();
    super.initState();
  }

  Widget widgetInfo() {
    return FutureBuilder(
      future: responseInfo,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Card(
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(
                          snapshot.data[index]['gambar'],
                        ),
                      ),
                      title: Text(snapshot.data[index]['judul']),
                      subtitle: Text(snapshot.data[index]['konten']),
                      trailing: IconButton(
                          onPressed: () async => {
                                await launchUrl(
                                  Uri.parse(snapshot.data[index]['url']),
                                )
                              },
                          icon: Icon(Icons.link)),
                    ),
                  ],
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CarouselSlider(
                options: CarouselOptions(),
                items: imgList
                    .map((item) => Container(
                          child: Center(
                              child: Image.network(item,
                                  fit: BoxFit.cover, width: 1000)),
                        ))
                    .toList(),
              ),
              //menu,
              widgetMenu(context),
              //infoTerbaru,
              widgetInfo(),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
