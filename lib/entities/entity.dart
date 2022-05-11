import 'package:flutter/material.dart';

abstract class Entity {
  double entityX = 0;
  double entityY = 0;
  final String spriteName;
  bool visible = true;
  //для отрисовки сущностей
  List sprites = [];

  int currentSprite = 0;
  int _currentTick = 0;

  Entity(
    this.spriteName,
  ) {
    for (var i = 0; i < 4; i++) {
      sprites.add(Image.asset('assets/$spriteName$i.png'));
    }
  }
  void _animate() {
    _currentTick++;
    if (_currentTick > 15) {
      currentSprite++;
      _currentTick = 0;
    }
    if (currentSprite > 3) {
      currentSprite = 0;
    }
  }

  void update() {
    _animate();
    move();
  }

  void move();

  Widget build();
}
