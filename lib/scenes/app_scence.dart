import 'package:flutter/material.dart';

abstract class AppScene {
  ///this method render yuor scene
  Widget buidlScene();

  ///this method make mathematical calculations for scene
  void update();
}
