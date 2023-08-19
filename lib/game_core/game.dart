import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:space_game/game_core/main_loop.dart';
import 'package:space_game/utilits/common_vars.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late Size size;
  late double x1, x2, y1, y2;
  late ReceivePort _receivePort;
  late Isolate _isolateLoop;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    size = MediaQuery.of(context).size;
    x1 = size.width - 60;
    y1 = size.height - 50;

    x2 = 0;
    y2 = 0;

    if (isFirstStartGame) {
      _statrIsolateLoop();
      isFirstStartGame = false;
    }
  }

  Future<void> _statrIsolateLoop() async {
    _receivePort = ReceivePort();
    _isolateLoop = await Isolate.spawn(mainLoop, _receivePort.sendPort);
    _receivePort.listen((message) {
      setState(() {
        double a, b;
        (a, b) = _changeCordinates(x1, y1);

        x1 = a;
        y1 = b;

        (a, b) = _changeCordinates(x2, y2);

        x2 = a;
        y2 = b;
      });
    });
  }

  (double, double) _changeCordinates(double x, double y) {
    if (y == 0 && x != size.width - 60) {
      x++;
    }

    if (y == size.height - 50 && x > 10) {
      x--;
    }

    if (x == size.width - 60 && y < size.height - 50) {
      y++;
    }

    if (x == 10 && y > 0) {
      y--;
    }

    return (x, y);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: y1,
            left: x1,
            child: SizedBox(
              height: 50,
              width: 50,
              child: ColoredBox(
                color: Colors.pink[800]!,
              ),
            )),
        Positioned(
          top: y2,
          left: x2,
          child: const SizedBox(
            height: 50,
            width: 50,
            child: ColoredBox(
              color: Colors.purple,
            ),
          ),
        ),
      ],
    );
  }
}
