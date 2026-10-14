import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienForm extends StatefulWidget {
  const PasienForm({super.key});

  @override
  State<PasienForm> createState() => _PasienFormState();
}

class _PasienFormState extends State<PasienForm> {
  final _formKey = GlobalKey<FormState>();

  final _rmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _noTelpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pasien")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  controller: _rmCtrl,
                  decoration: const InputDecoration(labelText: "Nomor RM"),
                ),
                TextField(
                  controller: _namaCtrl,
                  decoration: const InputDecoration(labelText: "Nama Pasien"),
                ),
                TextField(
                  controller: _tglLahirCtrl,
                  decoration: const InputDecoration(labelText: "Tanggal Lahir"),
                ),
                TextField(
                  controller: _noTelpCtrl,
                  decoration: const InputDecoration(labelText: "No. Telepon"),
                ),
                TextField(
                  controller: _alamatCtrl,
                  decoration: const InputDecoration(labelText: "Alamat"),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_namaCtrl.text.isEmpty || _rmCtrl.text.isEmpty) return;

                    Pasien pasienBaru = Pasien(
                      nomorRm: _rmCtrl.text,
                      nama: _namaCtrl.text,
                      tanggalLahir: _tglLahirCtrl.text,
                      nomorTelepon: _noTelpCtrl.text,
                      alamat: _alamatCtrl.text,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Data '${_namaCtrl.text}' berhasil disimpan!",
                        ),
                      ),
                    );

                    Navigator.pop(context, pasienBaru);
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
