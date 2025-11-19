import 'package:flutter/material.dart';

void main() => runApp(const ScoreBarApp());

class ScoreBarApp extends StatelessWidget {
  const ScoreBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text('Score Rating System')),
        body: const Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            children: [
              ScoreCard(
                title: 'My score in Flutter',
              ),
              SizedBox(height: 16),
              ScoreCard(
                title: 'My score in Dart',
              ),
              SizedBox(height: 16),
              ScoreCard(
                title: 'My score in React',
              ),
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
  int _currentScore = 5;

  void _incrementScore() {
    setState(() {
      if (_currentScore < 10) {
        _currentScore++;
      }
    });
  }

  void _decrementScore() {
    setState(() {
      if (_currentScore > 1) {
        _currentScore--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 16),
            
            // Progress Bar Container with +/- buttons inside
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[400]!),
              ),
              child: Row(
                children: [
                  // Minus button on the left
                  IconButton(
                    onPressed: _decrementScore,
                    icon: const Icon(Icons.remove),
                  ),
                  
                  // Expanded space in the middle
                  Expanded(
                    child: Center(
                      child: Text(
                        '$_currentScore',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  
                  // Plus button on the right
                  IconButton(
                    onPressed: _incrementScore,
                    icon: const Icon(Icons.add),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}