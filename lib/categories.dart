import 'package:flutter/material.dart';

class Category {
  final String name;
  final IconData icon;

  Category({required this.name, required this.icon});
}

List<Category> categories = [
  Category(name: 'Móveis', icon: Icons.weekend),
  Category(name: 'Eletrodomésticos', icon: Icons.blender),
  Category(name: 'Smartphones', icon: Icons.smartphone),
  Category(name: 'Eletrônicos', icon: Icons.devices),
  Category(name: 'Outros', icon: Icons.more_horiz),
];
