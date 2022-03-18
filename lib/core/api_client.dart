import 'dart:convert';

import 'package:http/http.dart';

import 'constants/api_constants.dart';

class ApiClient {
  final Client _client;

  ApiClient(this._client);

  Future<Map<String, dynamic>> get(String path) async {
    final response = await _client.get(
        Uri.parse(
            '${ApiConstants.BASE_URL}$path?api_key=${ApiConstants.API_KEY}'),
        headers: {'Content-Type': 'application/json'});

    print('Eto body ${response.body}');
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body);
      print('Eto parsed body $json');
      return json;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}
