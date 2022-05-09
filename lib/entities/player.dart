import 'package:flutter/material.dart';
import 'package:space_hero/entities/entity.dart';

class Player extends Entity {
  Player() : super('player') {
    entityX = 100;
    entityY = 150;
  }

  @override
  Widget build() {
    return Positioned(
      top: entityX,
      left: entityY,
      child: visible ? sprites.first : const SizedBox(),
    );
  }

  @override
  void move() {
    entityY++;
    if (entityY > 500) {
      entityY = 0;
    }
  }

  @override
  void update() {
    move();
  }
}
