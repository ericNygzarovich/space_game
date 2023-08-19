bool _running = true;

void statrtLoop() {
  const double fps = 50;
  const double second = 1000;
  const double updateDime = second / fps;
  double quantityUpdates = 0;

  Stopwatch loopWatch = Stopwatch()..start();
  Stopwatch timerWatch = Stopwatch()..start();

  while (_running) {
    if (loopWatch.elapsedMilliseconds > updateDime) {
      quantityUpdates++;
      loopWatch.reset();
    }

    if (timerWatch.elapsedMilliseconds == second) {
      quantityUpdates = 0;
      timerWatch.reset();
      print('${DateTime.now()} FPS: $quantityUpdates');
    }
  }
}

void stopLoop() {
  _running = false;
}
