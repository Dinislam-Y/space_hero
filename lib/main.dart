import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //настраиваем правильную инициализации виджета

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
    //перевернули экран на альбомный режим
  ]).whenComplete(() {
    //whenComplete - даст MaterialApp сработает только тогда, когда перевернется экран

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.bottom]);
    // позволяет на весь экран

    runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false, //убираем флажок справа наверху
      home: Scaffold(
        body: Center(
          child: Text('Start'),
        ),
      ),
    );
  }
}
