import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:space_hero/game_core/main_loop.dart';
import 'package:space_hero/utilities/global_vars.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({Key? key}) : super(key: key);

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  final ReceivePort _receivePort = ReceivePort();
  //получаем данные, что нам нужно обновиться

  late final Isolate _isolateLoop;

  void _startIsolateLoop() async {
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);

    _receivePort.listen((message) {
      //получаем данные из "isolateLoop", подключаем слушатель "listen"

      GlobalVars.currentScene.update();
      //обновляем 50 раз в секунду

      setState(() {});
    });
  }

  @override
  void initState() {
    _startIsolateLoop();
    super.initState();
  }

  @override
  void dispose() {
    _receivePort.close();
    _isolateLoop.kill();
    super.dispose();
  }
  //закрываем порт

  @override
  Widget build(BuildContext context) {
    return GlobalVars.currentScene.buildScene();
  }
}
