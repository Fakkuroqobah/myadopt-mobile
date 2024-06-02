import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../providers/loading_provider.dart';
import '../configs/constant.dart';
import '../services/register_service.dart';
import 'login_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterService _registerService = RegisterService();

  final _formKey = GlobalKey<FormState>();

  final TextEditingController txtFullName = TextEditingController();
  final TextEditingController txtAddress = TextEditingController();
  final TextEditingController txtPhone = TextEditingController();
  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  String gender = 'Laki-laki';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
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
            padding: const EdgeInsets.all(40.0),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 40.0),
                  Center(
                    child: Image.asset(
                      "${Constant.assetUrl}icon.png",
                      width: 80.0,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Text('Nama Lengkap',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: txtFullName,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Cth: Willo',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nama Lengkap harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  const Text('Jenis Kelamin',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8.0),
                  DropdownButtonFormField<String>(
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    value: gender,
                    items:
                        <String>['Laki-laki', 'Perempuan'].map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        gender = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 12.0),
                  const Text('Alamat',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: txtAddress,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Cth: Jalan Gatot Subroto',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Alamat harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  const Text('Nomor Telepon',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: txtPhone,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Cth: 0815261526xxx',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Nomor Telepon harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  const Text('Username',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: txtUsername,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Cth: Willo',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Username harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 12.0),
                  const Text('Password',
                      style: TextStyle(fontWeight: FontWeight.w500)),
                  const SizedBox(height: 8.0),
                  TextFormField(
                    controller: txtPassword,
                    obscureText: true,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
                      hintText: 'Cth: Password',
                      hintStyle: const TextStyle(color: Colors.grey),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.white,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password harus diisi';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20.0),
                  FractionallySizedBox(
                    widthFactor: 1.0,
                    child: Consumer<LoadingProvider>(
                        builder: (_, loadingProvider, __) {
                      return ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            loadingProvider.setLoading(true);

                            String fullName = txtFullName.text.toString();
                            String address = txtAddress.text.toString();
                            String phone = txtPhone.text.toString();
                            String username = txtUsername.text.toString();
                            String password = txtPassword.text.toString();

                            _registerService
                                .register(fullName, gender, address, phone,
                                    username, password)
                                .then((value) {
                              loadingProvider.setLoading(false);

                              final snackBar = SnackBar(
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'Berhasil!',
                                  message: "Silahkan login menggunakan akun mu",
                                  contentType: ContentType.success,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);

                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const LoginPage()));
                            }).catchError((err) {
                              loadingProvider.setLoading(false);
                              final snackBar = SnackBar(
                                elevation: 0,
                                behavior: SnackBarBehavior.floating,
                                backgroundColor: Colors.transparent,
                                content: AwesomeSnackbarContent(
                                  title: 'On Snap!',
                                  message: (err.response != null)
                                      ? err.response?.data['message']
                                      : "Terjadi kesalahan, periksa koneksi internetmu",
                                  contentType: ContentType.failure,
                                ),
                              );

                              ScaffoldMessenger.of(context)
                                ..hideCurrentSnackBar()
                                ..showSnackBar(snackBar);
                            });
                          } else {
                            final snackBar = SnackBar(
                              elevation: 0,
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: Colors.transparent,
                              content: AwesomeSnackbarContent(
                                title: 'On Snap!',
                                message: 'Semua kolom harus diisi dengan benar',
                                contentType: ContentType.failure,
                              ),
                            );

                            ScaffoldMessenger.of(context)
                              ..hideCurrentSnackBar()
                              ..showSnackBar(snackBar);
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
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            loadingProvider.isLoading ? 'Loading...' : 'Daftar',
                            textAlign:
                                TextAlign.center, // Teks diatur ke tengah
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
