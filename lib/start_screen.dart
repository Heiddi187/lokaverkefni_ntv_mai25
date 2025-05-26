import 'package:flutter/material.dart';
import 'package:lokaverkefni/yahtzee_list.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Appbar í startscreen kannski þarf ekki'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (ctx) => const YahtzeeList()),
                  );
                },
                child: Text("Traditional Yahtzee"),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 250,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.grey.shade300,
                ),
                onPressed: () {},
                child: Text(
                  "Upper & lower \$4.99",
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
                  backgroundColor: Colors.grey.shade300,
                ),
                onPressed: () {},
                child: Text(
                  "Free selection \$9.99",
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
