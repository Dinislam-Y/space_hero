import 'package:flutter/material.dart';

abstract class Entity {
  double entityX = 0;
  double entityY = 0;
  final String spriteName;
  bool visible = true;
  //для отрисовки сущностей
  List sprites = [];

  Entity(
    this.spriteName,
  ) {
    for (var i = 0; i < 4; i++) {
      sprites.add(Image.asset('assets/$spriteName$i.png'));
    }
  }

  void update();

  void move();

  Widget build();
}
