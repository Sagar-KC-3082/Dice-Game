import 'package:flutter/material.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 3/18/2024, Monday

class CustomTweenAnimation extends StatelessWidget {
  const CustomTweenAnimation({super.key});

  static final _colorTween = ColorTween(begin: Colors.white, end: Colors.red);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Twin Animation'),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 16),
            Expanded(
              child: TweenAnimationBuilder(
                  tween: _colorTween,
                  duration: const Duration(seconds: 5),
                  child: Image.asset(
                    'assets/images/sun.png',
                    height: 200,
                    width: 200,
                  ),
                  builder: (context, value, child) {
                    return ColorFiltered(
                      colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                      child: child,
                    );
                  }),
            ),
            const Expanded(child: ComplicatedCustomTweenAnimation()),
          ],
        ),
      ),
    );
  }
}

class ComplicatedCustomTweenAnimation extends StatefulWidget {
  const ComplicatedCustomTweenAnimation({super.key});

  @override
  State<ComplicatedCustomTweenAnimation> createState() =>
      _ComplicatedCustomTweenAnimationState();
}

class _ComplicatedCustomTweenAnimationState
    extends State<ComplicatedCustomTweenAnimation> {
  double _sliderValue = 0;
  Color? _newColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TweenAnimationBuilder(
            tween: ColorTween(begin: Colors.white, end: _newColor),
            duration: const Duration(seconds: 1),
            child: Image.asset(
              'assets/images/sun.png',
              height: 200,
              width: 200,
            ),
            builder: (context, value, child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                child: child,
              );
            }),
        const SizedBox(height: 16),
        Slider.adaptive(
            value: _sliderValue,
            onChanged: (value) {
              setState(() {
                _sliderValue = value;
                _newColor = Color.lerp(Colors.white, Colors.red, value);
              });
            })
      ],
    );
  }
}
