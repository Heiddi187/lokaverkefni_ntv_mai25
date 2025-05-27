import 'package:flutter/material.dart';
import 'dice_build.dart';
import 'full_house.dart';
import 'score_tracker.dart';
import 'yahtzee_list.dart';

class FourOfaKind extends StatefulWidget {
  const FourOfaKind({super.key});

  @override
  State<FourOfaKind> createState() => _FourOfaKindState();
}

class _FourOfaKindState extends State<FourOfaKind> {
  int score = 0;
  bool showScore = false;
  /*
  void scoreRound(List<int> diceValues) {
    int score = 0;
    bool hasFour = false;

    // Loop through all possible die values (1 to 6)
    for (int i = 1; i <= 6; i++) {
      int count = 0;

      // Count how many times i appears in the dice
      for (int value in diceValues) {
        if (value == i) {
          count++;
        }
      }

      if (count >= 4) {
        hasFour = true;
        break; // we found a three-of-a-kind, no need to keep checking
      }
    }

    // If there's a 3-of-a-kind, score is the total sum of dice
    if (hasFour) {
      for (int value in diceValues) {
        score += value;
      }
    } else {
      score = 0;
    }

    // Now show score
    setState(() {
      showScore = true;
      this.score = score;
    });
  }
  */
  void scoreRound(List<int> diceValues) {
    int score = 0;

    // Sort the dice so that repeated values are next to each other
    List<int> sorted = List.from(diceValues)..sort();

    // Convert to a string like "12344"
    String diceString = sorted.join();

    // Now check for three of the same digit in a row
    if (diceString.contains("1111") ||
        diceString.contains("2222") ||
        diceString.contains("3333") ||
        diceString.contains("4444") ||
        diceString.contains("5555") ||
        diceString.contains("6666")) {
      score = diceValues.reduce((a, b) => a + b); // Sum of all dice
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
