import 'package:flutter/material.dart';
import 'package:lokaverkefni/screens/yahtzee_list.dart';
import '../dice/dice_build.dart';
import 'round_fives.dart';
import '../scoring/score_tracker.dart';

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
    addScoresToList("Fours", total);
    setState(() {
      score = total;
      showScore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Round Fours (count 4's)"),
        leading: BackButton(
          onPressed: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (ctx) => YahtzeeList()));
          },
        ),
      ),
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
