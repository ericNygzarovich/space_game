import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:space_game/entities/entity.dart';
import 'package:space_game/utilits/global_vars.dart';

class Player extends Entity {
  double x;
  double y;

  double _angle = 0;
  double _degree = 0;
  bool isMooveLeft = false;
  bool isMooveRight = false;
  final double _speed = 3;

  Player(
    super.spriteName, {
    this.x = 0,
    this.y = 0,
  }) : super(
          x: x,
          y: y,
        );

  @override
  Widget build() {
    return Positioned(
      top: y,
      left: x,
      child: visible
          ? Transform.rotate(
              angle: _angle,
              child: sprites.first,
            )
          : const SizedBox(),
    );
  }

  @override
  void moove() {
    final double radian = (_degree * pi) / 180;

    if (isMooveRight) _degree += 5;
    if (isMooveLeft) _degree -= 5;

    _angle = radian;

    x += sin(_degree * 0.0175) * _speed;
    y -= cos(_degree * 0.0175) * _speed;

    if (x < 0) {
      x = 0;
    }

    if (y < 0) {
      y = 0;
    }

    if (x > GlobalVars.screenWidth - 50) {
      x = GlobalVars.screenWidth - 50;
    }

    if (y > GlobalVars.screenHeight - 50) {
      y = GlobalVars.screenHeight - 50;
    }

    isMooveLeft = false;
    isMooveRight = false;
  }

  @override
  void update() {
    moove();
  }
}
