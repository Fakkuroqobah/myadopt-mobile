import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path/path.dart' as path;

import '../configs/constant.dart';
import '../providers/loading_provider.dart';
import '../services/user_service.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  String? _jenisKelamin;

  final UserService _userService = UserService();

  final TextEditingController txtId = TextEditingController();
  final TextEditingController txtNama = TextEditingController();
  final TextEditingController txtAlamat = TextEditingController();
  final TextEditingController txtNoTelepon = TextEditingController();
  final TextEditingController txtUsername = TextEditingController();

  File? _imageFile;
  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImage() async {
    final XFile? pickedFile =
        await _picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        _imageFile = File(pickedFile.path);
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _jenisKelamin = prefs.getString('jenis_kelamin');
      txtId.text = prefs.getInt('id').toString();
      txtNama.text = prefs.getString('nama') ?? '';
      txtAlamat.text = prefs.getString('alamat') ?? '';
      txtNoTelepon.text = prefs.getString('no_telepon') ?? '';
      txtUsername.text = prefs.getString('username') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Constant.colorPrimary,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.white,
          title: const Text('Profil'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 50,
                        backgroundImage: _imageFile != null
                            ? FileImage(_imageFile!)
                            : const AssetImage("${Constant.assetUrl}avatar.png")
                                as ImageProvider,
                      ),
                      // Edit Icon
                      Positioned(
                        bottom: 0,
                        right: 0,
                        child: InkWell(
                          onTap: _pickImage,
                          child: CircleAvatar(
                            radius: 15,
                            backgroundColor: Constant.colorSecondary,
                            child: const Icon(
                              Iconsax.edit_2,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Offstage(
                  offstage: true,
                  child: TextFormField(
                    controller: txtId,
                  ),
                ),
                const SizedBox(height: 24.0),
                const Text('Nama Lengkap',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: txtNama,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Cth: Agung Maulana',
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
                const Text('Username',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  enabled: false,
                  controller: txtUsername,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Cth: Agung Maulana',
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
                const Text('Jenis Kelamin',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  value: _jenisKelamin,
                  items: <String>['Laki-laki', 'Perempuan'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (newValue) {
                    _jenisKelamin = newValue;
                  },
                ),
                const SizedBox(height: 12.0),
                const Text('Alamat',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: txtAlamat,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Cth: Jl. Gatot Subroto',
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
                const Text('Nomor Telepon',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: txtNoTelepon,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Cth: 085142516xxx',
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
                  child: Consumer<LoadingProvider>(builder: (_, data, __) {
                    return ElevatedButton(
                      onPressed: () async {
                        data.setLoading(true);

                        String nama = txtNama.text;
                        String jenisKelamin = _jenisKelamin ?? "";
                        String alamat = txtAlamat.text;
                        String noTelepon = txtNoTelepon.text;

                        if (nama == "") {
                          data.setLoading(false);
                          if (!mounted) return;
                          const snackBar = SnackBar(
                            content: Text('Nama harus diisi!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (jenisKelamin == "") {
                          data.setLoading(false);
                          if (!mounted) return;
                          const snackBar = SnackBar(
                            content: Text('Jenis kelamin harus diisi!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (alamat == "") {
                          data.setLoading(false);
                          if (!mounted) return;
                          const snackBar = SnackBar(
                            content: Text('Alamat harus diisi!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else if (noTelepon == "") {
                          data.setLoading(false);
                          if (!mounted) return;
                          const snackBar = SnackBar(
                            content: Text('Nomor telepon harus diisi!'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        } else {
                          final Uint8List fileBytes =
                              await _imageFile!.readAsBytes();
                          final String fileExtension = path
                              .extension(_imageFile!.path)
                              .replaceFirst('.', '');

                          _userService
                              .add(nama, jenisKelamin, alamat, noTelepon,
                                  fileBytes, fileExtension)
                              .then((value) {
                            data.setLoading(false);
                            value.fold(
                              (errorMessage) {
                                SnackBar snackBar = SnackBar(
                                  content: Text(errorMessage),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                                return;
                              },
                              (response) {
                                SnackBar snackBar = const SnackBar(
                                  content: Text("Profil berhasil diubah"),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                Navigator.pop(context);
                                return null;
                              },
                            );
                          }).catchError((err) {
                            data.setLoading(false);
                            SnackBar snackBar = const SnackBar(
                              content: Text("Terjadi kesalahan"),
                            );
                            ScaffoldMessenger.of(context)
                                .showSnackBar(snackBar);
                          });
                        }
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
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          data.isLoading ? "Loading..." : 'Simpan',
                          textAlign: TextAlign.center, // Teks diatur ke tengah
                        ),
                      ),
                    );
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
