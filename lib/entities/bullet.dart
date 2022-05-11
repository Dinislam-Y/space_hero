import 'dart:math';

import 'package:flutter/material.dart';
import 'package:space_hero/entities/entity.dart';
import 'package:space_hero/utilities/global_vars.dart';

class Bullet extends Entity {
  final double playAngle;
  final double _speedBullet = 5;

  Bullet({
    required this.playAngle,
    required double playerX,
    required double playerY,
  }) : super('bullet') {
    entityX = playerX;
    entityY = playerY;
  }

  @override
  Widget build() {
    return Positioned(
      top: entityY,
      left: entityX,
      child: Transform.rotate(
        angle: playAngle,
        child: sprites[currentSprite],
        //первый рисунок коробля
      ),
    );
  }

  @override
  void move() {
    entityX += sin(playAngle) * _speedBullet;
    entityY -= cos(playAngle) * _speedBullet;
    if (entityY > GlobalVars.screenHeight ||
        entityX > GlobalVars.screenWidth ||
        entityX < 0 ||
        entityY < 0) {
      visible = false;
      //если отрисовка выходит за рамки нашего экрана - оно уничтожается
    }
  }
}
