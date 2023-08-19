import 'dart:isolate';

bool _running = true;

void mainLoop(SendPort port) async {
  const double fps = 100;
  const double second = 1000;
  const double updateDime = second / fps;

  Stopwatch loopWatch = Stopwatch()..start();
  Stopwatch timerWatch = Stopwatch()..start();

  while (_running) {
    if (loopWatch.elapsedMilliseconds > updateDime) {
      loopWatch.reset();
      port.send(true);
    }

    if (timerWatch.elapsedMilliseconds == second) {
      timerWatch.reset();
    }
  }
}

void stopMainLoop() {
  _running = false;
}
