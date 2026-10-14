import 'package:flutter/material.dart';
import 'poli_page.dart';
import 'pegawai_page.dart';
import 'pasien_page.dart';
import 'login.dart'; // Untuk fitur logout

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
      // === SIDEBAR MENU (DRAWER) ===
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            // Menggunakan DrawerHeader agar jarak bisa diatur manual
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.brown[600]),
              margin: EdgeInsets.zero,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment:
                    MainAxisAlignment.end, // Mendorong isi ke bawah
                children: [
                  const CircleAvatar(
                    radius: 32, // Memperbesar foto sedikit
                    backgroundImage: AssetImage("assets/images/profil.jpg"),
                    backgroundColor: Colors.white,
                  ),

                  // 1. Ini jarak agar nama Khinan tidak terlalu dekat dengan foto
                  const SizedBox(height: 16),

                  const Text(
                    "Khinan Zhakaria",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Colors
                          .white, // Teks diubah putih agar jelas di background cokelat
                    ),
                  ),

                  // 2. Di sini tidak ada SizedBox, sehingga Nama dan Absen akan rapat/menempel
                  const Text(
                    "No. Absen: 6",
                    style: TextStyle(fontSize: 14, color: Colors.white),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text("Beranda"),
              onTap: () => Navigator.pop(context),
            ),
            ListTile(
              leading: const Icon(Icons.local_hospital),
              title: const Text("Poli"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PoliPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: const Text("Pegawai"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PegawaiPage()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text("Pasien"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const PasienPage()),
                );
              },
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Keluar"),
              onTap: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const Login()),
                  (route) => false,
                );
              },
            ),
          ],
        ),
      ),
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
