import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../configs/api.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  String? snapToken;
  final Dio _dio = Dio();

  Future<void> fetchSnapToken() async {
    final prefs = await SharedPreferences.getInstance();
    try {
      final data = {
        "order_id": "ORDER${DateTime.now().millisecondsSinceEpoch}",
        "gross_amount": 10000,
        "customer_details": {
          "first_name": prefs.getString('nama'),
          "last_name": prefs.getString('nama'),
          "email": "${prefs.getString('username')}@mail.com",
          "phone": prefs.getString('no_telepon'),
        }
      };

      final response = await _dio.post(
        Api.donasi,
        data: data,
      );

      if (response.statusCode == 200) {
        setState(() {
          snapToken = response.data['token'];
        });
      } else {
        throw Exception("Gagal membuat transaksi");
      }
    } catch (e) {
      // print("Error: $e");
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSnapToken();
  }

  @override
  Widget build(BuildContext context) {
    if (snapToken == null) {
      return Scaffold(
        appBar: AppBar(
            title: const Text('Donasi'),
            automaticallyImplyLeading: false,
            centerTitle: true),
        body: const Center(child: CircularProgressIndicator()),
      );
    }

    return Scaffold(
      appBar: AppBar(
          title: const Text('Donasi'),
          automaticallyImplyLeading: false,
          centerTitle: true),
      body: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(
              Uri.parse(
                  "https://app.sandbox.midtrans.com/snap/v2/vtweb/$snapToken"),
            )),
    );
  }
}
