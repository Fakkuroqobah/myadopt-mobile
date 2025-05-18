import 'package:anabul/models/hewan_model.dart';
import 'package:flutter/material.dart';

import '../services/hewan_service.dart';

class HewanProvider extends ChangeNotifier {
  List<HewanModel> _dataList = [];
  List<HewanModel> _filteredList = [];

  bool _isLoading = false;
  bool _hasError = false;

  String _searchQuery = "";
  String _selectedKategori = "";

  List<HewanModel> get dataList => _filteredList;
  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> getData() async {
    _isLoading = true;
    notifyListeners();

    try {
      HewanService dataService = HewanService();
      _dataList = await dataService.getHewan();

      _filteredList = _dataList;
      _hasError = false;
    } catch (_) {
      _hasError = true;
    }

    _isLoading = false;
    notifyListeners();
  }

  void search(String query) {
    _searchQuery = query;
    _applyFilter();
  }

  void filterByKategori(String kategori) {
    if (_selectedKategori == kategori) {
      _selectedKategori = "";
    } else {
      _selectedKategori = kategori;
    }
    _applyFilter();
  }

  void _applyFilter() {
    _filteredList = _dataList.where((item) {
      final matchSearch = _searchQuery.isEmpty ||
          item.nama.toLowerCase().contains(_searchQuery.toLowerCase()) ||
          item.ras.toLowerCase().contains(_searchQuery.toLowerCase());

      final matchKategori = _selectedKategori.isEmpty ||
          item.jenis.toLowerCase() == _selectedKategori.toLowerCase();

      return matchSearch && matchKategori;
    }).toList();

    notifyListeners();
  }
}
