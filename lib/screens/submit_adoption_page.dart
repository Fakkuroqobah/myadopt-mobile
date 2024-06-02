import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configs/constant.dart';
import '../models/hewan_model.dart';
import '../providers/loading_provider.dart';
import '../services/ajukan_adopsi_service.dart';
import 'bottom_page.dart';

class SubmitAdoptionPage extends StatefulWidget {
  final HewanModel data;

  const SubmitAdoptionPage({super.key, required this.data});

  @override
  State<SubmitAdoptionPage> createState() => _SubmitAdoptionPageState();
}

class _SubmitAdoptionPageState extends State<SubmitAdoptionPage> {
  final AjukanAdopsiService _ajukanAdopsiService = AjukanAdopsiService();

  final _formKey = GlobalKey<FormState>();
  final _pekerjaanController = TextEditingController();
  final _alasanController = TextEditingController();

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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Pekerjaan harus diisi';
                    }
                    return null;
                  }),
              const SizedBox(height: 12.0),
              const Text('Alasan Ingin Adopsi',
                  style: TextStyle(fontWeight: FontWeight.w500)),
              const SizedBox(height: 8.0),
              TextFormField(
                  controller: _alasanController,
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
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Alasan harus diisi';
                    }
                    return null;
                  }),
              const SizedBox(height: 18.0),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: Consumer<LoadingProvider>(
                    builder: (_, loadingProvider, __) {
                  return ElevatedButton(
                    onPressed: () async {
                      loadingProvider.setLoading(true);
                      if (!_formKey.currentState!.validate()) {
                        loadingProvider.setLoading(false);
                      } else {
                        SharedPreferences prefs =
                            await SharedPreferences.getInstance();

                        int? idPengguna = prefs.getInt('id');
                        int idHewan = widget.data.id;
                        String pekerjaan = _pekerjaanController.text.toString();
                        String alasan = _alasanController.text.toString();

                        _ajukanAdopsiService
                            .add(idPengguna, idHewan, pekerjaan, alasan)
                            .then((value) {
                          loadingProvider.setLoading(false);
                          final snackBar = SnackBar(
                            elevation: 0,
                            behavior: SnackBarBehavior.floating,
                            backgroundColor: Colors.transparent,
                            content: AwesomeSnackbarContent(
                              title: 'Berhasil!',
                              message: "Pengajuan adopsi mu berhasil dikirim",
                              contentType: ContentType.success,
                            ),
                          );

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(snackBar);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  const BottomPage(initialTabIndex: 2),
                            ),
                          );
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
                        loadingProvider.isLoading
                            ? 'Loading...'
                            : 'Ajukan Adopsi',
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
    );
  }
}
