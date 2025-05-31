import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../configs/constant.dart';
import '../../configs/api.dart';

class DonationPage extends StatefulWidget {
  const DonationPage({super.key});

  @override
  State<DonationPage> createState() => _DonationPageState();
}

class _DonationPageState extends State<DonationPage> {
  String? snapToken;
  final Dio _dio = Dio();
  final TextEditingController _amountController = TextEditingController();
  bool isLoading = false;

  Future<void> fetchSnapToken(int amount) async {
    final prefs = await SharedPreferences.getInstance();
    try {
      setState(() {
        isLoading = true;
      });

      final data = {
        "order_id": "ORDER${DateTime.now().millisecondsSinceEpoch}",
        "gross_amount": amount,
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
      // Handle error as needed
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (snapToken != null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Donasi'),
          automaticallyImplyLeading: false,
          centerTitle: true,
        ),
        body: WebViewWidget(
          controller: WebViewController()
            ..setJavaScriptMode(JavaScriptMode.unrestricted)
            ..loadRequest(Uri.parse(
                "https://app.sandbox.midtrans.com/snap/v2/vtweb/$snapToken")),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Donasi'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text('Masukan Nominal Donasi',
                style: TextStyle(fontWeight: FontWeight.w500)),
            const SizedBox(height: 8.0),
            TextFormField(
              controller: _amountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                hintText: 'Cth: 10.000',
                hintStyle: const TextStyle(color: Colors.grey),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
                filled: true,
                fillColor: Colors.white,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLoading
                  ? null
                  : () {
                      final amount = int.tryParse(_amountController.text);
                      if (amount != null && amount > 0) {
                        fetchSnapToken(amount);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Nominal tidak valid")),
                        );
                      }
                    },
              style: ElevatedButton.styleFrom(
                elevation: 0,
                foregroundColor: Colors.white,
                backgroundColor: Constant.colorSecondary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0), // Border radius 15
                ),
              ),
              child: isLoading
                  ? const Text('Loading...')
                  : const Text('Lanjutkan ke Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}
