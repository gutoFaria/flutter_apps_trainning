import 'package:flame/flame.dart';
import 'package:flutter/material.dart';
import 'package:platform_game/blocs/score/score_bloc.dart';
import 'package:platform_game/flame_layer/flame_layer.dart';
import 'package:platform_game/flutter_layer/flutter_layer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Flame.device.setLandscape();
  Flame.device.fullScreen();
  runApp(const PinkieApp());
}

class PinkieApp extends StatelessWidget {
  const PinkieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            foregroundColor: Colors.orange,
            backgroundColor: Colors.blueGrey,
            textStyle: const TextStyle(
              fontSize: 24
            )
          )
        ),
          textTheme: const TextTheme(
              bodyText2: TextStyle(color: Colors.orange, fontSize: 24))),
          
      home: BlocProvider<ScoreBloc>(
        create: (context) => ScoreBloc(),
        child: Scaffold(
          body: Stack(
            children: const [FlameLayer(), FlutterLayer()],
          ),
        ),
      ),
    );
  }
}
