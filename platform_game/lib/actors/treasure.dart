import 'package:flame/components.dart';

class Treasure extends SpriteComponent with HasGameRef{
  Treasure() : super(position: Vector2(300,100), size: Vector2.all(100)){
    debugMode = true;
  }

  @override
  Future<void> onLoad() async{
    await super.onLoad();
    sprite = await gameRef.loadSprite('treasure.png');
  }

  @override
  void update(double dt){
    //x +=1;
    //y+= 1;
  }
}