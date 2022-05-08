bool _running = true;

void startLoop() {
  const double _fps = 50;
  const double _milSecond = 1000;
  const double _updateTime = _fps / _milSecond;
  double _updates = 0;

  Stopwatch _loopWatch = Stopwatch();
  _loopWatch.start();

  Stopwatch _timeWatch = Stopwatch();
  _timeWatch.start();

  while (_running) {
    if (_loopWatch.elapsedMilliseconds > _updateTime) {
      _updates++;
      _loopWatch.reset();
    }
  }
  if (_loopWatch.elapsedMilliseconds > _milSecond) {
    print('${DateTime.now()} FPS: $_updates');
    _updates = 0;
    _loopWatch.reset();
  }
}
