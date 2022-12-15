import 'package:flutter/material.dart';
import 'package:marvelapp_flutter/CharacterCard.dart';
import 'package:marvelapp_flutter/Character.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<StatefulWidget> createState() {
    return StateMyApp();
  }
}

class StateMyApp extends State<MyApp> {
  Color triangleColor = Colors.green;

  final PageController controller =
  PageController(initialPage: 0, viewportFraction: 0.80);

  Widget backgroundTriangle() {
    return CustomPaint(
        size: Size(210, 210), painter: BackgroundTriangle(triangleColor));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: const Color.fromARGB(255, 42, 38, 43),
            body: Stack(
              fit: StackFit.expand,
              children: [
                backgroundTriangle(),
                Container(
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.symmetric(vertical: 25),
                    child: Column(children: [
                      Image.asset(
                        "assets/marvel_logo.png",
                        height: 50,
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 30, bottom: 15),
                        child: Text(
                            style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                            "Choose your hero"),
                      )
                      ,
                      Expanded(
                        child: PageView.builder(
                          controller: controller,
                          itemCount: characterList.length,
                          onPageChanged: (indexHero) => setState(() {
                            triangleColor = characterList[indexHero].color;
                          }),
                          itemBuilder: (BuildContext context, int index) {
                            return CharacterCard(characterList[index]);
                          },
                        ),
                      ),
                    ]))
              ],
            )));
  }
}

class BackgroundTriangle extends CustomPainter {
  final Color triangleColor;
  BackgroundTriangle(this.triangleColor);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = triangleColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(
        Path()
          ..moveTo(size.width, size.height / 2)
          ..lineTo(0, size.height)
          ..lineTo(size.width, size.height),
        paint);
  }

  @override
  bool shouldRepaint(BackgroundTriangle oldDelegate) {
    return triangleColor != oldDelegate.triangleColor;
  }
}