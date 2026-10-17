import 'package:flutter/material.dart';
import 'sidebar.dart'; // Memanggil file sidebar yang baru kita buat
import 'poli_page.dart';
import 'pegawai_page.dart';
import 'pasien_page.dart';
import 'login.dart';

class Beranda extends StatelessWidget {
  const Beranda({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Beranda"),
        centerTitle: true,
        elevation: 0,
      ),
      // Di sini kita tinggal panggil Sidebar() saja, tidak perlu nulis panjang-panjang lagi
      drawer: const Sidebar(),

      // === BODY (KOTAK-KOTAK MENU) ===
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Selamat Datang di Aplikasi",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              "Aplikasi ini memberikan pengalaman yang\nluar biasa!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 14, color: Colors.grey[600]),
            ),
            const SizedBox(height: 40),
            Wrap(
              spacing: 16.0,
              runSpacing: 16.0,
              alignment: WrapAlignment.center,
              children: [
                _buildMenuBox(context, Icons.accessible, const PoliPage()),
                _buildMenuBox(context, Icons.people, const PegawaiPage()),
                _buildMenuBox(context, Icons.person, const PasienPage()),
                _buildLogoutBox(context),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuBox(
    BuildContext context,
    IconData icon,
    Widget halamanTujuan,
  ) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => halamanTujuan),
        );
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.brown[600],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(icon, color: Colors.white, size: 36),
      ),
    );
  }

  Widget _buildLogoutBox(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false,
        );
      },
      child: Container(
        width: 80,
        height: 80,
        decoration: BoxDecoration(
          color: Colors.brown[600],
          borderRadius: BorderRadius.circular(12),
        ),
        child: const Icon(Icons.logout, color: Colors.white, size: 36),
      ),
    );
  }
}
