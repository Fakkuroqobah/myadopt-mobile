import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../configs/constant.dart';
import '../models/hewan_model.dart';
import '../providers/hewan_provider.dart';
import 'detail_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<HewanProvider>(context, listen: false).getData();
    });

    _searchController.addListener(() {
      final query = _searchController.text;
      Provider.of<HewanProvider>(context, listen: false).search(query);
    });

    _loadUser();
  }

  String _nama = "";
  String _foto = "";

  Future<void> _loadUser() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _nama = prefs.getString('nama') ?? '';
      _foto = prefs.getString('foto') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Constant.colorPrimary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 28.0),
            child: Column(
              children: [
                const SizedBox(height: 12.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Hello,",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 12.0)),
                        Text(_nama,
                            style: const TextStyle(
                                fontWeight: FontWeight.w700, fontSize: 18.0)),
                      ],
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(_foto),
                    ),
                  ],
                ),
                const SizedBox(height: 19.0),
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
                    controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 20),
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
                const SizedBox(height: 19.0),
                Stack(
                  children: [
                    Image.asset("${Constant.assetUrl}visi.png"),
                    const Positioned(
                      top: 50,
                      left: 30,
                      child: Text(
                        "Save a life Adopt!\nDon't Buy!!!",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 19.0),
                const Row(
                  children: [
                    Text("Kategori",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 20.0)),
                  ],
                ),
                const SizedBox(height: 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _buildCardKategori(
                      "${Constant.assetUrl}kategori_kucing.png",
                      'Kucing',
                    ),
                    const SizedBox(width: 12.0),
                    _buildCardKategori(
                      "${Constant.assetUrl}kategori_anjing.png",
                      'Anjing',
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Consumer<HewanProvider>(builder: (_, data, __) {
                    if (data.isLoading) {
                      return const Center(child: CircularProgressIndicator());
                    }

                    if (data.hasError) {
                      return const Center(
                          child: Text("Terjadi kesalahan pada server"));
                    }

                    List<Widget> cards = [];
                    for (HewanModel card in data.dataList) {
                      cards.add(
                          _buildCard(card, card.foto, card.nama, card.ras));
                    }

                    return Row(children: cards);
                  }),
                ),
                const SizedBox(height: 12.0),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCard(HewanModel card, String image, String text1, String text2) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailPage(data: card),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(right: 12.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(1, 1),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Image.network(
                image,
                fit: BoxFit.cover,
                height: 140,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(text1,
                        style: const TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18.0)),
                    Text(text2),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildCardKategori(String imagePath, String text) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          Provider.of<HewanProvider>(context, listen: false)
              .filterByKategori(text);
        },
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 2,
                blurRadius: 5,
                offset: const Offset(1, 1),
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.fill,
                    height: 30,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10.0, right: 20.0),
                child: Text(
                  text,
                  style: const TextStyle(fontSize: 16.0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
