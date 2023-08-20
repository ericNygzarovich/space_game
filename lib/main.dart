import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:space_game/game_core/game.dart';
import 'package:space_game/utilits/global_vars.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.landscapeLeft,
    DeviceOrientation.landscapeRight,
  ]).whenComplete(() => runApp(const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    initGame(context);
  }

  void initGame(BuildContext context) {
    GlobalVars.screenHeight = MediaQuery.of(context).size.height;
    GlobalVars.screenWidth = MediaQuery.of(context).size.width;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage('assets/background.png'),
            ),
          ),
          child: const Game(),
        ),
      ),
    );
  }
}
