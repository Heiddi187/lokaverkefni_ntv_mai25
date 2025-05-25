import 'package:flutter/material.dart';
import 'dice_build.dart';
import 'yahtzee_list.dart';
import 'chance.dart';

class FullYahtzee extends StatefulWidget {
  const FullYahtzee({super.key});

  @override
  State<FullYahtzee> createState() => _FullYahtzeeState();
}

class _FullYahtzeeState extends State<FullYahtzee> {
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
    if (diceString.contains("11111") ||
        diceString.contains("22221") ||
        diceString.contains("33333") ||
        diceString.contains("44444") ||
        diceString.contains("55555") ||
        diceString.contains("66666")) {
      score = 50;
    }

    setState(() {
      showScore = true;
      this.score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Yahtzee (Five of a kind)")),
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
