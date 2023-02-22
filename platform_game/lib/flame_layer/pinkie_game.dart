import 'package:flame/components.dart';
import 'package:flame/game.dart';
import 'package:platform_game/actors/pinkie.dart';
import 'package:platform_game/actors/treasure.dart';

class PinkieGame extends FlameGame with HasCollisionDetection{

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    camera.viewport = FixedResolutionViewport(Vector2(1400,784));
    
    add(SpriteComponent(sprite: await loadSprite('background.png'))..size=size);
    add(Pinkie());
    add(Treasure());
  }
}