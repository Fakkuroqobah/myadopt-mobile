import 'package:anabul/models/hewan_model.dart';
import 'package:flutter/material.dart';

import '../services/hewan_service.dart';

class HewanProvider extends ChangeNotifier {
  List<HewanModel> _dataList = [];

  bool _isLoading = false;
  bool _hasError = false;

  List<HewanModel> get dataList => _dataList;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> getData() async {
    _isLoading = true;
    notifyListeners();

    try {
      HewanService dataService = HewanService();
      _dataList = await dataService.getHewan();

      _hasError = false;
    } catch (e) {
      print(e);
      _hasError = true;
    }

    _isLoading = false;
    notifyListeners();
  }
}
