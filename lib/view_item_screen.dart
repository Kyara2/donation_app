import 'package:donation_app/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:donation_app/utils.dart';

import 'chat.dart';

class Viewitem extends StatelessWidget {
  final Item item;
  const Viewitem({
    Key? key,
    required this.item,
}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> images=[];
    images.add(item.imageUrl.first);
    return Scaffold(
      appBar: AppBar(
        title: const Text('IDonate'),

      ),
      body: Card(
        child: Column(
          children: <Widget>[
            Image.network(
              images.first,
              fit: BoxFit.cover,
              height: 150,
            ),
            ListTile(
              title: Text(item.title),
              subtitle: Text(item.description),

            ),
            Text(item.address),
            Text(item.postalCode),
            Text(item.user),
            ElevatedButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.white),
              ),
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) =>
                        ChatPage(item: item.user)));
              },
              child: const Text('Tenho interesse'),
            )
          ],
        ),
      ),
    );
  }
}