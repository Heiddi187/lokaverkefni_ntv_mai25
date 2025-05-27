import 'package:flutter/material.dart';
import 'package:lokaverkefni/round_fours.dart';
import 'dice_build.dart';
import 'score_tracker.dart';
import 'yahtzee_list.dart';

class RoundThrees extends StatefulWidget {
  const RoundThrees({super.key});

  @override
  State<RoundThrees> createState() => _RoundThreesState();
}

class _RoundThreesState extends State<RoundThrees> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int total = 0;
    for (var value in diceValues) {
      if (value == 3) {
        total += 3;
      }
    }
    addScoresToList("Threes", total);
    setState(() {
      score = total;
      showScore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Threes Round (count 3's)"),
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
                ).push(MaterialPageRoute(builder: (ctx) => const RoundFours()));
              },
              child: const Text("Next Round"),
            ),
          ],
        ],
      ),
    );
  }
}
