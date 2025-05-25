import 'package:flutter/material.dart';
import 'dice_build.dart';
import 'yahtzee_list.dart';
import 'four_of_a_kind.dart';

class ThreeOfaKind extends StatefulWidget {
  const ThreeOfaKind({super.key});

  @override
  State<ThreeOfaKind> createState() => _ThreeOfaKindState();
}

class _ThreeOfaKindState extends State<ThreeOfaKind> {
  int score = 0;
  bool showScore = false;
  /*
  void scoreRound(List<int> diceValues) {
    int score = 0;
    bool hasThree = false;

    // Loop through all possible die values (1 to 6)
    for (int i = 1; i <= 6; i++) {
      int count = 0;

      // Count how many times i appears in the dice
      for (int value in diceValues) {
        if (value == i) {
          count++;
        }
      }

      if (count >= 3) {
        hasThree = true;
        break; // we found a three-of-a-kind, no need to keep checking
      }
    }

    // If there's a 3-of-a-kind, score is the total sum of dice
    if (hasThree) {
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
    if (diceString.contains("111") ||
        diceString.contains("222") ||
        diceString.contains("333") ||
        diceString.contains("444") ||
        diceString.contains("555") ||
        diceString.contains("666")) {
      score = diceValues.reduce((a, b) => a + b); // Sum of all dice
    }

    setState(() {
      showScore = true;
      this.score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Round Three of a kind")),
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
