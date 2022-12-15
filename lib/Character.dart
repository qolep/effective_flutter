import 'package:flutter/material.dart';

class Character {
  String name;
  String pathImage;
  Color color;

  Character(this.name, this.pathImage, this.color);
}

final List<Character> characterList = [
  Character("Iron Man", "assets/iron_man.png", Colors.yellow),
  Character("Deadpool", "assets/deadpool.jpg", Colors.red),
  Character("Captian America", "assets/capamerica.jpg", Colors.blue),
  Character("Spiderman", "assets/spiderman.jpg", Colors.grey),
  Character("Doctor Strange", "assets/doctor_strange.jpg", Colors.black),
  Character("Thor", "assets/thor.jpg", Colors.indigo),
  Character("Thanos", "assets/thanos.jpg", Colors.purple)
];