import 'package:flutter/material.dart';
import '../model/pasien.dart';

class PasienUpdateForm extends StatefulWidget {
  final Pasien pasien;

  const PasienUpdateForm({super.key, required this.pasien});

  @override
  State<PasienUpdateForm> createState() => _PasienUpdateFormState();
}

class _PasienUpdateFormState extends State<PasienUpdateForm> {
  final _formKey = GlobalKey<FormState>();
  final _rmCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _noTelpCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Mengisi form dengan data lama
    _rmCtrl.text = widget.pasien.nomorRm;
    _namaCtrl.text = widget.pasien.nama;
    _tglLahirCtrl.text = widget.pasien.tanggalLahir;
    _noTelpCtrl.text = widget.pasien.nomorTelepon;
    _alamatCtrl.text = widget.pasien.alamat;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Ubah Pasien"),
            Text(
              "No. Absen: 6",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
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
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Data '${_namaCtrl.text}' berhasil diubah!",
                        ),
                      ),
                    );
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
