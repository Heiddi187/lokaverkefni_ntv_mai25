import 'package:flutter/material.dart';
import '../scoring/score_tracker.dart';
import '../scoring/scoring_free_selection.dart';
import 'final_tally_screen.dart';
import '../dice/dice_mod.dart';
import '../dice/dice_build.dart';

class FreeSelectScreen extends StatefulWidget {
  const FreeSelectScreen({super.key});

  @override
  State<FreeSelectScreen> createState() => _FreeSelectScreenState();
}

class _FreeSelectScreenState extends State<FreeSelectScreen> {
  List<int> currentDice = [1, 1, 1, 1, 1];
  List<bool> diceLocked = [false, false, false, false, false];
  bool hasRolled = false;
  int throwsLeft = 3;

  void rollDice() {
    if (throwsLeft == 0) return;
    setState(() {
      for (int i = 0; i < 5; i++) {
        if (!diceLocked[i]) {
          currentDice[i] = randomizer.nextInt(6) + 1;
        }
      }
      throwsLeft--;
      hasRolled = true;
    });
  }

  void toggleLock(int index) {
    if (throwsLeft == 3) return;
    setState(() {
      diceLocked[index] = !diceLocked[index];
    });
  }

  void scoreCategory(String category, int Function(List<int>) scoringFunction) {
    if (usedCategories.contains(category)) return;

    int score = scoringFunction(currentDice);
    addScoresToList(category, score);

    setState(() {
      usedCategories.add(category);
      scoredPoints[category] = score;
      throwsLeft = 3;
      currentDice = [1, 1, 1, 1, 1];
      diceLocked = [false, false, false, false, false];
      hasRolled = false;
    });

    if (usedCategories.length >= allCategories.length) {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (ctx) => const FinalScoreTally()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final categoryButtons =
        allCategories.map((category) {
          final isUsed = usedCategories.contains(category);
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4.0),
            child: SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed:
                    isUsed
                        ? null
                        : () => scoreCategory(
                          category,
                          scoringFunctions[category]!,
                        ),
                child: Text(
                  isUsed ? "$category: ${scoredPoints[category]}" : category,
                ),
              ),
            ),
          );
        }).toList();

    return Scaffold(
      appBar: AppBar(title: const Text("Yahtzee")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DiceDisplay(
                diceValues: currentDice,
                diceLocked: diceLocked,
                onDieTapped: toggleLock,
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                style: ButtonStyle(
                  fixedSize: WidgetStateProperty.all(Size.fromWidth(200)),
                ),
                onPressed: throwsLeft > 0 ? rollDice : null,
                child: Text("Throw Dice ($throwsLeft left)"),
              ),
              const SizedBox(height: 10),
              const Text("Choose a category to score in:"),
              Expanded(
                child: SizedBox(
                  child: SingleChildScrollView(
                    child: Column(children: categoryButtons),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
