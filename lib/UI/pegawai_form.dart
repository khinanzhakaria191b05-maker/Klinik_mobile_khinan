import 'package:flutter/material.dart';
import '../model/pegawai.dart';

class PegawaiForm extends StatefulWidget {
  const PegawaiForm({super.key});

  @override
  State<PegawaiForm> createState() => _PegawaiFormState();
}

class _PegawaiFormState extends State<PegawaiForm> {
  final _formKey = GlobalKey<FormState>();

  // Controller untuk membaca inputan form
  final _nipCtrl = TextEditingController();
  final _namaCtrl = TextEditingController();
  final _tglLahirCtrl = TextEditingController();
  final _noTelpCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tambah Pegawai")),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextField(
                  controller: _nipCtrl,
                  decoration: const InputDecoration(labelText: "NIP"),
                ),
                TextField(
                  controller: _namaCtrl,
                  decoration: const InputDecoration(labelText: "Nama Pegawai"),
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
                  controller: _emailCtrl,
                  decoration: const InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: _passwordCtrl,
                  decoration: const InputDecoration(labelText: "Password"),
                  obscureText: true,
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // Mencegah simpan jika nama atau NIP kosong
                    if (_namaCtrl.text.isEmpty || _nipCtrl.text.isEmpty) return;

                    // Memasukkan data dari form ke dalam model Pegawai
                    Pegawai pegawaiBaru = Pegawai(
                      nip: _nipCtrl.text,
                      nama: _namaCtrl.text,
                      tanggalLahir: _tglLahirCtrl.text,
                      nomorTelepon: _noTelpCtrl.text,
                      email: _emailCtrl.text,
                      password: _passwordCtrl.text,
                    );

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Data '${_namaCtrl.text}' berhasil disimpan!",
                        ),
                      ),
                    );

                    // Menutup form dan mengirim data kembali ke halaman list
                    Navigator.pop(context, pegawaiBaru);
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
