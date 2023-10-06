import 'dart:convert';

import 'package:flutter_test_interview/data/model/television.dart';
import 'package:http/http.dart' as http;

class ApiService {
  static const baseUrl =
      "https://api.tvmaze.com/schedule/web?date=2020-05-29&country=US/";

  Future<List<TelevisionResult>> televitionList() async {
    final response = await http.get(Uri.parse(
        "https://api.tvmaze.com/schedule/web?date=2020-05-29&country=US"));
    if (response.statusCode == 200) {
      return televisionResultFromJson(response.body);
    } else {
      throw Exception('Failed to load televition List');
    }
  }
}
