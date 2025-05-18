import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../configs/constant.dart';
import '../models/adopsi_model.dart';
import '../providers/adopsi_provider.dart';

class AdoptionPage extends StatefulWidget {
  const AdoptionPage({super.key});

  @override
  State<AdoptionPage> createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();

  Future<void> _refresh() async {
    Provider.of<AdopsiProvider>(context, listen: false).getData();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<AdopsiProvider>(context, listen: false).getData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      appBar: AppBar(
          title: const Text('Adopsi'),
          automaticallyImplyLeading: false,
          centerTitle: true),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: _refresh,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 16.0),
              Expanded(
                child: Consumer<AdopsiProvider>(builder: (_, data, __) {
                  if (data.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (data.hasError) {
                    return const Center(
                        child: Text("Terjadi kesalahan pada server"));
                  }

                  if (data.dataList.isEmpty) {
                    return const Center(
                        child: Text("Kamu belum memiliki hewan adopsi"));
                  }

                  List<Widget> cards = [];
                  for (AdopsiModel card in data.dataList) {
                    cards.add(AdoptionCard(
                      name: card.nama,
                      breed: card.ras,
                      age: "${card.umur} Bulan",
                      weight: "${card.berat} Kg",
                      imageUrl: card.foto,
                      status: card.status,
                    ));
                  }

                  return ListView(children: cards);
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AdoptionCard extends StatelessWidget {
  final String name;
  final String breed;
  final String age;
  final String weight;
  final String imageUrl;
  final String status;

  const AdoptionCard({
    super.key,
    required this.name,
    required this.breed,
    required this.age,
    required this.weight,
    required this.imageUrl,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16.0),
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.1),
            blurRadius: 5.0,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        children: [
          Column(
            children: [
              CircleAvatar(
                radius: 30.0,
                backgroundImage: NetworkImage(imageUrl),
              ),
            ],
          ),
          Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14.0,
                        ),
                      ),
                      Text(
                        breed,
                        style: const TextStyle(
                          color: Colors.blue,
                          fontSize: 12.0,
                        ),
                      ),
                      Text(
                        'Umur: $age',
                      ),
                      Text(
                        'Berat: $weight',
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  const SizedBox(width: 16.0),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      elevation: 0,
                      foregroundColor: Colors.white,
                      backgroundColor: getStatusColor(status),
                      shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(15.0), // Border radius 15
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10.0, vertical: 0.0),
                      child: Text(
                        status,
                        textAlign: TextAlign.center, // Teks diatur ke tengah
                      ),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }

  Color getStatusColor(String status) {
    switch (status) {
      case 'ditolak':
        return Colors.red;
      case 'disetujui':
        return Colors.green;
      case 'menunggu':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String getStatusText(String status) {
    switch (status) {
      case 'ditolak':
        return 'Pengajuan ditolak';
      case 'disetujui':
        return 'Pengajuan diterima';
      case 'menunggu':
        return 'Pengajuan diproses';
      default:
        return 'Status tidak diketahui';
    }
  }
}
