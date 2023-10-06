import 'package:flutter/material.dart';
import 'package:flutter_test_interview/data/api/ApiService.dart';
import 'package:flutter_test_interview/data/model/television.dart';

enum ResultState {loading, noData, hasData, error}

class TelevisionProvider extends ChangeNotifier {
  final ApiService apiService;

  TelevisionProvider({required this.apiService}) {
    _fetchTelevision();
  }

  late List<TelevisionResult> _televisionResult;
  late ResultState _state;
  String _message = '';

  String get message => _message;

  List<TelevisionResult> get result => _televisionResult;

  ResultState get state => _state;

  Future<dynamic> _fetchTelevision() async {
    try {
      _state = ResultState.loading;
      notifyListeners();
      final television = await apiService.televitionList();
      List<TelevisionResult> televisionList = [];
      // televisionList.add(television);
      if (television.isEmpty) {
        _state = ResultState.noData;
        notifyListeners();
        return _message = 'Empty Data';
      } else {
        _state = ResultState.hasData;
        notifyListeners();
        return _televisionResult = television ;
      }
    } catch (e) {
      _state = ResultState.error;
      notifyListeners();
      return _message = "error ---> $e";
    }
  }
}