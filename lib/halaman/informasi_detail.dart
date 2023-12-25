import 'package:flutter/material.dart';

class InformasiDetail extends StatefulWidget {
  const InformasiDetail(
      {Key? key,
      required this.judul,
      required this.konten,
      required this.gambar})
      : super(key: key);

  final String judul;
  final String konten;
  final String gambar;
  InformasiDetailState createState() => InformasiDetailState();
}

class InformasiDetailState extends State<InformasiDetail> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.judul),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(children: [
          Image.network(
            widget.gambar,
          ),
          Text(widget.judul),
          Text(widget.konten)
        ]),
      ),
    );
  }
}
