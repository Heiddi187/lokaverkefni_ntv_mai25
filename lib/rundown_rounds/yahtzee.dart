import 'package:flutter/material.dart';
import '../dice/dice_build.dart';
import '../scoring/score_tracker.dart';
import 'chance.dart';
import '../screens/yahtzee_list.dart';

class FullYahtzee extends StatefulWidget {
  const FullYahtzee({super.key});

  @override
  State<FullYahtzee> createState() => _FullYahtzeeState();
}

class _FullYahtzeeState extends State<FullYahtzee> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int score = 0;
    List<int> sorted = List.from(diceValues)..sort();
    String diceString = sorted.join();
    if (diceString.contains("11111") ||
        diceString.contains("22221") ||
        diceString.contains("33333") ||
        diceString.contains("44444") ||
        diceString.contains("55555") ||
        diceString.contains("66666")) {
      score = 50;
    }
    addScoresToList("Yahtzee", score);
    setState(() {
      showScore = true;
      this.score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Yahtzee (Five of a kind)"),
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
                  MaterialPageRoute(builder: (ctx) => const ChanceRound()),
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
