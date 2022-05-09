import 'package:flutter/material.dart';
import 'package:space_hero/entities/player.dart';
import 'package:space_hero/scenes/app_scene.dart';

class GameScene extends AppScene {
  final _player = Player();

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
      ],
    );
  }

  @override
  void update() {
    _player.update();
  }
}
