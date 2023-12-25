import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Profil extends StatefulWidget {
  ProfilState createState() => ProfilState();
}

class ProfilState extends State<Profil> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Container(
        padding: EdgeInsets.all(5.0),
        child: ListView(
          children: <Widget>[
            Center(
                child: Text(
              "Universitas Pancasila",
              style: GoogleFonts.anton(
                fontSize: 32.0,
                color: Color.fromARGB(255, 120, 6, 142),
                fontWeight: FontWeight.bold,
              ),
            )),
            Image.asset("assets/icon-akun.png"),
            Card(
              color: Colors.amberAccent,
              child: ListTile(
                title: Text("Daffa"),
                subtitle: Text("Daffa Fathan"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
