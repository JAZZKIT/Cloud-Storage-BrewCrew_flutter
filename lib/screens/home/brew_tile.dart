import 'package:brew_crew/models/brew.dart';
import 'package:flutter/material.dart';

class BrewTile extends StatelessWidget {
  final Brew? brew;

  BrewTile({this.brew});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 8, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.brown[brew!.strength],
            backgroundImage: AssetImage('assets/coffee_icon.png'),
            radius: 25,
          ),
          title: Text(brew!.name),
          subtitle: Text('Takes ${brew!.sugars} sugar(s)'),
        ),
      ),
    );
  }
}
