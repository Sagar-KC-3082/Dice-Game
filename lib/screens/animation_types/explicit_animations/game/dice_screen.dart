import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'individual_dice.dart';

/// @author: Sagar K.C.
/// @email: sagar.kc@fonepay.com
/// @created_at: 4/2/2024, Tuesday

final isAnimationPlayingProvider =
    StateProvider.autoDispose<bool>((ref) => true);

class DiceScreen extends ConsumerWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: const Color(0xFFffd485),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Spacer(),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IndividualDiceWidget(durationInMilliseconds: 1200),
              IndividualDiceWidget(durationInMilliseconds: 800),
              IndividualDiceWidget(durationInMilliseconds: 1400),
            ],
          ),
          const SizedBox(height: 80),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              IndividualDiceWidget(durationInMilliseconds: 600),
              IndividualDiceWidget(durationInMilliseconds: 900),
              IndividualDiceWidget(durationInMilliseconds: 1300),
            ],
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  ref.read(isAnimationPlayingProvider.notifier).state = false;
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.red,
                  ),
                  child: const Center(
                    child: Text(
                      'Pause',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 20,
              ),
              InkWell(
                onTap: () {
                  ref.read(isAnimationPlayingProvider.notifier).state = true;
                },
                child: Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.green,
                  ),
                  child: const Center(
                    child: Text(
                      'Resume',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
