import 'package:flutter/material.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 3/18/2024, Monday

class FooTransitionWidget extends StatefulWidget {
  const FooTransitionWidget({super.key});

  @override
  State<FooTransitionWidget> createState() =>
      _CustomExplicitAnimationState();
}

class _CustomExplicitAnimationState
    extends State<FooTransitionWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..repeat();
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Foo Transition Widget'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              alignment: Alignment.center,
              turns: _animationController,
              child: Image.asset(
                "assets/images/sun.png",
                height: 200,
                width: 200,
              ),
            ),
            MaterialButton(
              onPressed: () {
                _animationController.isAnimating
                    ? _animationController.stop()
                    : _animationController.repeat();
              },
              color: Colors.blue,
              child: const Text(
                "Play/Pause",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
