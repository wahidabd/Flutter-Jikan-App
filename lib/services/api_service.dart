import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

class ApiService {
  String baseUrl = 'https://api.jikan.moe/v4';

  Future<dynamic> get({String endpoint = ''}) async {
    try {
      final url = Uri.parse('$baseUrl/$endpoint');
      final response = await http.get(url);

      switch (response.statusCode) {
        case 400:
          throw Exception('Bad Request');
        case 401:
          throw Exception('Unauthorized');
        case 403:
          throw Exception('Forbidden');
        case 404:
          throw Exception('Not Found');
        case 500:
          throw Exception('Internal Server Error');
        case 503:
          throw Exception('Service Unavailable');
        default:
          Map<String, dynamic> data = json.decode(response.body);

          final result = {
            'data': data['data'],
            'last_page': null,
            'current_page': null,
          };

          if (data.containsKey('pagination')) {
            if (data['pagination'].containsKey('last_visible_page')) {
              result['last_page'] = data['pagination']['last_visible_page'];
            }
            if (data['pagination'].containsKey('current_page')) {
              result['current_page'] = data['pagination']['current_page'];
            }
          } else {
            print('does not have page');
          }

          return result;
      }
    } catch (e) {
      debugPrint(e.toString());
      // throw e.toString();
    }
  }
}
