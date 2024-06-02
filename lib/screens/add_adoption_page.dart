// import 'dart:io';

import 'package:flutter/material.dart';
// import 'package:iconsax/iconsax.dart';
// import 'package:image_picker/image_picker.dart';

import '../configs/constant.dart';

class AddAdoptionPage extends StatefulWidget {
  const AddAdoptionPage({super.key});

  @override
  State<AddAdoptionPage> createState() => _AddAdoptionPageState();
}

class _AddAdoptionPageState extends State<AddAdoptionPage> {
  // final _formKey = GlobalKey<FormState>();
  // final _namaController = TextEditingController();
  // final _rasController = TextEditingController();
  // final _umurController = TextEditingController();
  // final _alasanController = TextEditingController();
  // final _keteranganController = TextEditingController();
  // File? _image;

  // Future<void> _pickImage() async {
  //   final pickedFile =
  //       await ImagePicker().pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     if (pickedFile != null) {
  //       _image = File(pickedFile.path);
  //     }
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      appBar: AppBar(
        // title: const Text('Tambah Adopsi'),
        title: const Text('Donasi'),
        centerTitle: true,
      ),
      body: const Center(child: Text("Donasi")),
      // body: Padding(
      //   padding: const EdgeInsets.all(16.0),
      //   child: Form(
      //     key: _formKey,
      //     child: ListView(
      //       children: <Widget>[
      //         Image.asset(
      //           "${Constant.assetUrl}add_adoption.png",
      //           height: 250.0,
      //         ),
      //         const SizedBox(height: 12.0),
      //         const Text('Nama', style: TextStyle(fontWeight: FontWeight.w500)),
      //         const SizedBox(height: 8.0),
      //         TextFormField(
      //           controller: _namaController,
      //           decoration: InputDecoration(
      //             contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      //             hintText: 'Cth: Willo',
      //             hintStyle: const TextStyle(color: Colors.grey),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(15),
      //               borderSide: BorderSide.none,
      //             ),
      //             filled: true,
      //             fillColor: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(height: 12.0),
      //         const Text('Jenis',
      //             style: TextStyle(fontWeight: FontWeight.w500)),
      //         const SizedBox(height: 8.0),
      //         DropdownButtonFormField<String>(
      //           decoration: InputDecoration(
      //             contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      //             hintStyle: const TextStyle(color: Colors.grey),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(15),
      //               borderSide: BorderSide.none,
      //             ),
      //             filled: true,
      //             fillColor: Colors.white,
      //           ),
      //           value: 'Kucing',
      //           items: <String>['Kucing', 'Anjing'].map((String value) {
      //             return DropdownMenuItem<String>(
      //               value: value,
      //               child: Text(value),
      //             );
      //           }).toList(),
      //           onChanged: (newValue) {
      //             // do something with the new value
      //           },
      //         ),
      //         const SizedBox(height: 12.0),
      //         const Text('Ras', style: TextStyle(fontWeight: FontWeight.w500)),
      //         const SizedBox(height: 8.0),
      //         TextFormField(
      //           controller: _rasController,
      //           decoration: InputDecoration(
      //             contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      //             hintText: 'Cth: Persia',
      //             hintStyle: const TextStyle(color: Colors.grey),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(15),
      //               borderSide: BorderSide.none,
      //             ),
      //             filled: true,
      //             fillColor: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(height: 12.0),
      //         const Text('Umur', style: TextStyle(fontWeight: FontWeight.w500)),
      //         const SizedBox(height: 8.0),
      //         TextFormField(
      //           controller: _umurController,
      //           decoration: InputDecoration(
      //             contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      //             hintText: 'Cth: 2 Bulan',
      //             hintStyle: const TextStyle(color: Colors.grey),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(15),
      //               borderSide: BorderSide.none,
      //             ),
      //             filled: true,
      //             fillColor: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(height: 12.0),
      //         const Text('Alasan',
      //             style: TextStyle(fontWeight: FontWeight.w500)),
      //         const SizedBox(height: 8.0),
      //         TextFormField(
      //           controller: _alasanController,
      //           decoration: InputDecoration(
      //             contentPadding: const EdgeInsets.symmetric(horizontal: 20),
      //             hintText: 'Cth: Membutuhkan pemilik baru',
      //             hintStyle: const TextStyle(color: Colors.grey),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(15),
      //               borderSide: BorderSide.none,
      //             ),
      //             filled: true,
      //             fillColor: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(height: 12.0),
      //         const Text('Upload Foto',
      //             style: TextStyle(fontWeight: FontWeight.w500)),
      //         const SizedBox(height: 8.0),
      //         GestureDetector(
      //           onTap: _pickImage,
      //           child: Container(
      //             height: 150,
      //             width: double.infinity,
      //             decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.circular(15),
      //                 color: Colors.grey[200]),
      //             child: _image == null
      //                 ? Icon(Iconsax.image, color: Colors.grey[800])
      //                 : Image.file(_image!, fit: BoxFit.cover),
      //           ),
      //         ),
      //         const SizedBox(height: 12.0),
      //         const Text('Keterangan',
      //             style: TextStyle(fontWeight: FontWeight.w500)),
      //         const SizedBox(height: 8.0),
      //         TextFormField(
      //           controller: _keteranganController,
      //           maxLines: 3,
      //           decoration: InputDecoration(
      //             hintText:
      //                 'Cth: Willo adalah kucing ramah dan aktif bermain, keturunan dari ras kucing persia dengan bulu lembut.',
      //             hintStyle: const TextStyle(color: Colors.grey),
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(15),
      //               borderSide: BorderSide.none,
      //             ),
      //             filled: true,
      //             fillColor: Colors.white,
      //           ),
      //         ),
      //         const SizedBox(height: 18.0),
      //         FractionallySizedBox(
      //           widthFactor: 1.0,
      //           child: ElevatedButton(
      //             onPressed: () {},
      //             style: ElevatedButton.styleFrom(
      //               elevation: 0,
      //               foregroundColor: Colors.white,
      //               backgroundColor: Constant.colorSecondary,
      //               shape: RoundedRectangleBorder(
      //                 borderRadius:
      //                     BorderRadius.circular(15.0), // Border radius 15
      //               ),
      //             ),
      //             child: const Padding(
      //               padding: EdgeInsets.all(10.0),
      //               child: Text(
      //                 'Tambah Adopsi',
      //                 textAlign: TextAlign.center, // Teks diatur ke tengah
      //               ),
      //             ),
      //           ),
      //         )
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
