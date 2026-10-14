import 'package:flutter/material.dart';
import '../model/poli.dart';
import 'poli_item.dart';
import 'poli_form.dart';

class PoliPage extends StatefulWidget {
  const PoliPage({super.key});

  @override
  State<PoliPage> createState() => _PoliPageState();
}

class _PoliPageState extends State<PoliPage> {
  // 1. Membuat variabel List untuk menampung data poli
  List<Poli> daftarPoli = [
    Poli(namaPoli: "Poli Mata"),
    Poli(namaPoli: "Poli Penyakit Dalam"),
    Poli(namaPoli: "Poli Kulit"),
    Poli(namaPoli: "Poli Tulang"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("KLINIK POLI KHINAN ZHAKARIA"),
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
            // 2. Mengubah onTap menjadi async agar bisa menunggu data dari form
            onTap: () async {
              // Menyimpan data balasan dari form ke variabel poliBaru
              final Poli? poliBaru = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PoliForm()),
              );

              // 3. Jika poliBaru ada isinya (tidak null), tambahkan ke daftar
              if (poliBaru != null) {
                setState(() {
                  daftarPoli.add(poliBaru);
                });
              }
            },
          ),
        ],
      ),
      // 4. Menggunakan ListView.builder agar tampilan otomatis menyesuaikan isi List
      body: ListView.builder(
        itemCount: daftarPoli.length,
        itemBuilder: (context, index) {
          return PoliItem(poli: daftarPoli[index]);
        },
      ),
    );
  }
}
