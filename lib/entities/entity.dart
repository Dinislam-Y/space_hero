import 'package:flutter/material.dart';

abstract class Entity {
  double entityX;
  double entityY;

  String spriteName;

  bool visible = true;
  //для отрисовки сущностей

  List sprites = [];

  Entity(
    this.spriteName,
    //передаем имя
    [
    this.entityX = 0,
    this.entityY = 0,
  ]) {
    for (var i = 0; i < 4; i++) {
      sprites.add(Image.asset('assets/$spriteName$i.png'));
    }
  }

  void update();

  void move();

  Widget build();
}
