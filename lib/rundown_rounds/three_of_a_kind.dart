import 'package:flutter/material.dart';
import '../dice/dice_build.dart';
import 'four_of_a_kind.dart';
import '../scoring/score_tracker.dart';
import '../screens/yahtzee_list.dart';

class ThreeOfaKind extends StatefulWidget {
  const ThreeOfaKind({super.key});

  @override
  State<ThreeOfaKind> createState() => _ThreeOfaKindState();
}

class _ThreeOfaKindState extends State<ThreeOfaKind> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int score = 0;
    List<int> sorted = List.from(diceValues)..sort();
    String diceString = sorted.join();
    if (diceString.contains("111") ||
        diceString.contains("222") ||
        diceString.contains("333") ||
        diceString.contains("444") ||
        diceString.contains("555") ||
        diceString.contains("666")) {
      score = diceValues.reduce((a, b) => a + b);
    }
    addScoresToList("3 of a kind", score);
    setState(() {
      showScore = true;
      this.score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Round Three of a kind"),
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
                  MaterialPageRoute(builder: (ctx) => const FourOfaKind()),
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
