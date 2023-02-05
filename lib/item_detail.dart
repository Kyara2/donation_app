import 'package:carousel_slider/carousel_slider.dart';
import 'package:donation_app/item.dart';
import 'package:flutter/material.dart';

import 'chat.dart';
import 'main.dart';

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
        title: const Text('Detalhes'),
      ),
      body: SingleChildScrollView(
        child: Card(
          color: colorCustom,
          child: Column(
            children: <Widget>[
              CarouselSlider(
                items: item.imageUrl
                    .map((image) => Image.network(
                          image,
                          fit: BoxFit.cover,
                          height: 100,
                        ))
                    .toList(),
                options: CarouselOptions(
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 2.0,
                ),
              ),
              ListTile(
                title: Text(item.title,
                    style: const TextStyle(color: Colors.white)),
                subtitle: Text(item.description,
                    style: const TextStyle(color: Colors.white)),
              ),
              Text(item.address, style: const TextStyle(color: Colors.white)),
              Text(item.postalCode,
                  style: const TextStyle(color: Colors.white)),
              Text(item.user, style: const TextStyle(color: Colors.white)),
              ElevatedButton(
                style: ButtonStyle(
                  foregroundColor:
                      MaterialStateProperty.all<Color>(Colors.white),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.deepOrange),
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
      ),
    );
  }
}
