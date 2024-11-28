import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'leveltwoquiz.dart';

void main() {
  runApp(const MaterialApp(
    home: Levelone(),
    debugShowCheckedModeBanner: false,
  ));
}

class Levelone extends StatefulWidget {
  const Levelone({super.key});

  @override
  State<Levelone> createState() => _LeveloneState();
}

class _LeveloneState extends State<Levelone> {
  int currentQuestionIndex = 0;
  int totalQuestions = 10;
  int score = 0;
  List<Map<String, dynamic>> shuffledQuestions = [];

  final List<Map<String, dynamic>> questionsDataset = [

  {
  "question": "In which country did the game, chess, originate?",
  "correctAnswer": "India",
  "options": ["India", "China", "Russia", "Egypt"]
  },
  {
  "question": "The wheel in the center of the Indian national flag has _____ spokes.",
  "correctAnswer": "24",
  "options": [ "18","24", "12", "36"]
  },
  {
  "question": "Who is the author of Harry Potter series of books?",
  "correctAnswer": "J.K. Rowling",
  "options": ["Stephen King","J.K. Rowling", "M.T Vasudhevan nair",  "J.R.R. Tolkien"]
  },
  {
  "question": "Who was known as 'Human Computer'?",
  "correctAnswer": "Shakuntala Devi",
  "options": ["Shakuntala Devi", "Alan Turing", "Charles Babbage", "Ada Lovelace"]
  },
  {
  "question": "Name the instrument used to measure the speed of wind?",
  "correctAnswer": "Anemometer",
  "options": ["Anemometer", "Airometer", "Thermometer", "Hygrometer"]
  },
  {
  "question": "Name the smallest planet in our solar system?",
  "correctAnswer": "Mercury",
  "options": ["Mercury", "Venus", "Pluto", "Earth"]
  },
  {
  "question": "Any number multiplied by zero is ________.",
  "correctAnswer": "Zero",
  "options": ["Zero", "One", "Infinity", "Undefined"]
  },
  {
  "question": "Which is the largest four-digit number?",
  "correctAnswer": "9999",
  "options": ["9999", "9998", "10000", "999"]
  },
  {
  "question": "Ganymede is the moon of which planet?",
  "correctAnswer": "Jupiter",
  "options": ["Mars", "Jupiter", "Saturn",  "Earth"]
  },
  {
  "question": "Who was the first person to land on the moon?",
  "correctAnswer": "Neil Armstrong",
  "options": ["Neil Armstrong", "Buzz Aldrin", "Yuri Gagarin", "Michael Collins"]
  },
  {
  "question": "Who invented the steam engine?",
  "correctAnswer": "James Watt",
  "options": ["James Watt", "Thomas Edison", "Nikola Tesla", "Alexander Graham Bell"]
  },
  {
  "question": "Who was the first person to calculate the value of Pi?",
  "correctAnswer": "Archimedes",
  "options": [ "Newton","Archimedes", "Pythagoras", "Euclid",]
  },
  {
  "question": "In which country is Mount Everest situated?",
  "correctAnswer": "Nepal",
  "options": ["China","Nepal", "India",  "Bhutan"]
  },
  {
  "question": "Which is the biggest coral reef in the world?",
  "correctAnswer": "Great Barrier Reef",
  "options": ["Great Barrier Reef", "Belize Barrier Reef", "Red Sea Reef", "Florida Reef"]
  },
  {
  "question": "World’s largest rainforest is _________.",
  "correctAnswer": "Amazon",
  "options": ["Amazon", "Congo Rainforest", "Daintree Rainforest", "Sundarbans"]
  },
  {
  "question": "Which is the biggest part of the brain?",
  "correctAnswer": "Cerebrum",
  "options": ["Cerebrum", "Cerebellum", "Medulla", "Pons"]
  },
  {
  "question": "_________ animals sleep during the day and stay awake at night.",
  "correctAnswer": "Nocturnal animals",
  "options": ["Diurnal animals", "Carnivorous animals", "Herbivorous animals","Nocturnal animals" ]
  },
  {
  "question": "Animals that eat meat are called _________.",
  "correctAnswer": "Carnivores",
  "options": ["Carnivores", "Herbivores", "Omnivores", "Insectivores"]
  },
  {
  "question": "Name an insectivorous plant?",
  "correctAnswer": "Venus Flytrap",
  "options": ["Venus Flytrap", "Pitcher Plant", "Sundew", "Butterwort"]
  },
  {
  "question": "A newborn baby has _______ bones.",
  "correctAnswer": "300",
  "options": [ "206","300", "270", "400"]
  },
  {
  "question": "How many millimeters make a meter?",
  "correctAnswer": "1000",
  "options": ["1000", "10000", "100", "10"]
  },
  {
  "question": "What is an angle that has a value less than 90° called?",
  "correctAnswer": "Acute angle",
  "options": [ "Obtuse angle", "Right angle", "Reflex angle","Acute angle"]
  },
  {
  "question": "What is an angle that has a value greater than 90° called?",
  "correctAnswer": "Obtuse angle",
  "options": [ "Acute angle", "Right angle","Obtuse angle", "Reflex angle"]
  },
  {
  "question": "When a number is multiplied by 1, the product would be ________.",
  "correctAnswer": "The same number",
  "options": [ "Zero","The same number", "Infinity", "Undefined"]
  },
  {
  "question": "What is the art of folding paper to create shapes called?",
  "correctAnswer": "Origami",
  "options": [ "Shinigami", "Origami", "Papercraft", "Calligraphy"]
  },
  {
  "question": "The flag of which country has a non-quadrilateral shape?",
  "correctAnswer": "Nepal",
  "options": [ "India","Nepal", "Sri Lanka", "Bhutan"]
  },
  {
  "question": "The place where beehives of honeybees are kept is called?",
  "correctAnswer": "Apiary",
  "options": ["Apiary", "Hive", "Colony", "Nest"]
  },
  {
  "question": "Which is the fastest land animal?",
  "correctAnswer": "Cheetah",
  "options": ["Cheetah", "Leopard", "Lion", "Tiger"]
  },
  {
  "question": "Which animal has a hump on its back?",
  "correctAnswer": "Camel",
  "options": [ "Elephant", "Camel","Giraffe", "Buffalo"]
  },
  {
  "question": "Name a commonly found reptile?",
  "correctAnswer": "Lizard",
  "options": [ "Snake", "Turtle","Lizard", "Alligator"]
  },
  {
  "question": "Which is the largest ocean in the world?",
  "correctAnswer": "Pacific Ocean",
  "options": [ "Atlantic Ocean", "Indian Ocean", "Arctic Ocean","Pacific Ocean"]
  },
  {
  "question": "Australia lies between which two oceans?",
  "correctAnswer": "Indian Ocean and Pacific Ocean",
  "options": [ "Atlantic Ocean and Indian Ocean","Indian Ocean and Pacific Ocean", "Pacific Ocean and Arctic Ocean", "Atlantic Ocean and Pacific Ocean"]
  }

  ];

  @override
  void initState() {
    super.initState();
    shuffledQuestions = List.from(questionsDataset)..shuffle();
    shuffledQuestions = shuffledQuestions.take(totalQuestions).toList();
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentQuestionIndex + 1) / totalQuestions;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Level 1 - Easy",
          style: GoogleFonts.fredoka(
            textStyle: const TextStyle(
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Colors.pink,
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
                color: Colors.blue.shade50,
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
            ...shuffledQuestions[currentQuestionIndex]['options'].map<Widget>((option) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: ElevatedButton(
                  onPressed: () {
                    String correctAnswer =
                    shuffledQuestions[currentQuestionIndex]['correctAnswer'];
                    setState(() {
                      if (option == correctAnswer) {
                        score++;
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Correct Answer!"),
                            backgroundColor: Colors.green,
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text("Wrong Answer! Correct: $correctAnswer"),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }

                      if (currentQuestionIndex < totalQuestions - 1) {
                        currentQuestionIndex++;
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Leveltwo(
                              level1Score: score, // Pass Level 1 score explicitly
                              userName: '', // Pass username if applicable
                            ),
                          ),
                        );
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    option,
                    style: GoogleFonts.fredoka(
                      textStyle: const TextStyle(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
            const Spacer(),
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.pink,
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
