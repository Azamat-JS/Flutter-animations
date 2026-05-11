import 'package:flutter/material.dart';

class PulsatingCircleAnimation extends StatefulWidget {
  const PulsatingCircleAnimation({super.key});

  @override
  State<PulsatingCircleAnimation> createState() =>
      _PulsatingCircleAnimationState();
}

class _PulsatingCircleAnimationState extends State<PulsatingCircleAnimation> {
  final double size = 200;

  bool isTop = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pulsating Circle Animation'),
      ),
      body: Center(
        child: AnimatedAlign(
          duration: const Duration(milliseconds: 1000),
          curve: Curves.bounceOut,
          alignment: isTop ? Alignment.topCenter : Alignment.center,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isTop = !isTop;
              });
            },
            child: Container(
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
                boxShadow: [
                  BoxShadow(
                    color: Colors.blue.withOpacity(0.5),
                    blurRadius: size,
                    spreadRadius: size / 2,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
