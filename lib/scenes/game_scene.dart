import 'package:flutter/material.dart';
import 'package:space_hero/entities/player.dart';
import 'package:space_hero/scenes/app_scene.dart';
import 'package:space_hero/utilities/global_vars.dart';

class GameScene extends AppScene {
  final _player = Player();
  double _startGlobalPositioned = 0;

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
          top: 0,
          left: 0,
          child: SizedBox(
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
            ),
            //отслеживаем нажания при помощью GestureDetector
          ),
        ),
      ],
    );
  }

  @override
  void update() {
    _player.update();
  }

  void _onPanStart(DragStartDetails details) {
    _startGlobalPositioned = details.globalPosition.dx;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double _updateGlobalPositioned = details.globalPosition.dx;

    if (_updateGlobalPositioned > _startGlobalPositioned + 30) {
      _player.isMoveRight = true;
    }
    //даем команду повернутся

    if (_updateGlobalPositioned < _startGlobalPositioned - 30) {
      _player.isMoveLeft = true;
    }
    //даем команду повернутся
  }
}
