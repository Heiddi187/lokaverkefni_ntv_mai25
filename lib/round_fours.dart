import 'package:flutter/material.dart';
import 'dice_build.dart'; // make sure this path is correct

class RoundFours extends StatelessWidget {
  const RoundFours({super.key});

  void scoreRound(List<int> diceValues) {
    // Count all 4s and calculate score
    int score = 0;
    for (var value in diceValues) {
      if (value == 4) {
        score += 4;
      }
    }

    // Show score using a simple dialog
    print("Score for Fours: $score");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Round Four (count 4's)")),
      body: Center(child: DiceSet(onFinished: scoreRound)),
    );
  }
}
