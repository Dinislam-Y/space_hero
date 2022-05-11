import 'package:flutter/material.dart';
import 'package:space_hero/entities/bullet.dart';
import 'package:space_hero/entities/player.dart';
import 'package:space_hero/scenes/app_scene.dart';
import 'package:space_hero/utilities/global_vars.dart';

class GameScene extends AppScene {
  final _player = Player();
  double _startGlobalPositioned = 0;
  final List<Bullet> _listBullets = [];
  final List<Widget> _listWidgets = [];

  @override
  Widget buildScene() {
    return Stack(
      children: [
        _player.build(),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
            ),
            //отслеживаем нажания при помощью GestureDetector
          ),
        ),
        Positioned(
          top: 0,
          left: GlobalVars.screenWidth / 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight / 2,
            child: GestureDetector(
              onTap: _onAcceleration,
            ),
            //отслеживаем нажатия при помощью GestureDetector
          ),
        ),
        Positioned(
          top: GlobalVars.screenHeight / 2,
          left: GlobalVars.screenWidth / 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.green),
            ),
            width: GlobalVars.screenWidth / 2,
            height: GlobalVars.screenHeight / 2,
            child: GestureDetector(
              onTap: _onShoot,
            ),
            //отслеживаем нажатия при помощью GestureDetector
          ),
        ),
        Stack(children: _listWidgets),
      ],
    );
  }

  @override
  void update() {
    _player.update();
    _listWidgets.clear();

    _listBullets.removeWhere((element) => !element.visible);
    //удалить все невидимые объекты

    _listBullets.forEach((element) {
      _listWidgets.add(element.build());
      element.update();
    });
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

  void _onAcceleration() {
    _player.isAcceleration = _player.isAcceleration ? false : true;
  }

  void _onShoot() {
    _listBullets.add(
      Bullet(
        playAngle: _player.getAngle,
        playerX: _player.entityX,
        playerY: _player.entityY,
      ),
    );
  }
}
