import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

import '../configs/constant.dart';

class AdoptionPage extends StatefulWidget {
  const AdoptionPage({super.key});

  @override
  State<AdoptionPage> createState() => _AdoptionPageState();
}

class _AdoptionPageState extends State<AdoptionPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      appBar: AppBar(
        title: const Text('Adopsi'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.1),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: TextField(
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                  hintText: 'Search...',
                  hintStyle: const TextStyle(color: Colors.grey),
                  prefixIcon:
                      const Icon(Iconsax.heart_search, color: Colors.grey),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide.none,
                  ),
                  filled: true,
                  fillColor: Colors.white,
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: const [
                  AdoptionCard(
                    name: 'Willo adalah willie',
                    breed: 'Persia',
                    age: '2 tahun',
                    weight: '2 kg',
                    imageUrl: 'https://via.placeholder.com/150',
                    status: 'ditolak',
                  ),
                  AdoptionCard(
                    name: 'Willo adalah willie',
                    breed: 'Persia',
                    age: '2 tahun',
                    weight: '2 kg',
                    imageUrl: 'https://via.placeholder.com/150',
                    status: 'diterima',
                  ),
                  AdoptionCard(
                    name: 'Willo adalah willie',
                    breed: 'Persia',
                    age: '2 tahun',
                    weight: '2 kg',
                    imageUrl: 'https://via.placeholder.com/150',
                    status: 'diproses',
                  ),
                ],
              ),
            ),
          ],
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
                  const SizedBox(width: 16.0),
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
                child: const Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0, vertical: 0.0),
                  child: Text(
                    'Simpan',
                    textAlign: TextAlign.center, // Teks diatur ke tengah
                  ),
                ),
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
      case 'diterima':
        return Colors.green;
      case 'diproses':
        return Colors.orange;
      default:
        return Colors.grey;
    }
  }

  String getStatusText(String status) {
    switch (status) {
      case 'ditolak':
        return 'Pengajuan ditolak';
      case 'diterima':
        return 'Pengajuan diterima';
      case 'diproses':
        return 'Pengajuan diproses';
      default:
        return 'Status tidak diketahui';
    }
  }
}
