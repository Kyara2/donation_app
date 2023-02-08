import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

List<Category> categories = [
  Category(name: 'Roupas', icon: Icons.checkroom_rounded),
  Category(name: 'Móveis', icon: Icons.weekend_rounded),
  Category(name: 'Eletrodomésticos', icon: Icons.blender_rounded),
  Category(name: 'Smartphones', icon: Icons.smartphone_rounded),
  Category(name: 'Eletrônicos', icon: Icons.devices_rounded),
  Category(name: 'Outros', icon: Icons.more_horiz_rounded),
];
