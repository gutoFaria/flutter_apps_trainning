import 'package:flutter/material.dart';
import 'package:funrecipe/funrecipe_theme.dart';

class Card1 extends StatelessWidget {
  const Card1({super.key});

  final String category = 'Editor\'s Choice';
  final String title = 'The Art of Dough';
  final String description = 'Learn to make the perfect bread';
  final String chef = 'Ray Wenderlich';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.all(16),
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450,
        ),
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/card1.jpg'), fit: BoxFit.cover),
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Stack(
          children: [
            Text(
              category,
              style: FunrecipeTheme.darkTextTheme.bodyText1,
            ),
            Positioned(
              top:20,
              child: Text(
                title,
                style: FunrecipeTheme.darkTextTheme.headline5,
              )
            ),
            Positioned(
              bottom: 30,
              right: 0,
              child: Text(
                description,
                style:const TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
            Positioned(
              bottom: 10,
              right: 0,
              child: Text(
                chef,
                style:const TextStyle(color:Colors.black,fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
