import 'dart:math';

import 'package:flutter/material.dart';
import 'package:space_hero/entities/entity.dart';
import 'package:space_hero/utilities/global_vars.dart';

class Player extends Entity {
  Player() : super('player') {
    entityX = 0;
    entityY = 0;
  }

  double _angle = 0;
  double _degree = 0;
  bool isMoveLeft = false;
  bool isMoveRight = false;
  final double _speedShip = 0.5;

  @override
  Widget build() {
    return Positioned(
      top: entityX,
      left: entityY,
      child: visible
          ? Transform.rotate(
              angle: _angle,
              child: sprites.first,
            )
          //виджет вращение угла

          : const SizedBox(),
    );
  }

  @override
  void move() {
    if (isMoveLeft) _degree -= 5;
    if (isMoveRight) _degree += 5;
    //вращения вокруг своей оси

    _angle = (_degree * 3.14) / 180;
    //перевод градусов в радианы

    entityX += sin(_degree * 0.0175) * _speedShip;
    entityY -= cos(_degree * 0.0175) * _speedShip;
    //переднее направление

    if (entityX < 0 || entityY < 0) {
      entityX = 0;
      entityY = 0;
    }
    // if (entityY < 0) {
    //   entityY = 0;
    // }
    if (entityX > GlobalVars.screenWidth - 50) {
      entityX = GlobalVars.screenWidth - 50;
    }
    if (entityY > GlobalVars.screenHeight - 50) {
      entityY = GlobalVars.screenHeight - 50;
    }

    isMoveLeft = false;
    isMoveRight = false;
    //чтобы бесконечно не вращался
  }

  @override
  void update() {
    move();
  }
}
