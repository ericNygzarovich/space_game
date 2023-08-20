import 'dart:isolate';

import 'package:flutter/material.dart';
import 'package:space_game/game_core/main_loop.dart';
import 'package:space_game/utilits/global_vars.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  late Size size;
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
        GlobalVars.gameScene.update();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return GlobalVars.gameScene.buidlScene();
  }

  @override
  void dispose() {
    super.dispose();
    _receivePort.close();
    _isolateLoop.kill();
  }
}
