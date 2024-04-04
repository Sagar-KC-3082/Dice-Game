import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'dice_screen.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 4/2/2024, Tuesday

class IndividualDiceWidget extends ConsumerStatefulWidget {
  const IndividualDiceWidget({
    super.key,
    required this.durationInMilliseconds,
  });

  final int durationInMilliseconds;

  @override
  ConsumerState<IndividualDiceWidget> createState() =>
      _IndividualDiceWidgetState();
}

class _IndividualDiceWidgetState extends ConsumerState<IndividualDiceWidget>
    with TickerProviderStateMixin {
  final double _heightAndWidth = 50;
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  @override
  void initState() {
    _xController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.durationInMilliseconds));
    _yController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.durationInMilliseconds + 1600));
    _zController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: widget.durationInMilliseconds + 800));

    _xController.repeat();
    _yController.repeat();
    _zController.repeat();
    super.initState();
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  final List<String> _indexList =
      List.generate(6, (index) => (index + 1).toString());

  @override
  Widget build(BuildContext context) {
    ref.listen(isAnimationPlayingProvider, (previous, next) {
      if (!next) {
        _xController.stop();
        _yController.stop();
        _zController.stop();

        _xController.animateTo(1);
        _yController.animateTo(1);
        _zController.animateTo(1);

        setState(() {
          _indexList.shuffle();
        });
      } else {
        _xController.repeat();
        _yController.repeat();
        _zController.repeat();
      }
    });

    return AnimatedBuilder(
        animation: Listenable.merge([_xController, _yController, _zController]),
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..rotateX(_xController.value * pi * 2)
              ..rotateY(_yController.value * pi * 2)
              ..rotateZ(_zController.value * pi * 2),
            child: Stack(
              children: [
                //back
                Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..translate(0.0, 0.0, -_heightAndWidth),
                  child: _getContainer(Colors.purple, _indexList[0]),
                ),

                //left
                Transform(
                  alignment: Alignment.centerLeft,
                  transform: Matrix4.identity()..rotateY(pi / 2),
                  child: _getContainer(Colors.red, _indexList[1]),
                ),

                //right
                Transform(
                  alignment: Alignment.centerRight,
                  transform: Matrix4.identity()..rotateY(-pi / 2),
                  child: _getContainer(Colors.blue, _indexList[2]),
                ),

                //front
                _getContainer(Colors.green, _indexList[3]),

                //top
                Transform(
                  alignment: Alignment.topCenter,
                  transform: Matrix4.identity()..rotateX(-pi / 2),
                  child: _getContainer(Colors.orange, _indexList[4]),
                ),

                //bottom
                Transform(
                  alignment: Alignment.bottomCenter,
                  transform: Matrix4.identity()..rotateX(pi / 2),
                  child: _getContainer(Colors.brown, _indexList[5]),
                ),
              ],
            ),
          );
        });
  }

  Container _getContainer(Color color, String imageIndex) {
    return Container(
      height: _heightAndWidth,
      width: _heightAndWidth,
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
              image: AssetImage('assets/images/0$imageIndex 2.png'))),
    );
  }
}
