import 'package:space_game/scenes/app_scence.dart';
import 'package:space_game/scenes/game_scene.dart';

bool isFirstStartGame = true;

class GlobalVars {
  static AppScene gameScene = GameScene();
  static double screenWidth = 0;
  static double screenHeight = 0;
}
