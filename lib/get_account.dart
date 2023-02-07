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

Map<String, String> queryParameters = {"email": "teste2@email.com"};

final newURI = Uri.parse("https://si20222api-production.up.railway.app/users").replace(queryParameters: queryParameters);

Future<AccountDetails> fetchAccountDetails() async {
  print(newURI);
  final response = await http.get(newURI); //mudar
  if (response.statusCode == 200) {
    print(response.body);
    return AccountDetails.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to load account details');
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
