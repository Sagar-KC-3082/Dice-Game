import 'package:animations/screens/animation_types/explicit_animations/animated_builder.dart';
import 'package:animations/screens/animation_types/explicit_animations/animated_builder_2.dart';
import 'package:animations/screens/animation_types/explicit_animations/foo_transition_widget.dart';
import 'package:animations/screens/animation_types/explicit_animations/animated_builder_3.dart';
import 'package:animations/screens/animation_types/explicit_animations/game/dice_screen.dart';
import 'package:animations/screens/animation_types/implicit_animations/animated_foo_widget.dart';
import 'package:animations/screens/animation_types/implicit_animations/tween_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ProviderScope(
      child: MaterialApp(
        title: 'Animation Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const MyHomePage(title: 'Flutter Animation Demo'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFFffd485),
    ));
    return Scaffold(
      backgroundColor: const Color(0xFFffd485),
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: const AnimationList(),
    );
  }
}

class AnimationList extends StatelessWidget {
  const AnimationList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Implicit Animations',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        CustomListTile(
          title: "Animated Foo Widget",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AnimatedFooWidget();
            }));
          },
        ),
        CustomListTile(
          title: "Tween Animation Builder",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const CustomTweenAnimation();
            }));
          },
        ),
        const SizedBox(height: 16),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            'Explicit Animations',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
          ),
        ),
        CustomListTile(
          title: 'Foo Transition Widget',
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const FooTransitionWidget();
            }));
          },
        ),
        CustomListTile(
          title: "Animated Builder",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AnimatedBuilderWidget();
            }));
          },
        ),
        CustomListTile(
          title: "Animated Builder 2",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AnimatedBuilder2();
            }));
          },
        ),
        CustomListTile(
          title: "Animated Builder 3",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const AnimatedBuilder3();
            }));
          },
        ),
        CustomListTile(
          title: "Dice Game",
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return const DiceScreen();
            }));
          },
        ),
      ],
    );
  }
}

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.onTap,
  });

  final String title;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          color: Colors.blue,
        ),
        margin: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
        child: Row(
          children: [Text(title,style: const TextStyle(color: Colors.white),)],
        ),
      ),
    );
  }
}
