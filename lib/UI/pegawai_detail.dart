import 'package:flutter/material.dart';
import '../model/pegawai.dart';
import 'pegawai_update_form.dart'; // Import form ubah pegawai

class PegawaiDetail extends StatefulWidget {
  final Pegawai pegawai;

  const PegawaiDetail({super.key, required this.pegawai});

  @override
  State<PegawaiDetail> createState() => _PegawaiDetailState();
}

class _PegawaiDetailState extends State<PegawaiDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Detail Pegawai"),
            Text(
              "No. Absen: 6",
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "NIP : ${widget.pegawai.nip}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Nama : ${widget.pegawai.nama}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Tanggal Lahir : ${widget.pegawai.tanggalLahir}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "No. Telepon : ${widget.pegawai.nomorTelepon}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              "Email : ${widget.pegawai.email}",
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Pindah ke form ubah pegawai
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            PegawaiUpdateForm(pegawai: widget.pegawai),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Ubah"),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Memunculkan pesan konfirmasi hapus data
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text("Konfirmasi"),
                        content: const Text(
                          "Yakin ingin menghapus data pegawai ini?",
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("Batal"),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context); // Tutup dialog
                              Navigator.pop(context); // Kembali ke list
                            },
                            child: const Text(
                              "Hapus",
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Hapus"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
