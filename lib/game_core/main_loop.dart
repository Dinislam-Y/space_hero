import 'dart:isolate';

bool _running = true;

void mainLoop(SendPort sendPort) {
  //sendPort - для того, чтобы отправлять данные в главный isolate

  const double _fps = 50;
  const double _milSecond = 1000;
  const double _updateTime = _fps / _milSecond;

  Stopwatch _loopWatch = Stopwatch();
  _loopWatch.start();

  Stopwatch _timeWatch = Stopwatch();
  _timeWatch.start();

  double _updates = 0;

  while (_running) {
    if (_loopWatch.elapsedMilliseconds >= _updateTime) {
      _updates++;
      _loopWatch.reset();

      sendPort.send(true);
      //передаем, что нужно обновить свои виджеты
    }
  }

  if (_loopWatch.elapsedMilliseconds > _milSecond) {
    _updates = 0;
    _loopWatch.reset();
  }
}
