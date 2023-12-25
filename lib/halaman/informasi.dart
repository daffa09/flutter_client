import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:mahasiswa_app/halaman/informasi_detail.dart';

class Informasi extends StatefulWidget {
  InformasiState createState() => InformasiState();
}

class InformasiState extends State<Informasi> {
  //membuat variabel untuk response info
  late Future<List> responseInfo;

  //info terbaru dari API
  Future<List<dynamic>> getInfo() async {
    var url = Uri.http('localhost:3000', 'informasi');

    try {
      var hasil = await http.get(
        url,
        headers: {"token": "123456"},
      ).timeout(const Duration(
          seconds: 10)); // Tambahkan timeout di sini (10 detik sebagai contoh)

      var json = convert.jsonDecode(hasil.body);
      return json['data'];
    } catch (e) {
      print('Error: $e');
      // Handle error, misalnya kembalikan list kosong atau throw exception sesuai kebutuhan.
      return [];
    }
  }

  //memanggil future/fungsi getInfo
  //saat inisialisasi awal
  @override
  void initState() {
    super.initState();
    responseInfo = getInfo();
  }

  Widget widgetInfo() {
    return FutureBuilder(
      future: responseInfo,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (snapshot.hasData) {
          return snapshot.data.length == 0
              ? Center(child: Text("Data Kosong"))
              : ListView.builder(
                  shrinkWrap: true,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      child: Card(
                        margin: EdgeInsets.only(bottom: 20.0),
                        child: Column(
                          children: [
                            Image.network(
                              snapshot.data[index]['gambar'],
                            ),
                            Text(snapshot.data[index]['judul']),
                          ],
                        ),
                      ),
                      onTap: () async => {
                        //disini nanti memanggil detail informasi
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => InformasiDetail(
                              judul: snapshot.data[index]['judul'],
                              konten: snapshot.data[index]['konten'],
                              gambar: snapshot.data[index]['gambar'],
                            ),
                          ),
                        )
                      },
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

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Informasi"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: widgetInfo(),
      ),
    );
  }
}
