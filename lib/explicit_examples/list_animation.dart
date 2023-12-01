import 'package:flutter/material.dart';

class ListAnimation extends StatefulWidget {
  const ListAnimation({super.key});

  @override
  State<ListAnimation> createState() => _ListAnimationState();
}

class _ListAnimationState extends State<ListAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late List<Animation<Offset>> listTileAnimation = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    listTileAnimation = List.generate(
      5,
      (index) => Tween(begin: const Offset(1, 0), end: Offset.zero).animate(
        CurvedAnimation(
          parent: animationController,
          curve: Interval(index / 5, 1),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Animation'),
      ),
      body: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return SlideTransition(
            position: listTileAnimation[index],
            child: ListTile(
              title: Text('Hello World, Sunny. ${index.toString()}'),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          animationController.forward();
        },
        child: const Icon(Icons.done),
      ),
    );
  }
}
