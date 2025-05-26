import 'package:flutter/material.dart';
import 'yahtzee_list.dart';

class listBox extends StatelessWidget {
  listBox({
    required this.roundTitle,
    required this.roundRules,
    required this.whichRound,
    super.key,
  });
  String roundTitle;
  String roundRules;
  Widget whichRound;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 250,
          height: 50,
          decoration: ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
            color: Colors.grey.shade200,
          ),
          child: Row(
            children: [
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (ctx) => AlertDialog(
                          title: Text("Rules of $roundTitle"),
                          content: Text(roundRules),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text("OK"),
                            ),
                          ],
                        ),
                  );
                },
                icon: Icon(Icons.info, color: Colors.transparent),
              ), // veit að þetta er ekki optimal en fann ekki auðvelda leið til að fá textann í miðjunna
              Expanded(
                child: TextButton(
                  onPressed: () {
                    Navigator.of(
                      context,
                    ).push(MaterialPageRoute(builder: (ctx) => whichRound));
                  },
                  child: Align(
                    alignment: Alignment.center,
                    child: Text(
                      roundTitle,
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              IconButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder:
                        (ctx) => AlertDialog(
                          title: Text(
                            "Rules of $roundTitle",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          content: Text(roundRules),
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
        ),
        Padding(padding: EdgeInsets.all(2)),
      ],
    );
  }
}
