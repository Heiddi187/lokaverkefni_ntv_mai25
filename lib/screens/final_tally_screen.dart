import 'package:flutter/material.dart';
import 'package:lokaverkefni/screens/start_screen.dart';
import '../scoring/score_tracker.dart';
import '../scoring/top_scores.dart';
import 'yahtzee_list.dart';
import 'free_select_screen.dart';

class FinalScoreTally extends StatefulWidget {
  const FinalScoreTally({super.key});

  @override
  State<FinalScoreTally> createState() => _FinalScoreTallyState();
}

class _FinalScoreTallyState extends State<FinalScoreTally> {
  @override
  void initState() {
    super.initState();
    updateTopScores(totalScore);
  }

  int scoreTally = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.fromLTRB(40, 40, 40, 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SafeArea(
                child: Text(
                  "Round summary",
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListView.builder(
                    itemCount: nameOfRound.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        title: Text(
                          nameOfRound[index],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Text(
                          scoreOfRound[index].toString(),
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Total Score: $totalScore",
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Top scores",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: ListView.builder(
                    itemCount: topScores.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        dense: true,
                        leading: Text(
                          "#${index + 1}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        title: Text(
                          "Score: ${topScores[index]}",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        child: Row(
          children: [
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size.fromWidth(120)),
              ),
              onPressed: () {
                if (selectedGameMode == "rundown") {
                  resetScores();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const YahtzeeList()),
                  );
                } else if (selectedGameMode == "freeSelect") {
                  resetScores();
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (ctx) => const FreeSelectScreen(),
                    ),
                  );
                }
              },
              child: const Text("Restart"),
            ),
            const Spacer(),
            ElevatedButton(
              style: ButtonStyle(
                fixedSize: WidgetStateProperty.all(Size.fromWidth(120)),
              ),
              onPressed: () {
                resetScores();
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (ctx) => const StartScreen()),
                );
              },
              child: const Text("Menu"),
            ),
          ],
        ),
      ),
    );
  }
}
