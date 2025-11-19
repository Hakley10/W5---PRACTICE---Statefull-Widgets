import 'package:flutter/material.dart';

void main() => runApp(const ScoreBarApp());

class ScoreBarApp extends StatelessWidget {
  const ScoreBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ScoreCard(title: 'My score in Flutter'),
              SizedBox(height: 16),
              ScoreCard(title: 'My score in Dart'),
              SizedBox(height: 16),
              ScoreCard(title: 'My score in React'),
            ],
          ),
        ),
      ),
    );
  }
}

class ScoreCard extends StatefulWidget {
  final String title;

  const ScoreCard({
    super.key,
    required this.title,
  });

  @override
  State<ScoreCard> createState() => _ScoreCardState();
}

class _ScoreCardState extends State<ScoreCard> {
  int _currentScore = 0;

  void _incrementScore() {
    setState(() {
      if (_currentScore < 10) _currentScore++;
    });
  }

  void _decrementScore() {
    setState(() {
      if (_currentScore > 0) _currentScore--;
    });
  }

  @override
  Widget build(BuildContext context) {
    final progress = _currentScore / 10;

    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 16),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: _decrementScore,
                  icon: const Icon(Icons.remove, size: 30),
                ),
                SizedBox(width: 80),
                IconButton(
                  onPressed: _incrementScore,
                  icon: const Icon(Icons.add, size: 30),
                ),
              ],
            ),

            SizedBox(height: 40),

            LayoutBuilder(
              builder: (context, constraints) {
                double maxWidth = constraints.maxWidth;

                return Stack(
                  children: [
                    Container(
                      height: 60,
                      width: maxWidth,
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey[400]!),
                      ),
                    ),
                    Container(
                      height: 60,
                      width: maxWidth * progress,   
                      decoration: BoxDecoration(
                        color: _getScoreColor(),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ],
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Color _getScoreColor() {
    if (_currentScore >= 8) return Colors.green;
    if (_currentScore >= 4) return Colors.lightGreen;
    return Colors.lightGreenAccent;
  }
}
