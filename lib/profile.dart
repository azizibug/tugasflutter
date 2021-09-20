import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final String title;

  const MainPage({
    required this.title,
  });

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text('Team'),
        ),
        body: ListView(
          padding: EdgeInsets.all(16),
          children: [
            card1(),
            card2(),
            card3(),
            card4(),
          ],
        ),
      );

  Widget card1() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: AssetImage(
                    'img/gani.jpeg',
                  ),
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Abdul Gani',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );

        Widget card2() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: AssetImage(
                    'img/Alifia.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Alifia Widiya Hua',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );

        Widget card3() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: AssetImage(
                    'img/kknur.jpg',
                  ),
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Nurhidayati',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );

        Widget card4() => Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: Column(
          children: [
            Stack(
              children: [
                Ink.image(
                  image: AssetImage(
                    'img/azib.png',
                  ),
                  height: 240,
                  fit: BoxFit.contain,
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(16).copyWith(bottom: 0),
              child: Text(
                'Mohamad Azib Azizi',
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      );
}

