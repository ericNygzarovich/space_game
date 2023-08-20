import 'package:flutter/material.dart';

abstract class Entity {
  late double x;
  late double y;
  String spriteName;
  bool visible = true;
  List sprites = [];

  Entity(this.spriteName, {this.x = 0, this.y = 0}) {
    for (int i = 0; i < 4; i++) {
      sprites.add(Image.asset('assets/$spriteName$i.png'));
    }
  }

  void update();

  void moove();

  Widget build();
}
