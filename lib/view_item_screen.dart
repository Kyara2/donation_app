import 'package:donation_app/item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';
import 'dart:ui';
import 'package:google_fonts/google_fonts.dart';
import 'package:donation_app/utils.dart';

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
    return Card(
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
        ],
      ),
    );;
  }
}