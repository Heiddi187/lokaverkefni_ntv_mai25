import 'package:flutter/material.dart';
import 'package:lokaverkefni/start_screen.dart';
import 'round_aces.dart';
import 'score_tracker.dart';
import 'start_screen.dart';
import 'top_scores.dart';
import 'yahtzee_list.dart';

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
        padding: const EdgeInsets.fromLTRB(20, 40, 20, 40),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                // laga format
                height: MediaQuery.of(context).size.height / 3,
                child: ListView.builder(
                  itemCount: nameOfRound.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text(nameOfRound[index]),
                      trailing: Text(scoreOfRound[index].toString()),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Total Score: $totalScore",
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: MediaQuery.of(context).size.height / 4,
                child: ListView.builder(
                  itemCount: topScores.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: Text("#${index + 1}"),
                      title: Text("Score: ${topScores[index]}"),
                    );
                  },
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  resetScores();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const YahtzeeList()),
                  );
                },
                child: const Text("Restart Game"),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  resetScores();
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const StartScreen()),
                  );
                },
                child: const Text("Back to Main Menu"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
