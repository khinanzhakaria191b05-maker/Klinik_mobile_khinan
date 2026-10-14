import 'package:flutter/material.dart';
import '../model/poli.dart';

class PoliUpdateForm extends StatefulWidget {
  final Poli poli;

  const PoliUpdateForm({super.key, required this.poli});

  @override
  State<PoliUpdateForm> createState() => _PoliUpdateFormState();
}

class _PoliUpdateFormState extends State<PoliUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _namaPoliCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Baris ini berfungsi untuk langsung mengisi kolom teks dengan nama poli yang lama
    _namaPoliCtrl.text = widget.poli.namaPoli;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Ubah Poli")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
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

                    if (namaPoliBaru.isEmpty) return;

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Data berhasil diubah menjadi '$namaPoliBaru'!",
                        ),
                      ),
                    );

                    // Kembali ke halaman sebelumnya
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Simpan Perubahan"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
