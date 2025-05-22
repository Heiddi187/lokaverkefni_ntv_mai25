import 'dart:ui';

import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller4 extends StatefulWidget {
  const DiceRoller4({super.key});

  @override
  State<DiceRoller4> createState() => _DiceRoller4State();
}

class _DiceRoller4State extends State<DiceRoller4> {
  List<int> diceValues = [1, 1, 1, 1, 1];
  List<bool> diceLocked = [false, false, false, false, false];
  int throwsLeft = 3;
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
    });
  }

  void dieIsLocked(int index) {
    if (!hasRolled) return;

    setState(() {
      diceLocked[index] = !diceLocked[index];
    });
  }

  Widget buildDie(int index) {
    return Stack(
      alignment: Alignment.center,
      children: [
        IconButton(
          onPressed: hasRolled ? () => dieIsLocked(index) : null,
          iconSize: 100,
          icon: Image.asset(
            "dice_images/dice-six-faces-${diceValues[index]}.png",
            height: 100,
          ),
        ),
        if (diceLocked[index])
          Container(
            height: 100,
            width: 100,
            color: Colors.black.withValues(alpha: 0.5),
          ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Locked: ${diceLocked.where((e) => e).length} | Throws Left: $throwsLeft',
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 15,
            runSpacing: 15,
            children: [
              buildDie(0),
              buildDie(1),
              buildDie(2),
              buildDie(3),
              buildDie(4),
            ],
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            onPressed: throwsLeft > 0 ? diceRoll : null,
            child: const Text("Throw", style: TextStyle(fontSize: 20)),
          ),
        ],
      ),
    );
  }
}
