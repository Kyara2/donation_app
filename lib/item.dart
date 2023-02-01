import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Item> parseItems(String responseBody) {
  final responseBodyUTF8 = utf8.decode(responseBody.runes.toList());
  final parsed = json.decode(responseBodyUTF8).cast<Map<String, dynamic>>();
  return parsed.map<Item>((json) => Item.fromJson(json)).toList();
}

Future<List<Item>> fetchItem() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.223:8080/announcements")); //mudar

  if (response.statusCode == 200) {
    return parseItems(response.body);
  } else {
    throw Exception('Failed to load item');
  }
}

class Item {
  final String title;
  final String description;
  final List<String> imageUrl;
  final String address;
  final String postalCode;
  final String user;
  final String id;

  const Item(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.postalCode,
      required this.user,
      required this.id,
      required this.address});

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
        title: json['name'],
        description: json['description'],
        imageUrl: List<String>.from(json["images"].map((x) => x)),
        address: json['address'],
        postalCode: json['postal_code'],
        user: json['user'],
        id: json['id']);
  }
}
