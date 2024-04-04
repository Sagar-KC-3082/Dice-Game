import 'dart:math';

import 'package:flutter/material.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 4/1/2024, Monday

class AnimatedBuilder3 extends StatefulWidget {
  const AnimatedBuilder3({super.key});

  @override
  State<AnimatedBuilder3> createState() => _AnimatedBuilder3State();
}

class _AnimatedBuilder3State extends State<AnimatedBuilder3>
    with SingleTickerProviderStateMixin {
  late AnimationController _counterClockwiseAnimationController;
  late Animation _counterClockwiseAnimation;

  @override
  void initState() {
    _counterClockwiseAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _counterClockwiseAnimation = Tween<double>(
      begin: 0,
      end: -pi / 2,
    ).animate(
      CurvedAnimation(
        parent: _counterClockwiseAnimationController,
        curve: Curves.bounceOut,
      ),
    );
    _counterClockwiseAnimationController.forward();
    super.initState();
  }

  @override
  void dispose() {
    _counterClockwiseAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Animated Builder 3'),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
                animation: _counterClockwiseAnimationController,
                builder: (context, child) {
                  return Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateZ(_counterClockwiseAnimation.value),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipPath(
                          clipper: const HalfCircleClipper(
                            isCircleLeft: true,
                          ),
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.blue,
                          ),
                        ),
                        ClipPath(
                          clipper: const HalfCircleClipper(
                            isCircleLeft: false,
                          ),
                          child: Container(
                            height: 100,
                            width: 100,
                            color: Colors.amber,
                          ),
                        )
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}

class HalfCircleClipper extends CustomClipper<Path> {
  final bool isCircleLeft;

  const HalfCircleClipper({
    required this.isCircleLeft,
  });

  @override
  Path getClip(Size size) {
    final path = Path();
    late Offset offset;
    late bool isClockwise;

    if (isCircleLeft) {
      path.moveTo(size.width, 0);
      offset = Offset(size.width, size.height);
      isClockwise = false;
    } else {
      offset = Offset(0, size.height);
      isClockwise = true;
    }
    path.arcToPoint(
      offset,
      clockwise: isClockwise,
      radius: Radius.elliptical(size.width / 2, size.height / 2),
    );
    path.close;
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
