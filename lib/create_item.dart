import 'dart:async';
import 'dart:convert';
import 'item.dart';

import 'package:http/http.dart' as http;

Item parseItem(String responseBody) {
  final responseBodyUTF8 = utf8.decode(responseBody.runes.toList());
  final parsed = json.decode(responseBodyUTF8).cast<Map<dynamic, dynamic>>();
  return parsed
      .map<Item>((json) => Item.fromJson(json))
      .toList();
}

final newURI = Uri.parse("https://si20222api-production.up.railway.app/Items");

Future<Item> createItem(String name,String description,String address,String postalCode,String userId,String image_1,String image_2,String category) async {
  final response = await http.post(
    newURI,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "name": name,
      "description": description,
      "address": address,
      "postal_code": postalCode,
      "user_id": userId,
      "image_1": image_1,
      "image_2": image_2,
      "category": category,
    }),
  );
  if (response.statusCode == 201) {
    return Item.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create Item');
  }
}


