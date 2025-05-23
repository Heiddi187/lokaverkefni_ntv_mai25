import 'package:flutter/material.dart';
import 'package:lokaverkefni/round_fours.dart';
import 'dart:math';

import 'package:lokaverkefni/yahtzee_list.dart';

final randomizer = Random();

class RoundThrees extends StatefulWidget {
  const RoundThrees({super.key});

  @override
  State<RoundThrees> createState() => _RoundThreesState();
}

class _RoundThreesState extends State<RoundThrees> {
  List<int> diceValues = [1, 1, 1, 1, 1];
  List<bool> diceLocked = [false, false, false, false, false];
  int throwsLeft = 3;
  bool hasRolled = false;
  int score = 0;
  bool showScore = false;

  void diceRoll() {
    if (throwsLeft == 0) return;

    setState(() {
      for (int i = 0; i < 5; i++) {
        if (!diceLocked[i]) {
          diceValues[i] = randomizer.nextInt(6) + 1;
        }
      }
      throwsLeft--;
      hasRolled = true;

      if (throwsLeft == 0) {
        calculateScore();
      }
    });
  }

  void dieIsLocked(int index) {
    if (!hasRolled) return;

    setState(() {
      diceLocked[index] = !diceLocked[index];
    });
  }

  void calculateScore() {
    score = diceValues
        .where((value) => value == 3)
        .fold(0, (sum, value) => sum + value);
    showScore = true;
  }

  Widget buildDie(int index) {
    return IconButton(
      onPressed: hasRolled ? () => dieIsLocked(index) : null,
      iconSize: 100,
      icon: Stack(
        children: [
          Text("${diceValues[0].toString()}"),
          Image.asset(
            "dice_images/dice-six-faces-${diceValues[index]}.png",
            height: 100,
          ),
          if (diceLocked[index])
            Container(
              height: 100,
              width: 100,
              color: Colors.black.withValues(alpha: 0.5),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Threes Round (count 3's)")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 15,
            children: List.generate(5, (index) => buildDie(index)),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: diceRoll,
            child: Text("Throw", style: TextStyle(fontSize: 20)),
          ),
          const SizedBox(height: 20),
          Text("Throws left: $throwsLeft"),
          Text("Locked: ${diceLocked.where((e) => e).length}"),
          const SizedBox(height: 20),
          if (showScore) ...[
            Text(
              "You scored: $score points!",
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.of(
                  context,
                ).push(MaterialPageRoute(builder: (ctx) => RoundFours()));
              },
              child: Text("Next Round"),
            ),
          ],
        ],
      ),
    );
  }
}
