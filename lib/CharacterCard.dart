import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/Character.dart';

class CharacterCard extends StatelessWidget {
  final Character _character;

  CharacterCard(this._character);

  @override
  Widget build(BuildContext context) {
    return Card(
        semanticContainer: true,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        margin: const EdgeInsets.all(15),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(_character.pathImage), fit: BoxFit.fitHeight),
            ),
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Expanded(
                child: Container(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25, vertical: 40),
                child: Text(
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                    _character.name),
              )
            ])));
  }
}