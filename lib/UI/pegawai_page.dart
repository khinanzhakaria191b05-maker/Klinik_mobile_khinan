import 'package:flutter/material.dart';
import '../model/pasien.dart';
import 'pasien_detail.dart';
import 'pasien_form.dart';

class PasienPage extends StatefulWidget {
  const PasienPage({super.key});

  @override
  State<PasienPage> createState() => _PasienPageState();
}

class _PasienPageState extends State<PasienPage> {
  List<Pasien> daftarPasien = [
    Pasien(
      nomorRm: "RM-001",
      nama: "Tatik Lestari",
      tanggalLahir: "15-08-1980",
      nomorTelepon: "081298765432",
      alamat: "Bekasi",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Mengubah title menjadi Column agar teks bisa ditumpuk
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Data Pasien"),
            Text(
              "No. Absen: 6",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
        actions: [
          GestureDetector(
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Icon(Icons.add),
            ),
            onTap: () async {
              final Pasien? pasienBaru = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PasienForm()),
              );

              if (pasienBaru != null) {
                setState(() {
                  daftarPasien.add(pasienBaru);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPasien.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PasienDetail(pasien: daftarPasien[index]),
                ),
              );
            },
            child: Card(child: ListTile(title: Text(daftarPasien[index].nama))),
          );
        },
      ),
    );
  }
}
