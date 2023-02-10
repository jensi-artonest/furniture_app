import 'dart:convert';

import 'package:furniture_app/Widget/categories.dart';
import 'package:http/http.dart' as http;

Future<List<Category>> fetchCategories() async {
  String apiUrl =
      "https://5f210aa9daa42f001666535e.mockapi.io/api/categories";

  final response = await http.get(Uri(path: apiUrl));

  if (response.statusCode == 200) {
    List<Category> categories = (json.decode(response.body) as List)
        .map((data) => Category.fromJson(data))
        .toList();
    return categories;
  } else {

    throw Exception('Failed to load');
  }
}
