import 'package:flutter/material.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 3/18/2024, Monday

class AnimatedFooWidget extends StatefulWidget {
  const AnimatedFooWidget({super.key});

  @override
  State<AnimatedFooWidget> createState() => _AnimatedFooWidgetState();
}

class _AnimatedFooWidgetState extends State<AnimatedFooWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Implicit Animation'),
      ),
      body: Center(
        child: ListView(
          children: [
            AnimatedContainer(
              duration: const Duration(seconds: 1),
              margin: EdgeInsets.symmetric(
                vertical: _isSelected ? 32 : 8,
                horizontal: _isSelected ? 32 : 8,
              ),
              height: _isSelected ? 300 : 120,
              width: _isSelected ? 300 : 120,
              decoration: BoxDecoration(
                color: _isSelected ? Colors.red : Colors.green,
                borderRadius: BorderRadius.circular(8),
              ),
              child: AnimatedContainer(
                duration: const Duration(seconds: 1),
                margin: EdgeInsets.symmetric(
                  vertical: _isSelected ? 32 : 8,
                  horizontal: _isSelected ? 32 : 8,
                ),
                height: _isSelected ? 30 : 12,
                width: _isSelected ? 30 : 12,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _isSelected ? Colors.pink : Colors.amber,
                ),
              ),
            ),


            MaterialButton(
              onPressed: () {
                setState(() {
                  _isSelected = !_isSelected;
                });
              },
              color: Colors.blue,
              child: const Text(
                "Animate Button",
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
