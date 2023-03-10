import 'package:flutter/material.dart';

class Card2 extends StatelessWidget {
  const Card2({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: const BoxConstraints.expand(
          width: 350,
          height: 450
        ),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/card2.jpg'),
            fit: BoxFit.cover
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10)
          )
        ),
        child: Column(
          children: [],
        ),
      )
    );
  }
}