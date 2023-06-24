import 'package:flutter/material.dart';

class Level {
  late final String title;
  late final String subtitle;
  late final String? descreption;
  late final String? image;
  late final IconData? icon;
  late final List<Color> colors;
  late final String routeName;
  Level({
    required this.title,
    required this.subtitle,
    this.descreption,
    this.image,
    this.icon,
    required this.colors,
    required this.routeName,
  });
}
