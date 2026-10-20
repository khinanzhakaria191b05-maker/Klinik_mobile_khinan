import 'package:flutter/material.dart';
import 'helpers/user_info.dart';
import 'ui/beranda.dart';
import 'ui/login.dart';

Future<void> main() async {
  // Wajib ditambahkan jika main() menggunakan async
  WidgetsFlutterBinding.ensureInitialized();

  // Mengecek token yang tersimpan
  var token = await UserInfo().getToken();
  print("Token saat ini: $token");

  // Melempar status token ke class MyApp
  runApp(MyApp(token: token));
}

class MyApp extends StatelessWidget {
  final String? token;
  const MyApp({super.key, this.token});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Klinik APP',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // Mengubah tema global menjadi kecokelatan sesuai gambar
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.brown[600],
          foregroundColor: Colors.white,
          elevation: 0,
        ),
        // Mengubah warna dasar komponen lain agar senada
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.brown),
      ),
      // Logika pengecekan: Jika token kosong (null) buka Login, jika ada buka Beranda
      home: token == null ? const Login() : const Beranda(),
    );
  }
}
