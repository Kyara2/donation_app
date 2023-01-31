import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

List<Item> parseItems(String responseBody) {
  final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
  return parsed.map<Item>((json) => Item.fromJson(json)).toList();
}

Future<List<Item>> fetchItem() async {
  final response =
      await http.get(Uri.parse("http://192.168.0.103:8080/announcements"));

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

  const Item({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.postalCode,
    required this.user,
    required this.id,
    required this.address
  });

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      title: json['name'],
      description: json['description'],
      imageUrl: List<String>.from(json["images"].map((x) => x)),
      address: json['address'],
      postalCode: json['postal_code'],
      user: json['user'],
      id: json['id']

    );
  }
}

// final items = [
//   Item(
//     title: 'Mesa',
//     description: 'Mesa velha',
//     imageUrl:
//         'https://commerceplus.com.br/uploads/produto_fotos/2_20220224160945_462cf302732041a3966e0911ca9a6563.jpg',
//   ),
//   Item(
//     title: 'Cadeira',
//     description: 'Cadeira semi-nova',
//     imageUrl:
//         'https://abracasa.vteximg.com.br/arquivos/ids/175788-1000-1000/cadeira-lala-palha-preto-e-grafite-escuro-diagonal-traseira.jpg?v=637717330570930000',
//   ),
//   Item(
//     title: 'Cadeira 2',
//     description: 'Cadeira semi-nova',
//     imageUrl:
//         'https://abracasa.vteximg.com.br/arquivos/ids/175788-1000-1000/cadeira-lala-palha-preto-e-grafite-escuro-diagonal-traseira.jpg?v=637717330570930000',
//   ),
//   Item(
//     title: 'Notebook',
//     description: 'macbook pro m2',
//     imageUrl:
//         'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp-spacegray-select-202206?wid=640&hei=595&fmt=jpeg&qlt=95&.v=1664497359481',
//   ),
//   Item(
//     title: 'Macbook',
//     description: 'macbook pro m2',
//     imageUrl:
//         'https://store.storeimages.cdn-apple.com/4982/as-images.apple.com/is/mbp-spacegray-select-202206?wid=640&hei=595&fmt=jpeg&qlt=95&.v=1664497359481',
//   ),
// ];
