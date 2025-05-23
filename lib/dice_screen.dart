import 'package:flutter/material.dart';
import 'dice_build.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  void endOfRound(List<int> diceValues) {
    // This is where you can add your score logic for the round
    print("End of round values: $diceValues");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Round 1: Aces')),
      body: Center(child: DiceSet(onFinished: endOfRound)),
    );
  }
}
