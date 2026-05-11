import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late List<Animation<Offset>> positionAnimations;
  final itemCount = 5;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    positionAnimations = List.generate(
        itemCount,
        (index) => Tween(begin: const Offset(-1, 0), end: Offset.zero)
            .animate(controller));

    Tween(begin: const Offset(-1, 0), end: Offset.zero).animate(controller);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: positionAnimations[index],
            child: ListTile(
              title: Text('Salom Dunyo!, Azamat. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.forward();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
