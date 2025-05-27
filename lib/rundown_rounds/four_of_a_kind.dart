import 'package:flutter/material.dart';
import '../dice/dice_build.dart';
import 'full_house.dart';
import '../scoring/score_tracker.dart';
import '../screens/yahtzee_list.dart';

class FourOfaKind extends StatefulWidget {
  const FourOfaKind({super.key});

  @override
  State<FourOfaKind> createState() => _FourOfaKindState();
}

class _FourOfaKindState extends State<FourOfaKind> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int score = 0;
    List<int> sorted = List.from(diceValues)..sort();
    String diceString = sorted.join();
    if (diceString.contains("1111") ||
        diceString.contains("2222") ||
        diceString.contains("3333") ||
        diceString.contains("4444") ||
        diceString.contains("5555") ||
        diceString.contains("6666")) {
      score = diceValues.reduce((a, b) => a + b);
    }
    addScoresToList("4 of a kind", score);
    setState(() {
      showScore = true;
      this.score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Round Four of a kind"),
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
                ).push(MaterialPageRoute(builder: (ctx) => const FullHouse()));
              },
              child: const Text("Next Round"),
            ),
          ],
        ],
      ),
    );
  }
}
