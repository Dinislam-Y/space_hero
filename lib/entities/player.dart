import 'package:flutter/material.dart';
import 'package:space_hero/entities/entity.dart';

class Player extends Entity {
  Player() : super('player') {
    entityX = 50;
    entityY = 50;
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
    entityX++;
    if (entityX > 500) {
      entityX = 0;
    }
  }

  @override
  void update() {
    move();
  }
}
