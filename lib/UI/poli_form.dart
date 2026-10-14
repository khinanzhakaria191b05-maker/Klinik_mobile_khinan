import 'package:flutter/material.dart';
import '../model/poli.dart'; // Jangan lupa tambahkan import model ini

class PoliForm extends StatefulWidget {
  const PoliForm({super.key});

  @override
  State<PoliForm> createState() => _PoliFormState();
}

class _PoliFormState extends State<PoliForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Poli")),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                TextField(
                  controller: _namaPoliCtrl,
                  decoration: const InputDecoration(labelText: "Nama Poli"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    String namaPoliBaru = _namaPoliCtrl.text;

                    // Mencegah simpan data jika form masih kosong
                    if (namaPoliBaru.isEmpty) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Data '$namaPoliBaru' berhasil disimpan!",
                        ),
                      ),
                    );

                    // Menutup form DAN MENGIRIM data Poli baru ke halaman sebelumnya
                    Navigator.pop(context, Poli(namaPoli: namaPoliBaru));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Simpan"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
