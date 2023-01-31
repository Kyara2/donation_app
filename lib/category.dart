import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List<Category> parseItems(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Category>((json) => Category.fromJson(json)).toList();
}

Future<List<Category>> fetchItem() async {
  final response =
  await http.get(Uri.parse("http://192.168.0.103:8080/category"));

  if (response.statusCode == 200) {
    return parseItems(response.body);
  } else {
    throw Exception('Failed to load category');
  }
}

class Category {
  final String title;
  final List<String> imageUrl;
  final String id;

  const Category({
    required this.title,
    required this.imageUrl,
    required this.id,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
        title: json['name'],
        imageUrl: List<String>.from(json["images"].map((x) => x)),
        id: json['id']

    );
  }
}
