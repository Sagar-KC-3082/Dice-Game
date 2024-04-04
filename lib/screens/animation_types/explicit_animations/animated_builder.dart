/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 3/25/2024, Monday

import 'package:flutter/material.dart';

class AnimatedBuilderWidget extends StatefulWidget {
  const AnimatedBuilderWidget({super.key});

  @override
  State<AnimatedBuilderWidget> createState() => _AnimatedBuilderWidgetState();
}

class _AnimatedBuilderWidgetState extends State<AnimatedBuilderWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..forward();
    _animationController.addListener(() {
      if (_animationController.status == AnimationStatus.completed) {
        setState(() {
          _showContainer = true;
        });
      } else {
        setState(() {
          _showContainer = false;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  bool _showContainer = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Animated Builder '),
      ),
      body: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(
            "assets/images/stars.jpg",
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            fit: BoxFit.fill,
          ),
          _showContainer
              ? InkWell(
                  onTap: () {
                    _animationController.reset();
                    _animationController.forward();
                  },
                  child: Container(
                    height: 1000,
                    width: 1000,
                    color: Colors.red,
                  ),
                )
              : const SizedBox(),
          Image.asset(
            "assets/images/ufo.png",
            height: 200,
            width: 200,
            fit: BoxFit.fill,
          ),
          AnimatedBuilder(
              animation: _animationController,
              builder: (context, _) {
                print('hahha : ${_animationController.value}');
                return ClipPath(
                    clipper: const BeamClipper(),
                    child: Container(
                      height: 1000,
                      decoration: BoxDecoration(
                        gradient: RadialGradient(
                          radius: 1.5,
                          colors: const [
                            Colors.yellow,
                            Colors.transparent,
                          ],
                          stops: [0, _animationController.value],
                        ),
                      ),
                    ));
              }),
        ],
      ),
    );
  }
}

class BeamClipper extends CustomClipper<Path> {
  const BeamClipper();

  @override
  getClip(Size size) {
    return Path()
      ..lineTo(size.width / 2, size.height / 2)
      ..lineTo(size.width, size.height)
      ..lineTo(0, size.height)
      ..lineTo(size.width / 2, size.height / 2)
      ..close();
  }

  /// Return false always because we always clip the same area.
  @override
  bool shouldReclip(CustomClipper oldClipper) => false;
}
