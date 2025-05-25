import 'package:flutter/material.dart';
import 'package:lokaverkefni/small_straight.dart';
import 'dice_build.dart';
import 'yahtzee_list.dart';

class FullHouse extends StatefulWidget {
  const FullHouse({super.key});

  @override
  State<FullHouse> createState() => _FullHouseState();
}

class _FullHouseState extends State<FullHouse> {
  int score = 0;
  bool showScore = false;

  void scoreRound(List<int> diceValues) {
    int score = 0;
    bool hasThree = false;
    bool hasTwo = false;

    // Loop through all possible die values (1 to 6)
    for (int i = 1; i <= 6; i++) {
      int count = 0;

      // Count how many times i appears in the dice
      for (int value in diceValues) {
        if (value == i) {
          count++;
        }
      }

      if (count == 3) {
        hasThree = true;
      } else if (count == 2) {
        hasTwo = true;
      }
    }

    // If there's a 3-of-a-kind, score is the total sum of dice
    if (hasThree && hasTwo) {
      score = 25;
    } else {
      score = 0;
    }

    // Now show score
    setState(() {
      showScore = true;
      this.score = score;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Round Full House")),
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
                  MaterialPageRoute(builder: (ctx) => const SmallStraight()),
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
