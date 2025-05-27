import 'package:flutter/material.dart';
import 'package:lokaverkefni/rundown_rounds/round_threes.dart';
import '../dice/dice_build.dart';
import '../scoring/score_tracker.dart';
import '../screens/yahtzee_list.dart';

class RoundTwos extends StatefulWidget {
  const RoundTwos({super.key});

  @override
  State<RoundTwos> createState() => _RoundTwosState();
}

class _RoundTwosState extends State<RoundTwos> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int total = 0;
    for (int value in diceValues) {
      if (value == 2) {
        total += 2;
      }
    }
    addScoresToList("Twos", total);
    setState(() {
      score = total;
      showScore = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Twos Round (count 2's)"),
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
                  MaterialPageRoute(builder: (ctx) => const RoundThrees()),
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
