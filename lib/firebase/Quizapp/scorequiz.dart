import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'Userhomequiz.dart';

class Score extends StatefulWidget {
  final int level1Score;
  final int level2Score;
  final int level3Score;
  final String userId; // Firebase User ID

  const Score({
    Key? key,
    required this.level1Score,
    required this.level2Score,
    required this.level3Score,
    required this.userId,
  }) : super(key: key);

  @override
  _ScoreState createState() => _ScoreState();
}

class _ScoreState extends State<Score> {
  String? userName;
  String? email;
  String gameName = "Quiz Game";

  @override
  void initState() {
    super.initState();
    fetchUserData();
    saveScores();
  }

  Future<void> fetchUserData() async {
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .get();

      setState(() {
        userName = userDoc['name'];
        email = userDoc['email'];
      });
    } catch (e) {
      print("Error fetching user data: $e");
    }
  }

  Future<void> saveScores() async {
    try {
      // Save scores in a sub-collection under the user
      await FirebaseFirestore.instance
          .collection('users')
          .doc(widget.userId)
          .collection('scores')
          .add({
        'level1Score': widget.level1Score,
        'level2Score': widget.level2Score,
        'level3Score': widget.level3Score,
        'totalScore': widget.level1Score + widget.level2Score + widget.level3Score,
        'timestamp': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print("Error saving scores: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    final int totalScore = widget.level1Score + widget.level2Score + widget.level3Score;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Game Scores",
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.green.shade700,
        centerTitle: true,
      ),
      body: Container(
        color: Colors.green.shade50,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),

              // User Information Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 10,
                            spreadRadius: 5,
                          ),
                        ],
                      ),
                      child: const Text(
                        "🎉 Congratulations on completing the game! 🎉",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.teal,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),
                  ],
                ),
              ),

              const SizedBox(height: 30),

              // Scores Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Text(
                      "Level 1 Score: ${widget.level1Score}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text(
                      "Level 2 Score: ${widget.level2Score}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text(
                      "Level 3 Score: ${widget.level3Score}",
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Divider(),
                    Text(
                      "Total Score: $totalScore",
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Exit Button
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Userhomepage(
                        userName: userName ?? 'User',
                        level1Score: widget.level1Score,
                        level2Score: widget.level2Score,
                        level3Score: widget.level3Score,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green.shade700,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text(
                  "Exit",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
