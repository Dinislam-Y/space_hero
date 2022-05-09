import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:space_hero/game_core/main_loop.dart';
import 'package:space_hero/utilits/common_vars.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  double axisY = 150;
  double axisX = 150;

  late ReceivePort _receivePort;
  //получаем данные, что нам нужно обновиться

  late Isolate _isolateLoop;

  void startIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);

    _receivePort.listen((message) {
      //получаем данные из "isolateLoop", подключаем слушатель "listen"

      setState(() {
        axisX++;

        if (axisX > 500) {
          axisX = 0;
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (isFirstStartGame) {
      startIsolateLoop();
      //если игра была запущена впервые - запускаем изолят
      isFirstStartGame = false;
    }

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: axisY,
            left: axisX,
            child: const Text('123'),
          ),
        ],
      ),
    );
  }
}
