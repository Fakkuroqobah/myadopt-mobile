import 'package:flutter/material.dart';

import '../configs/constant.dart';
import 'login_page.dart';
import 'register_page.dart';

class LauncherPage extends StatefulWidget {
  const LauncherPage({super.key});

  @override
  State<LauncherPage> createState() => _LauncherPageState();
}

class _LauncherPageState extends State<LauncherPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("${Constant.assetUrl}launcher.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              const SizedBox(height: 100.0),
              Image.asset("${Constant.assetUrl}auth.png", width: 170.0),
              const SizedBox(height: 30.0),
              const Text("Selamat Datang!",
                  style:
                      TextStyle(fontSize: 20.0, fontWeight: FontWeight.w700)),
              const SizedBox(height: 10.0),
              const Text(
                  "MyAdopt  Merupakan aplikasi\nAdopsi yang membantu dalam permasalahan\nadopsi anabul",
                  style: TextStyle(fontSize: 13.0, fontWeight: FontWeight.w100),
                  textAlign: TextAlign.center),
              const SizedBox(height: 25.0),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const LoginPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: Constant.colorSecondary,
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15.0), // Border radius 15
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Masuk',
                      textAlign: TextAlign.center, // Teks diatur ke tengah
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15.0),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const RegisterPage(),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    foregroundColor: Colors.white,
                    backgroundColor: const Color(0xff6695E0),
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(15.0), // Border radius 15
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(15.0),
                    child: Text(
                      'Daftar',
                      textAlign: TextAlign.center, // Teks diatur ke tengah
                    ),
                  ),
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
