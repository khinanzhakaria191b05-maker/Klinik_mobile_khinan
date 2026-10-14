import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_detail.dart';
import 'pegawai_form.dart';

class PegawaiPage extends StatefulWidget {
  const PegawaiPage({super.key});

  @override
  State<PegawaiPage> createState() => _PegawaiPageState();
}

class _PegawaiPageState extends State<PegawaiPage> {
  List<Pegawai> daftarPegawai = [
    Pegawai(
      nip: "19283746",
      nama: "Khinan Zhakaria",
      tanggalLahir: "10-01-2006",
      nomorTelepon: "081234567890",
      email: "khinan@klinik.com",
      password: "password123",
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
            Text("Data Pegawai"),
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
              final Pegawai? pegawaiBaru = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PegawaiForm()),
              );

              if (pegawaiBaru != null) {
                setState(() {
                  daftarPegawai.add(pegawaiBaru);
                });
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: daftarPegawai.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      PegawaiDetail(pegawai: daftarPegawai[index]),
                ),
              );
            },
            child: Card(
              child: ListTile(title: Text(daftarPegawai[index].nama)),
            ),
          );
        },
      ),
    );
  }
}
