/*
import 'package:flutter/material.dart';
import 'dice_build.dart'; // make sure this path is correct

int score = 0;
bool showScore = false;

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
*/
import 'package:flutter/material.dart';
import 'dice_build.dart';
import 'round_fives.dart'; // or next round

class RoundFours extends StatefulWidget {
  const RoundFours({super.key});

  @override
  State<RoundFours> createState() => _RoundFoursState();
}

class _RoundFoursState extends State<RoundFours> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int total = 0;
    for (var value in diceValues) {
      if (value == 4) {
        total += 4;
      }
    }
    setState(() {
      score = total;
      showScore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Round Fours (count 4's)")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          DiceSet(onFinished: scoreRound),
          const SizedBox(height: 20),
          if (showScore) ...[
            Text(
              "You scored: $score points",
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (ctx) => const RoundFives()));
              },
              child: const Text("Next Round"),
            ),
          ],
        ],
      ),
    );
  }
}
