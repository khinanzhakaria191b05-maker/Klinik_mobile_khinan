import 'package:flutter/material.dart';
import 'ui/login.dart'; // Menjadikan halaman Login sebagai yang pertama muncul

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
      home: const Login(),
    );
  }
}
