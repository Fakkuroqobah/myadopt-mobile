import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';

import '../providers/loading_provider.dart';
import '../configs/constant.dart';
import '../services/login_service.dart';
import 'bottom_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginService _loginService = LoginService();

  final TextEditingController txtUsername = TextEditingController();
  final TextEditingController txtPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    txtUsername.text = "admin";
    txtPassword.text = "password";

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 80.0),
                Center(
                  child: Image.asset(
                    "${Constant.assetUrl}icon.png",
                    width: 80.0,
                  ),
                ),
                const SizedBox(height: 30.0),
                const Text('Username',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: txtUsername,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Cth: Willo',
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
                const Text('Password',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8.0),
                TextFormField(
                  controller: txtPassword,
                  obscureText: true,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    hintText: 'Cth: Password',
                    hintStyle: const TextStyle(color: Colors.grey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                      borderSide: BorderSide.none,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                const SizedBox(height: 20.0),
                FractionallySizedBox(
                  widthFactor: 1.0,
                  child: Consumer<LoadingProvider>(
                      builder: (_, loadingProvider, __) {
                    return ElevatedButton(
                      onPressed: () {
                        loadingProvider.setLoading(true);

                        String username = txtUsername.text.toString();
                        String password = txtPassword.text.toString();

                        if (username.isEmpty || password.isEmpty) {
                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'On Snap!',
                              message: 'Username atau Password harus diisi',
                              contentType: ContentType.failure,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);
                        }

                        _loginService.login(username, password).then((value) {
                          loadingProvider.setLoading(false);
                          Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) =>
                                      const BottomPage(initialTabIndex: 0)),
                              (Route<dynamic> route) => false);
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
                          loadingProvider.isLoading ? 'Loading...' : 'Masuk',
                          textAlign: TextAlign.center, // Teks diatur ke tengah
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
    );
  }
}
