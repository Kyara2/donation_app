import 'package:carousel_slider/carousel_slider.dart';
import 'package:donation_app/item.dart';
import 'package:flutter/material.dart';

import 'chat.dart';

class ItemDetail extends StatelessWidget {
  final Item item;
  const ItemDetail({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IDonate'),
      ),
      body: Card(
        child: Column(
          children: <Widget>[
            CarouselSlider(
              items: item.imageUrl
                  .map((image) => Image.network(
                        image,
                        fit: BoxFit.cover,
                        height: 150,
                      ))
                  .toList(),
              options: CarouselOptions(),
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
                    builder: (context) => ChatPage(item: item.user)));
              },
              child: const Text('Tenho interesse'),
            )
          ],
        ),
      ),
    );
  }
}
