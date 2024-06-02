import 'package:anabul/models/adopsi_model.dart';
import 'package:flutter/material.dart';

import '../services/adopsi_service.dart';

class AdopsiProvider extends ChangeNotifier {
  List<AdopsiModel> _dataList = [];

  bool _isLoading = false;
  bool _hasError = false;

  List<AdopsiModel> get dataList => _dataList;

  bool get isLoading => _isLoading;
  bool get hasError => _hasError;

  Future<void> getData() async {
    _isLoading = true;
    notifyListeners();

    try {
      AdopsiService dataService = AdopsiService();
      _dataList = await dataService.getAdopsi();

      _hasError = false;
    } catch (_) {
      _hasError = true;
    }

    _isLoading = false;
    notifyListeners();
  }
}
