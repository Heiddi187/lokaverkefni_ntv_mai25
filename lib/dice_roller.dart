import 'package:flutter/material.dart';
import 'dart:math';

final randomizer = Random();

class DiceRoller extends StatefulWidget {
  const DiceRoller({super.key});

  @override
  State<DiceRoller> createState() => _DiceRollerState();
}

class _DiceRollerState extends State<DiceRoller> {
  var diceNumber1 = "dice_images/dice-six-faces-1.png";
  var diceNumber2 = "dice_images/dice-six-faces-2.png";
  var diceNumber3 = "dice_images/dice-six-faces-5.png";
  var diceNumber4 = "dice_images/dice-six-faces-3.png";
  var diceNumber5 = "dice_images/dice-six-faces-4.png";
  var currentDiceRoll = 1;
  int throwsLeft = 3;

  void diceRoll() {
    setState(() {
      currentDiceRoll = randomizer.nextInt(6) + 1;
      //diceNumber1 = "dice_images/dice-six-faces-6.png";
      throwsLeft--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "dice_images/dice-six-faces-$currentDiceRoll.png",
              cacheHeight: 100,
            ),
            Padding(padding: EdgeInsets.all(15)),
            IconButton(
              onPressed: () {},
              icon: Image.asset(
                "dice_images/dice-six-faces-2.png",
                cacheHeight: 100,
              ),
            ),
            //Image.asset(diceNumber2, cacheHeight: 100),
          ],
        ),
        Padding(padding: EdgeInsets.all(15)),
        Image.asset(diceNumber3, cacheHeight: 100),
        Padding(padding: EdgeInsets.all(15)),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(diceNumber4, cacheHeight: 100),
            Padding(padding: EdgeInsets.all(15)),
            Image.asset(diceNumber5, cacheHeight: 100),
          ],
        ),
        SizedBox(height: 30),
        ElevatedButton(
          onPressed: diceRoll,
          child: Text("throw", style: TextStyle(fontSize: 20)),
        ),
        SizedBox(height: 20),
        Text(
          "köst eftir :$throwsLeft",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
