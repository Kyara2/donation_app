import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

AccountDetails parseAccountDetails(String responseBody) {
  final responseBodyUTF8 = utf8.decode(responseBody.runes.toList());
  final parsed = json.decode(responseBodyUTF8).cast<Map<dynamic, dynamic>>();
  return parsed
      .map<AccountDetails>((json) => AccountDetails.fromJson(json))
      .toList();
}

final newURI = Uri.parse("https://si20222api-production.up.railway.app/users");

Future<AccountDetails> createAccount(String name, String email, String password, String profileImage) async {
  final response = await http.post(
    newURI,
    headers: {"Content-Type": "application/json"},
    body: jsonEncode({
      "name": name,
      "email": email,
      "password": password,
      "profile_image": profileImage
    }),
  );
  if (response.statusCode == 201) {
    return AccountDetails.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create account');
  }
}

class AccountDetails {
  final String id;
  final String name;
  final String email;
  final String profileImage;
  final String createdAt;

  const AccountDetails({
    required this.id,
    required this.name,
    required this.email,
    required this.profileImage,
    required this.createdAt
  });

  factory AccountDetails.fromJson(Map<String, dynamic> json) {
    return AccountDetails(
        id: json['id'],
        name: json['name'],
        email: json['email'],
        profileImage: json['profile_image'],
        createdAt: json['created_at']);
  }
}
