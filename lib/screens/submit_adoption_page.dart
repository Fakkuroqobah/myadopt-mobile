import 'package:flutter/material.dart';

import '../configs/constant.dart';

class SubmitAdoptionPage extends StatefulWidget {
  const SubmitAdoptionPage({super.key});

  @override
  State<SubmitAdoptionPage> createState() => _SubmitAdoptionPageState();
}

class _SubmitAdoptionPageState extends State<SubmitAdoptionPage> {
  final _formKey = GlobalKey<FormState>();
  final _pekerjaanController = TextEditingController();
  final _keteranganController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      appBar: AppBar(
        title: const Text('Pengajuan Adopsi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              Image.asset(
                "${Constant.assetUrl}submit_adoption.png",
                height: 250.0,
              ),
              const SizedBox(height: 12.0),
              const Text('Pekerjaan',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _pekerjaanController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Cth: UI/UX Designer',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 12.0),
              const Text('Alasan Ingin Adopsi',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8.0),
              TextFormField(
                controller: _keteranganController,
                maxLines: 3,
                decoration: InputDecoration(
                  hintText: 'Cth: Ingin punya teman bermain di rumah',
                  hintStyle: const TextStyle(color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
              const SizedBox(height: 18.0),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: ElevatedButton(
                  onPressed: () {},
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
                    padding: EdgeInsets.all(10.0),
                    child: Text(
                      'Ajukan Adopsi',
                      textAlign: TextAlign.center, // Teks diatur ke tengah
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
