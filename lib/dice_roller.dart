import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  int currentDiceRoll = 1;
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
        Text(
          "locked dice: ${diceLocked.where((locked) => locked).length}",
        ), //                                           teningar læstir
        Text(
          "${diceValues[0].toString()}, ${diceValues[1].toString()}, ${diceValues[2].toString()}, ${diceValues[3].toString()}, ${diceValues[4].toString()},",
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDie(0),
            Padding(padding: EdgeInsets.all(15)),
            buildDie(1),
          ],
        ),
        Padding(padding: EdgeInsets.all(15)),
        buildDie(2),
        Padding(padding: EdgeInsets.all(15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            buildDie(3),
            Padding(padding: EdgeInsets.all(15)),
            buildDie(4),
          ],
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: diceRoll,
          child: Text("throw", style: TextStyle(fontSize: 20)), //    kasta
        ),
        SizedBox(height: 20),
        Text(
          "throws left :$throwsLeft", //                        köst eftir
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
