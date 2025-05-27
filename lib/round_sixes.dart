import 'package:flutter/material.dart';
import 'package:lokaverkefni/yahtzee_list.dart';
import 'dice_build.dart';
import 'three_of_a_kind.dart';
import 'score_tracker.dart';
import 'yahtzee_list.dart';

class RoundSixes extends StatefulWidget {
  const RoundSixes({super.key});

  @override
  State<RoundSixes> createState() => _RoundSixesState();
}

class _RoundSixesState extends State<RoundSixes> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int total = 0;
    for (var value in diceValues) {
      if (value == 6) {
        total += 6;
      }
    }
    addScoresToList("Sixes", total);
    setState(() {
      score = total;
      showScore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Round Sixes (count 6's)"),
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
                  MaterialPageRoute(builder: (ctx) => const ThreeOfaKind()),
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
