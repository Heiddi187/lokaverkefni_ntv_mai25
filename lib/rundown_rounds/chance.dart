import 'package:flutter/material.dart';
import '../dice/dice_build.dart';
import '../scoring/score_tracker.dart';
import '../screens/final_tally_screen.dart';
import '../screens/yahtzee_list.dart';

class ChanceRound extends StatefulWidget {
  const ChanceRound({super.key});

  @override
  State<ChanceRound> createState() => _ChanceRoundState();
}

class _ChanceRoundState extends State<ChanceRound> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int total = 0;
    for (var value in diceValues) {
      total += value;
    }
    addScoresToList("Chance", total);
    setState(() {
      score = total;
      showScore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Round Chance (highest total)"),
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
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const FinalScoreTally()),
                );
              },
              child: const Text("Next Round"),
            ),
          ],
        ],
      ),
    );
  }
}
