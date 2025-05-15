import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Appbar kannski þarf ekki')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(onPressed: () {}, child: Text("Takki 1")),
            ElevatedButton(onPressed: () {}, child: Text("Takki 2")),
            ElevatedButton(onPressed: () {}, child: Text("Takki 3")),
          ],
        ),
      ),
    );
  }
}
