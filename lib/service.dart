import 'dart:convert';

import 'package:flutter_research/model.dart';
import 'package:http/http.dart' as http;

Future<List<Model>> fetchData() async {
  final response = await http.get(Uri.parse('https://picsum.photos/v2/list'));

  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => Model.fromJson(data)).toList();
  } else {
    throw Exception('Unable to call api');
  }
}
