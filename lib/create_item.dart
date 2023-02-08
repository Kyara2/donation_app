import 'dart:async';
import 'dart:convert';
import 'package:dio/dio.dart';

import 'package:http/http.dart' as http;

import 'item.dart';

Item parseItem(String responseBody) {
  final responseBodyUTF8 = utf8.decode(responseBody.runes.toList());
  final parsed = json.decode(responseBodyUTF8).cast<Map<dynamic, dynamic>>();
  return parsed.map<Item>((json) => Item.fromJson(json)).toList();
}

final newURI =
    Uri.parse("https://si20222api-production.up.railway.app/announcements");

Future<Item> createItem(String name, String description, String address,
    String postalCode, String userId, String image_1, String category) async {
  var map = <String, dynamic>{};
  map['name'] = name;
  map['description'] = description;
  map['address'] = address;
  map['postal_code'] = postalCode;
  map['user_id'] = userId;
  map['image_1'] = image_1;
  map['category'] = category;

  var dio = Dio();
  FormData formData = new FormData.fromMap(map);

  final response = await dio.post(
      "https://si20222api-production.up.railway.app/announcements",
      data: formData);
  if (response.statusCode == 201) {
    return Item.fromJson(jsonDecode(response.data));
  } else {
    print(response.data);
    throw Exception('Erro ao criar item');
  }
}
