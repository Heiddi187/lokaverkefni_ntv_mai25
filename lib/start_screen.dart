import 'package:flutter/material.dart';
import 'package:lokaverkefni/yahtzee_list.dart';
import 'rules.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 24),
                Stack(
                  children: [
                    Text(
                      "Welcome to Yahtzee",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        foreground:
                            Paint()
                              ..style = PaintingStyle.stroke
                              ..strokeWidth = 3
                              ..color = Colors.white,
                      ),
                    ),
                    Text(
                      "Welcome to Yahtzee",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder:
                          (ctx) => AlertDialog(
                            title: Text("Here's how to play"),
                            content: SingleChildScrollView(
                              child: Text(rulesOfYahtzee),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(),
                                child: Text("OK"),
                              ),
                            ],
                          ),
                    );
                  },
                  icon: Icon(Icons.info, color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                  backgroundColor: Colors.grey.shade200,
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (ctx) => AlertDialog(
                          title: Text("Yahtzee Rundown"),
                          content: Text(
                            "Start with Aces and play round by round all the way down the line",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (ctx) => const YahtzeeList(),
                                  ),
                                );
                              },
                              child: Text("Play"),
                            ),
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text("Cancel"),
                            ),
                          ],
                        ),
                  );
                },
                child: Text("Yahtzee Rundown"),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (ctx) => AlertDialog(
                          title: Text("Upper & Lower"),
                          content: Text("In development... \nAvailable soon"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                  );
                },
                child: Text(
                  "Upper & Lower \$4.99",
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade400,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (ctx) => AlertDialog(
                          title: Text("Free Selection"),
                          content: Text("In development... \nAvailable soon"),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                  );
                },
                child: Text(
                  "Free Selection \$9.99",
                  style: TextStyle(decoration: TextDecoration.lineThrough),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
