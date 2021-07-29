import 'package:brew_crew/models/brew.dart';
import 'package:brew_crew/screens/home/brew_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BrewList extends StatefulWidget {
  const BrewList({Key? key}) : super(key: key);

  @override
  _BrewListState createState() => _BrewListState();
}

class _BrewListState extends State<BrewList> {
  @override
  Widget build(BuildContext context) {
    final brew = Provider.of<List<Brew>>(context);
    brew.forEach((doc) {
      print(doc.name);
      print(doc.sugars);
      print(doc.strength);
    });
    return ListView.builder(
      itemCount: brew.length,
      itemBuilder: (context, index) {
        return BrewTile(
          brew: brew[index],
        );
      },
    );
  }
}
