import 'package:flutter/material.dart';

void main() => runApp(const ScoreBarApp());

class ScoreBarApp extends StatelessWidget {
  const ScoreBarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.lightGreen,
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
  int _currentScore = 0;

  void _incrementScore() {
    setState(() {
      if (_currentScore < 10) {
        _currentScore++;
      }
    });
  }

  void _decrementScore() {
    setState(() {
      if (_currentScore > 0) {
        _currentScore--;
      }
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
            // Title
            Text(
              widget.title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            
            // Row with minus button, progress container, and plus button
            Row(
              children: [
                // Minus button (OUTSIDE the progress container)
                IconButton(
                  onPressed: _decrementScore,
                  icon: Container(
                  child: const Icon(Icons.remove, size: 20),
                  ),
                ),
                
                // Progress Container (just the colored bar - no numbers)
                Expanded(
                  child: Stack(
                    children: [
                      // Background (border)
                      Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey[400]!),
                        ),
                      ),
                      
                      // Progress fill (color that increases/decreases)
                      Container(
                        height: 60,
                        width: (MediaQuery.of(context).size.width - 120) * progress,
                        decoration: BoxDecoration(
                          color: _getScoreColor(),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ],
                  ),
                ),
                
                // Plus button (OUTSIDE the progress container)
                IconButton(
                  onPressed: _incrementScore,
                  icon: Container(
                  child: const Icon(Icons.add, size: 20),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Color _getScoreColor() {
    if (_currentScore >= 8) return Colors.green;
    if (_currentScore >= 4) return Colors.lightGreen;
    if (_currentScore >= 3) return Colors.lightGreenAccent;
    return Colors.lightGreenAccent;
  }
}