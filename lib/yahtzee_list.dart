import 'package:flutter/material.dart';
import 'round_aces.dart';

class YahtzeeList extends StatefulWidget {
  const YahtzeeList({super.key});

  @override
  State<YahtzeeList> createState() => _YahtzeeListState();
}

class _YahtzeeListState extends State<YahtzeeList> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("How to play Yahtzee"),
          SizedBox(height: 20),
          SizedBox(
            width: MediaQuery.of(context).size.width * 2 / 3,
            height: MediaQuery.of(context).size.height * 1 / 2,
            child: ListView(
              children: [
                Text("Upper row"),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(
                        context,
                      ).push(MaterialPageRoute(builder: (ctx) => RoundAces()));
                    },
                    child: Text("Aces"),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(onPressed: () {}, child: Text("Twos")),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Threes"),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(onPressed: () {}, child: Text("Fours")),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(onPressed: () {}, child: Text("Fives")),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(onPressed: () {}, child: Text("Sixes")),
                ),
                Text("Lower row"),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("3 of a kind"),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("4 of a kind"),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Full house"),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Small straight"),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Large straight"),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Yahtzee"),
                  ),
                ),
                SizedBox(
                  width: 250,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text("Chance"),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
