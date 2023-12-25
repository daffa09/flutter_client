import 'package:flutter/material.dart';
//import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import 'package:mahasiswa_app/halaman/mahasiswa_detail.dart';
import 'package:mahasiswa_app/halaman/mahasiswa_tambah.dart';

class Mahasiswa extends StatefulWidget {
  MahasiswaState createState() => MahasiswaState();
}

class MahasiswaState extends State<Mahasiswa> {
  //membuat variabel untuk response info
  late Future<List> responseInfo;

  //info terbaru dari API
  Future<List<dynamic>> getMahasiswa() async {
    var url = Uri.http('localhost:3000', 'mahasiswa');
    try {
      var hasil = await http.get(
        url,
        headers: {'token': '123456'},
      ).timeout(
          const Duration(seconds: 10)); // Tambahkan timeout di sinis (10 detik)
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
    responseInfo = getMahasiswa();
  }

  void refreshData() {
    setState(() {
      responseInfo = getMahasiswa();
    });
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
                        child: ListTile(
                          title: Text(snapshot.data[index]['nama'],
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              )),
                          subtitle: Text(
                              "NIM: ${snapshot.data[index]['nim']} Alamat: ${snapshot.data[index]['alamat']}"),
                        ),
                      ),
                      onTap: () async => {
                        //disini nanti memanggil detail mahasiswa
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => MahasiswaDetail(
                              nim: snapshot.data[index]['nim'],
                              nama: snapshot.data[index]['nama'],
                              alamat: snapshot.data[index]['alamat'],
                              refresh: refreshData,
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
        title: Text("List Mahasiswa"),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(
          Icons.add,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => MahasiswaTambah(refresh: refreshData),
            ),
          );
        },
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: widgetInfo(),
      ),
    );
  }
}
