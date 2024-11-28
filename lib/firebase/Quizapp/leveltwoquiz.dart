import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'kevelthreequiz.dart';


class Leveltwo extends StatefulWidget {
  final int level1Score;
  final String userName;

  const Leveltwo({super.key, required this.level1Score, required this.userName});

  @override
  State<Leveltwo> createState() => _LeveltwoState();
}

class _LeveltwoState extends State<Leveltwo> {
  final TextEditingController _answerController = TextEditingController();
  int currentQuestionIndex = 0;
  int totalQuestions = 5;
  int score1 = 0;
  List<Map<String, String>> shuffledQuestions = [];

  final List<Map<String, String>> questionsDataset = [
    {"question": "How many days do we have in a week?", "answer": "Seven"},
    {"question": "How many days are there in a normal year?", "answer": "365"},
    {"question": "How many colors are there in a rainbow?", "answer": "7"},
    {
      "question": "Which animal is known as the 'Ship of the Desert'?",
      "answer": "Camel"
    },
    {
      "question": "How many letters are there in the English alphabet?",
      "answer": "26"
    },
    {
      "question": "How many consonants are there in the English alphabet?",
      "answer": "21"
    },
    {"question": "How many sides are there in a triangle?", "answer": "Three"},
    {
      "question": "Which month of the year has the least number of days?",
      "answer": "February"
    },
    {
      "question": "Which are the vowels in the English alphabet series?",
      "answer": "A, E, I, O, U"
    },
    {"question": "Which animal is called King of Jungle?", "answer": "Lion"},
    {
      "question": "How many primary colors are there?",
      "answer": "Three (red, yellow, blue)"
    },
    {
      "question":
      "How many days are there in the month of February in a leap year?",
      "answer": "29 days"
    },
    {"question": "What do you call a house made of ice?", "answer": "Igloo"},
    {
      "question": "Which is the largest animal in the world?",
      "answer": "Blue whale"
    },
    {
      "question": "Which is the tallest animal on the earth?",
      "answer": "Giraffe"
    },
    {
      "question": "Which festival is known as the festival of colors?",
      "answer": "Holi"
    },
    {
      "question": "Which festival is called the festival of light?",
      "answer": "Diwali"
    },
    {"question": "What is the top color in a rainbow?", "answer": "Red"},
    {
      "question": "What type of bird lays the largest eggs?",
      "answer": "Ostrich"
    },
    {
      "question": "Which festival is known as the 'Festival of flowers'?",
      "answer": "Onam"
    },
    {"question": "In which direction does the sunrise?", "answer": "East"},
    {"question": "Which is the world's largest flower?", "answer": "Rafflesia"},
    {
      "question": "How many zeros are there in one hundred thousand?",
      "answer": "Five"
    },
    {
      "question": "How many hours are there in two days?",
      "answer": "48 hours (24+24)"
    },
    {
      "question": "How many months of the year have 31 days?",
      "answer": "7 (January, March, May, July, August, October and December)"
    },
    {"question": "How many weeks are there in one year?", "answer": "52"},
    {
      "question": "Which are the colors in a rainbow?",
      "answer": "Violet, Indigo, Blue, Green, Yellow, Orange, Red"
    },
    {"question": "How many bones does an adult human have?", "answer": "206"},
    {
      "question": "Who was the first man to walk on the moon?",
      "answer": "Neil Armstrong"
    },
    {"question": "How many millimeters are there in 1cm?", "answer": "10"},
    {"question": "Which is the nearest star to planet earth?", "answer": "Sun"},
    {"question": "Which is the longest river on the earth?", "answer": "Nile"},
    {
      "question": "Which is the principal source of energy for earth?",
      "answer": "Sun"
    },
    {"question": "How many lungs does the human body have?", "answer": "Two"},
    {
      "question": "What is the standard taste of the water?",
      "answer": "Water is tasteless"
    },
    {
      "question": "Which is the tallest mountain in the world?",
      "answer": "Mount Everest"
    },
    {
      "question": "Which is the fastest animal on the land?",
      "answer": "Cheetah"
    },
    {
      "question": "Which continent is known as the 'Dark continent'?",
      "answer": "Africa"
    },
    {"question": "Which planet is known as the Red Planet?", "answer": "Mars"},
    {
      "question": "Which is the most sensitive organ in our body?",
      "answer": "Skin"
    },
    {
      "question": "Which is the largest ocean in the world?",
      "answer": "Pacific Ocean"
    },
    {
      "question": "Which day is observed as World Environment Day?",
      "answer": "June 5"
    },
    {
      "question": "How many years are there in a century?",
      "answer": "One Hundred"
    },
    {
      "question": "Which is the largest country in the world?",
      "answer": "Russia (By area)"
    },
    {"question": "Who invented the Computer?", "answer": "Charles Babbage"},
    {
      "question": "How many players are there in a cricket team?",
      "answer": "11"
    },
    {
      "question": "Which day is observed as World Literacy Day?",
      "answer": "September 8"
    },
    {"question": "What is the capital of France?", "answer": "Paris"},
    {"question": "What is 2 + 2?", "answer": "4"},
    {
      "question": "Name a programming language starting with 'P'.",
      "answer": "Python"
    },
    {"question": "What is the square root of 16?", "answer": "4"},
    {"question": "Who wrote 'Romeo and Juliet'?", "answer": "Shakespeare"},
    {
      "question": "What is the largest continent in the world?",
      "answer": "Asia"
    },
    {
      "question": "Who is the inventor of the electric bulb?",
      "answer": "Thomas Alva Edison"
    },
    {
      "question": "On whose memory is the Nobel Prize awarded?",
      "answer": "Alfred Nobel"
    },
    {
      "question": "Who is the first woman to go to space?",
      "answer": "Valentina Tereshkova"
    },
    {"question": "What is HCl?", "answer": "Hydrochloric acid"},
    {"question": "What is the currency of China?", "answer": "Renminbi"},
    {
      "question": "Which planet is known as the Blue Planet?",
      "answer": "Earth"
    },
    {"question": "How many players are in a cricket team?", "answer": "11"},
    {"question": "What is the home of a lion called?", "answer": "Den"},
    {
      "question": "What is the national sport of Canada?",
      "answer": "Ice hockey"
    },
    {"question": "Who discovered gravity?", "answer": "Isaac Newton"},
    {
      "question": "What is the fear of darkness called?",
      "answer": "Nyctophobia"
    },
    {"question": "How many states are there in India?", "answer": "29"},
    {"question": "Who discovered the aeroplane?", "answer": "Wright Brothers"},
    {"question": "What is the full form of TV?", "answer": "Television"},
    {
      "question": "What is the process by which plants make food?",
      "answer": "Photosynthesis"
    },
    {
      "question": "Which is the biggest planet in our solar system?",
      "answer": "Jupiter"
    },
    {
      "question": "What is the group of stars forming a pattern called?",
      "answer": "Constellation"
    },
    {
      "question": "What is the place where animals are kept called?",
      "answer": "Zoo"
    },
    {
      "question": "What is Beriberi caused by?",
      "answer": "Vitamin B deficiency"
    },
    {"question": "What is the value of Pi (π)?", "answer": "3.14"},
    {
      "question": "Who is the 'Flying Sikh' of India?",
      "answer": "Milkha Singh"
    },
    {"question": "What is the national game of India?", "answer": "Hockey"},
    {
      "question": "Which animal is known as the 'Ship of the Desert'?",
      "answer": "Camel"
    },
    {
      "question": "Who is the first Prime Minister of India?",
      "answer": "Jawaharlal Nehru"
    },
    {
      "question": "What is the name of the dog that first went to space?",
      "answer": "Laika"
    },
    {
      "question": "What is the fear of spiders called?",
      "answer": "Arachnophobia"
    },
    {"question": "What is the capital city of Peru?", "answer": "Lima"},
    {
      "question": "Who is the author of 'God of Small Things'?",
      "answer": "Arundhati Roy"
    },
    {
      "question": "How many Grand Slam Tennis Tournaments are held annually?",
      "answer": "4"
    },
    {"question": "What is the national flower of India?", "answer": "Lotus"},
    {"question": "Who painted the Mona Lisa?", "answer": "Leonardo da Vinci"},
    {"question": "Which ocean is the largest?", "answer": "Pacific Ocean"},
    {
      "question": "What is the study of the stars and planets called?",
      "answer": "Astronomy"
    },
    {"question": "How many continents are there in the world?", "answer": "7"},
    {"question": "What is the fastest land animal?", "answer": "Cheetah"},
    {
      "question": "Which gas is essential for us to breathe?",
      "answer": "Oxygen"
    },
    {
      "question": "What is the tallest mountain in the world?",
      "answer": "Mount Everest"
    },
    {
      "question": "Which country is known as the 'Land of the Rising Sun'?",
      "answer": "Japan"
    },
    {"question": "What is the longest river in the world?", "answer": "Nile"},
    {"question": "What is the chemical symbol for water?", "answer": "H2O"},


  ];

  @override
  void initState() {
    super.initState();
    shuffledQuestions = List.from(questionsDataset)..shuffle();
    shuffledQuestions = shuffledQuestions.take(totalQuestions).toList();
    score1 = 0; // Initialize Level 2 score to 0
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentQuestionIndex + 1) / totalQuestions;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Level 2 - Medium",
          style: GoogleFonts.fredoka(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.green.shade50,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Text(
                "Question ${currentQuestionIndex + 1}: ${shuffledQuestions[currentQuestionIndex]['question']}",
                style: GoogleFonts.fredoka(
                  textStyle: const TextStyle(
                    fontSize: 18,
                    color: Colors.black87,
                  ),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              controller: _answerController,
              decoration: InputDecoration(
                hintText: "Type your answer here",
                hintStyle: GoogleFonts.fredoka(
                  textStyle: TextStyle(
                    color: Colors.grey.shade600,
                  ),
                ),
                filled: true,
                fillColor: Colors.green.shade50,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: BorderSide.none,
                ),
              ),
              style: GoogleFonts.fredoka(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                String userAnswer = _answerController.text.trim();
                String correctAnswer = shuffledQuestions[currentQuestionIndex]['answer']!.toLowerCase();

                setState(() {
                  if (userAnswer.toLowerCase() == correctAnswer) {
                    score1++; // Increment Level 2 score
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Correct Answer!"),
                        backgroundColor: Colors.green,
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text("Wrong Answer!"),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }


                  _answerController.clear();

                  if (currentQuestionIndex == totalQuestions - 1) {
                    // Navigate to Level 3 with the updated Level 2 score
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Levelthree(
                          level1Score: widget.level1Score, // Pass Level 1 score
                          level2Score: score1, // Pass Level 2 score
                          userName: widget.userName, // Pass username if applicable
                        ),
                      ),
                    );
                  } else {
                    currentQuestionIndex++;
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                "Submit",
                style: GoogleFonts.fredoka(
                  textStyle: const TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const Spacer(),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.teal,
              minHeight: 10,
            ),
            const SizedBox(height: 10),
            Text(
              "Progress: ${(progress * 100).toInt()}%",
              style: GoogleFonts.fredoka(
                textStyle: const TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
