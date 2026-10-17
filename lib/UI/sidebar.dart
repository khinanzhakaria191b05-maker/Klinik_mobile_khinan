import 'package:flutter/material.dart';
import 'poli_page.dart';
import 'pegawai_page.dart';
import 'pasien_page.dart';
import 'login.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          // Bagian Profil yang sudah kita rapikan kemarin
          DrawerHeader(
            decoration: BoxDecoration(color: Colors.brown[600]),
            margin: EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                const CircleAvatar(
                  radius: 32,
                  backgroundImage: AssetImage("assets/images/profil.jpg"),
                  backgroundColor: Colors.white,
                ),
                const SizedBox(height: 16),
                const Text(
                  "Khinan Zhakaria",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
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
    );
  }
}
