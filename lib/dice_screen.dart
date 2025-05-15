import 'package:flutter/material.dart';

class DiceScreen extends StatelessWidget {
  const DiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appbar kannski ekki nota?')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "dice_images/dice-six-faces-one.png",
                cacheHeight: 100,
              ),
              Padding(padding: EdgeInsets.all(15)),
              Image.asset(
                "dice_images/dice-six-faces-two.png",
                cacheHeight: 100,
              ),
            ],
          ),
          Padding(padding: EdgeInsets.all(15)),
          Image.asset("dice_images/dice-six-faces-five.png", cacheHeight: 100),
          Padding(padding: EdgeInsets.all(15)),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                "dice_images/dice-six-faces-three.png",
                cacheHeight: 100,
              ),
              Padding(padding: EdgeInsets.all(15)),
              Image.asset(
                "dice_images/dice-six-faces-four.png",
                cacheHeight: 100,
              ),
            ],
          ),
          SizedBox(height: 15),
          ElevatedButton(onPressed: () {}, child: Text("kasta")),
        ],
      ),
    );
  }
}

// breyta teningum í buttons
