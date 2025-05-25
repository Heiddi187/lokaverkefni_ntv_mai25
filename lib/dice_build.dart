/*
import 'package:flutter/material.dart';
import 'dart:math';

import 'package:lokaverkefni/round_aces.dart';

final randomizer = Random();

// Dice logic and UI in one class
class DiceSet extends StatefulWidget {
  final Function(List<int>) onFinished; // callback to pass dice values

  const DiceSet({required this.onFinished, super.key});

  @override
  State<DiceSet> createState() => _DiceSetState();
}

class _DiceSetState extends State<DiceSet> {
  int throwsLeft = 3;
  List<int> diceValues = [1, 1, 1, 1, 1];
  List<bool> diceLocked = [false, false, false, false, false];
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
        widget.onFinished(diceValues); // send result back
      }
    });
  }

  void calculateScore() {
    score = diceValues
        .where((value) => value == 3)
        .fold(0, (sum, value) => sum + value);
    showScore = true;
  }

  void dieIsLocked(int index) {
    if (!hasRolled) return;

    setState(() {
      diceLocked[index] = !diceLocked[index];
    });
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Locked dice: ${diceLocked.where((e) => e).length}"),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 15,
          children: List.generate(5, (index) => buildDie(index)),
        ),
        const SizedBox(height: 30),
        Text("Throws left: $throwsLeft"),
        ElevatedButton(
          onPressed: throwsLeft > 0 ? diceRoll : null,
          child: const Text("Throw"),
        ),
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
              ).push(MaterialPageRoute(builder: (ctx) => RoundAces()));
            },
            child: Text("Next Round"),
          ),
        ],
      ],
    );
  }
}
*/

import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceSet extends StatefulWidget {
  final void Function(List<int>) onFinished;

  const DiceSet({required this.onFinished, super.key});

  @override
  State<DiceSet> createState() => _DiceSetState();
}

class _DiceSetState extends State<DiceSet> {
  int throwsLeft = 3;
  List<int> diceValues = [1, 1, 1, 1, 1];
  List<bool> diceLocked = [false, false, false, false, false];
  bool hasRolled = false;

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
        widget.onFinished(diceValues);
      }
    });
  }

  void dieIsLocked(int index) {
    if (!hasRolled) return;

    setState(() {
      diceLocked[index] = !diceLocked[index];
    });
  }

  Widget buildDie(int index) {
    return IconButton(
      onPressed: hasRolled ? () => dieIsLocked(index) : null,
      iconSize: 100,
      icon: Stack(
        children: [
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
    return Column(
      children: [
        //Text("Locked: ${diceLocked.where((e) => e).length}"),
        Wrap(
          alignment: WrapAlignment.center,
          spacing: 15,
          runSpacing: 15,
          children: List.generate(5, (index) => buildDie(index)),
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: throwsLeft > 0 ? diceRoll : null,
          child: const Text("Throw"),
        ),
        Text("Throws left: $throwsLeft"),
      ],
    );
  }
}
