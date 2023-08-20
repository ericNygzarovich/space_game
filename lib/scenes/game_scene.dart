import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_game/scenes/app_scence.dart';
import 'package:space_game/utilits/global_vars.dart';

import '../entities/player.dart';

class GameScene extends AppScene {
  late Player _player;
  double? _startGlobalPosition;

  GameScene() {
    _player = Player('player', x: 0, y: 0);
    _startGlobalPosition = 0;
  }

  @override
  void update() {
    _player.update();
  }

  void _onPanStart(DragStartDetails details) {
    _startGlobalPosition = details.globalPosition.dx;
  }

  void _onPanUpdate(DragUpdateDetails details) {
    double updateGlobalPosition = details.globalPosition.dx;

    if (updateGlobalPosition > _startGlobalPosition! + 30) {
      _player.isMooveRight = true;
    }

    if (updateGlobalPosition < _startGlobalPosition! - 30) {
      _player.isMooveLeft = true;
    }
  }

  @override
  Widget buidlScene() {
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
            height: GlobalVars.screenHeight,
            width: GlobalVars.screenWidth / 2,
            child: GestureDetector(
              onPanStart: _onPanStart,
              onPanUpdate: _onPanUpdate,
            ),
          ),
        )
      ],
    );
  }
}
