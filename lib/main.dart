import 'package:anabul/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'providers/adopsi_provider.dart';
import 'providers/hewan_provider.dart';
import 'providers/loading_provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoadingProvider>(
            create: (_) => LoadingProvider()),
        ChangeNotifierProvider<HewanProvider>(create: (_) => HewanProvider()),
        ChangeNotifierProvider<AdopsiProvider>(create: (_) => AdopsiProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(textTheme: GoogleFonts.poppinsTextTheme()),
        home: const SplashScreen(),
      ),
    );
  }
}
