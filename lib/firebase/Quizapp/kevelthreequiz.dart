import 'package:fairbaseeg/firebase/Quizapp/scorequiz.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Levelthree extends StatefulWidget {
  final int level1Score;
  final int level2Score;
  final String userName;

  const Levelthree({
    super.key,
    required this.level1Score,
    required this.level2Score,
    required this.userName,
  });

  @override
  State<Levelthree> createState() => _LevelthreeState();
}
class _LevelthreeState extends State<Levelthree> {
  final TextEditingController _answerController = TextEditingController();
  int currentQuestionIndex = 0;
  int score2 = 0;
  List<Map<String, String>> shuffledQuestions = [];

  // Sample dataset for quiz questions (you will have your 200 questions here)
  final List<Map<String, String>> questionsDataset = [
    {
      "question": "Who is the fastest man in the world?",
      "answer": "Usain Bolt"
    },
    {
      "question": "In which year was the Battle of Plassey fought?",
      "answer": "1757"
    },
    {"question": "At which age Gautham Buddha got Nirvana?", "answer": "35"},
    {
      "question": "Who is known as the father of history?",
      "answer": "Herodotus"
    },
    {
      "question": "What was the ancient name of Patna?",
      "answer": "Pataliputra"
    },
    {"question": "What is the square root of 144?", "answer": "12"},
    {
      "question": "Who gave the slogan 'Do or Die'?",
      "answer": "Mahatma Gandhi"
    },
    {
      "question": "Why are the leaves green in color?",
      "answer": "Due to the presence of Chlorophyll"
    },
    {
      "question": "Name the acid that is secreted in the stomach?",
      "answer": "Hydrochloric acid"
    },
    {
      "question":
      "Which is the highest civilian award of the Republic of India?",
      "answer": "The Bharat Ratna Award"
    },
    {"question": "WWW stands for?", "answer": "World Wide Web"},
    {
      "question": "World Environment Day is celebrated on _.",
      "answer": "Jun-05"
    },
    {
      "question": "Plants that develop in dry conditions are?",
      "answer": "Xerophytes"
    },
    {
      "question": "Where is 'Great Bear Lake' found in the world?",
      "answer": "Canada"
    },
    {
      "question": "What is the full form of Wifi?",
      "answer": "Wireless Fidelity"
    },
    {
      "question": "Who is the writer of 'Panchathantra'?",
      "answer": "Vishnu Sharma"
    },
    {
      "question": "Who is the 14th President of India?",
      "answer": "Ram Nath Govind"
    },
    {
      "question": "Which is the biggest bone in the human body?",
      "answer": "Femur"
    },
    {
      "question": "Who was the inventor of the light bulb?",
      "answer": "Thomas Alwa Edison"
    },
    {
      "question":
      "Opium is obtained from the dry latex from which part of the Papaver somniferum Plant?",
      "answer": "Poppy"
    },
    {
      "question": "Which Vitamin helps to heal the wound?",
      "answer": "Vitamin C"
    },
    {
      "question": "Which is the mineral found in teeth and limestones?",
      "answer": "Calcium"
    },
    {
      "question":
      "Who was at the helm of the Philadelphia Phillies in the 2011 season?",
      "answer": "Charlie Manuel"
    },
    {"question": "Which is the largest lake in Japan?", "answer": "Biwa"},
    {
      "question": "What is the weight of a cricket ball?",
      "answer": "5.75 ounces"
    },
    {"question": "Which is the only even prime number?", "answer": "2"},
    {"question": "Who invented the number zero?", "answer": "Aryabhatta"},
    {"question": "How many degrees are there in a circle?", "answer": "360"},
    {"question": "What is the shape of dice?", "answer": "Cube"},
    {
      "question": "How many decimal points are there in a number?",
      "answer": "One"
    },
    {"question": "How many seconds are there in an hour?", "answer": "3600"},
    {
      "question": "A triangle with all side equal is called?",
      "answer": "Equilateral triangle"
    },
    {"question": "Which is the first odd composite number?", "answer": "33"},
    {
      "question": "What is a polygon with five sides called?",
      "answer": "Pentagon"
    },
    {"question": "How many years is a decade?", "answer": "Ten"},
    {"question": "A raindrop is of which geometric shape?", "answer": "Sphere"},
    {"question": "What is the approximate value of pi?", "answer": "3.14"},
    {"question": "90 minutes amount to ___ hours?", "answer": "1.5"},
    {"question": "What is the value of Golden Ratio?", "answer": "1.618"},
    {
      "question":
      "What is a triangle with all three sides of different lengths called?",
      "answer": "Scalene triangle"
    },
    {
      "question": "Which polygon has opposite sides and angles equal?",
      "answer": "Parallelogram"
    },
    {"question": "Which number is neither prime nor composite?", "answer": "1"},
    {
      "question":
      "A polygon with all four sides and angles equal is called___?",
      "answer": "Square"
    },
    {"question": "How many seconds are there in a day?", "answer": "86400"},
    {
      "question": "How many sides does the base of a pyramid have?",
      "answer": "4"
    },
    {
      "question":
      "Fourth Buddhist council held during the reign of which emperor?",
      "answer": "Kanishka"
    },
    {
      "question": "In which year did Mahatma Gandhi start Dandi March?",
      "answer": "1930"
    },
    {
      "question": "Who is the founder of Chola Dynasty?",
      "answer": "Vijayalaya"
    },
    {"question": "Which was the first animal to go to space?", "answer": "Dog"},
    {
      "question": "Zawar mines are located in which Indian state?",
      "answer": "Rajasthan"
    },
    {
      "question":
      "Which country is the first in Asia to launch a plastics pact?",
      "answer": "India"
    },
    {"question": "What is the capital of Finland?", "answer": "Helsinki"},
    {
      "question": "Ozone layer is in which layer of the atmosphere?",
      "answer": "Stratosphere"
    },
    {"question": "What is the capital of Morocco?", "answer": "Mozambique"},
    {"question": "Which is the longest river in the world?", "answer": "Nile"},
    {
      "question": "Mount Aconcagua is located in which mountain ranges?",
      "answer": "Andes"
    },
    {
      "question":
      "Which Indian state was the first to introduce the 'Oak Tussar Industry'?",
      "answer": "Manipur"
    },
    {
      "question":
      "National Research Centre on Yak (NRCY) is located in which Indian state?",
      "answer": "Arunachal Pradesh"
    },
    {
      "question": "Which is the largest river on Earth?",
      "answer": "Amazon river"
    },
    {
      "question": "Which is the most spoken language in the world?",
      "answer": "Mandarin Chinese"
    },
    {
      "question": "Which is the highest mountain peak of India?",
      "answer": "Kanchenjunga"
    },
    {
      "question": "Who was the first president of the USA?",
      "answer": "George Washington"
    },
    {
      "question":
      "How many fundamental rights are mentioned in the Indian Constitution?",
      "answer": "6"
    },
    {
      "question": "Who is popularly known as the Napolean of India?",
      "answer": "Samudragupta"
    },
    {
      "question": "Who was known as Punjab Kesari?",
      "answer": "Lala Lajpat Rai"
    },
    {"question": "When is World Health Day observed?", "answer": "Apr-07"},
    {
      "question": "What was the theme of World Health Day 2022?",
      "answer": "Our Planet, Our Health"
    },
    {
      "question": "Which planet is known as the Morning/Evening star?",
      "answer": "Venus"
    },
    {
      "question": "Which continent invests the most in solar power?",
      "answer": "Asia"
    },
    {
      "question": "Who won the 2022 International Women of Courage Award?",
      "answer": "Rizwana Hassan"
    },
    {
      "question": "What is the theme for World Wildlife Day 2022?",
      "answer": "Recovering key species for ecosystem restoration"
    },
    {
      "question":
      "What is the name of ISRO's new humanoid robot that will go to space next?",
      "answer": "Vyommitra"
    },
    {
      "question": "Which country is known as the Pearl of the Orient Seas?",
      "answer": "Philippines"
    },
    {
      "question": "Who is known as the father of Indian nuclear program?",
      "answer": "Homi J Bhabha"
    },
    {"question": "Who invented radio?", "answer": "Guglielmo Marconi"},
    {
      "question": "Which is the longest river in Europe?",
      "answer": "Volga River"
    },
    {
      "question": "Which was the first metal used by Harappan civilization?",
      "answer": "Copper"
    },
    {
      "question": "Thomas Cup is related to which sport?",
      "answer": "Badminton"
    },
    {
      "question": "How many players are there in an ice hockey team?",
      "answer": "Six"
    },
    {"question": "Ryder Cup is related to which sport?", "answer": "Golf"},
    {"question": "Which country invented paper?", "answer": "China"},
    {
      "question":
      "Who has been reappointed as the President of the World Health Organization (WHO)?",
      "answer": "Tedros Ghebreyesus"
    },
    {
      "question": "Which day is observed as International Literacy Day?",
      "answer": "Sep-08"
    },
    {
      "question": "Who was known as the Missile Man of India?",
      "answer": "Dr. APJ Abdul Kalam"
    },
    {
      "question": "Name the marine animal known as 'sea cow'?",
      "answer": "Manatees"
    },
    {"question": "Which is the protein found in nails?", "answer": "Keratin"},
    {
      "question": "Which instrument is used to measure blood pressure?",
      "answer": "Sphygmomanometer"
    },
    {"question": "Which mineral is found in teeth?", "answer": "Calcium"},
    {
      "question": "Who is known as the 'father of vaccination'?",
      "answer": "Edward"
    },
    {"question": "Who invented radio?", "answer": "Guglielmo Marconi"},
    {
      "question": "Which is the longest river in Europe?",
      "answer": "Volga River"
    },
    {
      "question": "Which was the first metal used by Harappan civilization?",
      "answer": "Copper"
    },
    {
      "question": "Thomas Cup is related to which sport?",
      "answer": "Badminton"
    },
    {
      "question": "How many players are there in an ice hockey team?",
      "answer": "Six"
    },
    {"question": "Ryder Cup is related to which sport?", "answer": "Golf"},
    {"question": "Which country invented paper?", "answer": "China"},
    {
      "question":
      "Who has been reappointed as the President of the World Health Organization (WHO)?",
      "answer": "Tedros Ghebreyesus"
    },
    {
      "question": "Which day is observed as International Literacy Day?",
      "answer": "Sep-08"
    },
    {
      "question": "Who was known as the Missile Man of India?",
      "answer": "Dr. APJ Abdul Kalam"
    },
    {
      "question": "Name the marine animal known as 'sea cow'?",
      "answer": "Manatees"
    },
    {"question": "Which is the protein found in nails?", "answer": "Keratin"},
    {
      "question": "Which instrument is used to measure blood pressure?",
      "answer": "Sphygmomanometer"
    },
    {"question": "Which mineral is found in teeth?", "answer": "Calcium"},
    {
      "question": "Which acid is secreted in the stomach?",
      "answer": "Hydrochloric acid"
    },
    {
      "question": "Who is known as the 'father of vaccination'?",
      "answer": "Edward Jenner"
    },
    {
      "question": "Which is the slowest moving animal on Earth?",
      "answer": "The three-toed sloth"
    },
    {
      "question": "Which only metal in liquid form at room temperature?",
      "answer": "Mercury"
    },
    {
      "question": "Which is known as the Father of modern medicine?",
      "answer": "Hippocrates"
    },
    {
      "question": "Which scientist developed the Theory of Relativity?",
      "answer": "Albert Einstein"
    },
    {
      "question": "The air we breathe is majorly composed of which gas?",
      "answer": "Nitrogen"
    },
    {
      "question": "What is the chemical name of Vitamin C?",
      "answer": "Ascorbic acid"
    },
    {"question": "Plaster of Paris is made of ____?", "answer": "Gypsum"},
    {"question": "Hematite is the ore of which metal?", "answer": "Iron"},
    {"question": "Who discovered Penicillin?", "answer": "Alexander Fleming"},
    {
      "question":
      "Which planet has the biggest known volcano in our solar system?",
      "answer": "Mars"
    },
    {"question": "Who invented telephone?", "answer": "Alexander Graham Bell"},
    {
      "question": "World Homoeopathy Day is observed on ______",
      "answer": "Apr-10"
    },
    {"question": "What is the square of 42?", "answer": "1764"},
    {
      "question": "Baku is the capital of which country?",
      "answer": "Azerbaijan"
    },
    {"question": "Name the currency used in Japan?", "answer": "Yen"},
    {
      "question":
      "Which lake is situated in the border of countries, Peru and Bolivia?",
      "answer": "Lake Titicaca"
    },
    {
      "question":
      "The distance travelled by light in one year is called _______",
      "answer": "Light Year"
    },
    {"question": "When is World Hearing Day?", "answer": "Mar-23"},
    {
      "question": "What is the theme of World Hearing Day 2022?",
      "answer": "To hear for life, listen with care!"
    },
    {
      "question": "________________ is known as 'antisterility vitamin'?",
      "answer": "Vitamin E"
    },
    {
      "question": "Name a non-metal that conducts electricity?",
      "answer": "Graphite"
    },
    {
      "question":
      "Birth anniversary of Sardar Vallabhbhai Patel is observed as?",
      "answer": "National Unity Day (Rashtriya Ekta Divas)"
    },
    {"question": "Who discovered X-Rays?", "answer": "Wilhelm Conrad Roentgen"},
    {
      "question": "Name the main gases present in the Sun?",
      "answer": "Hydrogen and Helium"
    },
    {"question": "Name the capital of Kingdom of Bahrain?", "answer": "Manama"},
    {
      "question": "What is the theme of World Meteorological Day 2022?",
      "answer": "Early Warning and Early Action"
    },
    {"question": "What is the capital of Norway?", "answer": "Oslo"},
    {
      "question": "Name the compound necessary for photosynthesis in leaves?",
      "answer": "Chlorophyll"
    },
    {
      "question": "What are the tiny pores present in plant leaves called?",
      "answer": "Stomata"
    },
    {"question": "Who invented electricity?", "answer": "Benjamin Franklin"},
    {
      "question": "Name the continent known as 'Dark Continent'?",
      "answer": "Africa"
    },
    {
      "question": "______ is the hardest substance available on Earth.",
      "answer": "Diamond"
    },
    {
      "question": "Name the instrument used to measure atmospheric pressure",
      "answer": "Barometer"
    },
    {
      "question": "Who was the first woman to go to space?",
      "answer": "Valentina Tereshkova"
    },
    {"question": "Which bird is known for its intelligence?", "answer": "Owl"},
    {
      "question": "Which is the gas absorbed by plants?",
      "answer": "Carbon Dioxide"
    },
    {"question": "What is the capital of Denmark?", "answer": "Copenhagen"},
    {
      "question":
      "Olympic Games of which year were cancelled due to World War I?",
      "answer": "1916"
    },
    {
      "question": "How many players are there in a Kho Kho team?",
      "answer": "9"
    },
    {
      "question": "Who was the first President of the United States?",
      "answer": "George Washington"
    },
    {
      "question": "Name the continent with the highest population density?",
      "answer": "Asia"
    },
    {
      "question": "Beriberi disease is caused by the deficiency of _________",
      "answer": "Vitamin B"
    },
    {
      "question": "Scientific study of birds is called _______",
      "answer": "Ornithology"
    },
    {
      "question":
      "Name the organ responsible for blood purification in human body",
      "answer": "Kidney"
    },
    {
      "question":
      "What is the name of the process where excess water in plants gets released?",
      "answer": "Transpiration"
    },
    {
      "question":
      "What is the main source of energy produced through photosynthesis in plants?",
      "answer": "Glucose"
    },
    {
      "question": "The measure of moisture in the air is known as _________",
      "answer": "Humidity"
    },
    {"question": "A decagon has _______ sides.", "answer": "10"},
    {"question": "3 raised to power 0 is ________.", "answer": "1"},
    {"question": "Which is the smallest three-digit number?", "answer": "100"},
    {"question": "Which is the largest three-digit number?", "answer": "999"},
    {"question": "What is the cube root of 27?", "answer": "3"},
    {
      "question": "What is another name for Northern Lights?",
      "answer": "Aurora Boralis"
    },
    {
      "question": "There are a total of _____ time zones in the world.",
      "answer": "24"
    },
    {
      "question": "What is the full form of GPS?",
      "answer": "Global Positioning System"
    },
    {
      "question": "Which famous explorer discovered Cuba?",
      "answer": "Christopher Columbus"
    },
    {
      "question": "Which is the hardest substance on the human body?",
      "answer": "Tooth enamel"
    },
    {
      "question": "Where is the headquarters of UNESCO located?",
      "answer": "Paris, France"
    },
    {"question": "Which planet is known as Earth’s Twin?", "answer": "Venus"},
    {
      "question": "Which is the loudest animal on Earth?",
      "answer": "Sperm whale"
    },
    {
      "question": "Which blood group is known as 'universal donor'?",
      "answer": "O+"
    },
    {"question": "_____ is a flying mammal.", "answer": "Bat"},
    {
      "question": "Which animal has fingerprints similar to that of humans?",
      "answer": "Koala"
    },
    {"question": "What is the colour of polar bear’s skin?", "answer": "Black"},
    {"question": "Which protein is a fingernail made of?", "answer": "Keratin"},
    {"question": "Which bird can fly backward?", "answer": "Humming bird"},
    {
      "question": "Who was the first woman to win a Nobel Prize?",
      "answer": "Marie Curie (in the year 1903)"
    },
    {"question": "_____ is the warmest sea on Earth.", "answer": "Red Sea"},
    {
      "question": "Which is the fastest snake in the world?",
      "answer": "Black Mamba"
    },
    {
      "question": "Which is the largest organ in the human body?",
      "answer": "Skin"
    },
    {"question": "Which is the largest lake in Japan?", "answer": "Biwa"},
    {
      "question": "Name the vitamin that helps to heal wounds?",
      "answer": "Vitamin C"
    },
    {
      "question": "Equilateral polygons have all ______ equal.",
      "answer": "Sides"
    },
    {
      "question":
      "Which country does famous footballer Lionel Messi belong to?",
      "answer": "Argentina"
    },
    {"question": "The atomic number of Iron (Fe) is _____.", "answer": "26"},
    {
      "question": "What is the capital of United Arab Emirates (UAE)?",
      "answer": "Abu Dhabi"
    },
    {
      "question": "Golfer Vijay Singh belongs to which country?",
      "answer": "Fiji"
    },
    {
      "question": "Which blood cells do not have a nucleus?",
      "answer": "Blood platelets"
    },
    {
      "question": "Who authored the renowned novel 'The Godfather'?",
      "answer": "Mario Puzo"
    },
    {
      "question": "RAM is located in which part of the computer?",
      "answer": "Mother board"
    },
    {
      "question": "Name the brain part that controls balance?",
      "answer": "Cerebellum"
    }

  ];

  @override
  void initState() {
    super.initState();
    // Shuffle the dataset and pick the first 3 questions
    shuffledQuestions = List.from(questionsDataset)..shuffle();
    shuffledQuestions = shuffledQuestions.take(3).toList(); // Take only 3 questions
  }

  @override
  Widget build(BuildContext context) {
    double progress = (currentQuestionIndex + 1) / shuffledQuestions.length;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Level 3 - Hard",
          style: GoogleFonts.fredoka(
            textStyle: const TextStyle(fontSize: 24, color: Colors.white),
          ),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Question display container with shadow
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
                  textStyle: const TextStyle(fontSize: 18, color: Colors.black87),
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 30),

            // Answer TextField with rounded corners
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
                fillColor: Colors.blue.shade50,
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

            // Submit button
            ElevatedButton(
              onPressed: () {
                String userAnswer = _answerController.text.trim().toLowerCase();
                String correctAnswer = shuffledQuestions[currentQuestionIndex]['answer']!.toLowerCase();

                setState(() {
                  if (userAnswer == correctAnswer) {
                    score2++;
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

                  if (currentQuestionIndex < shuffledQuestions.length - 1) {
                    currentQuestionIndex++;
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Score(
                          level1Score: widget.level1Score, // Pass Level 1 score
                          level2Score: widget.level2Score, // Pass Level 2 score
                          level3Score: score2, userId: '', // Pass Level 3 score
                          // Name: widget.userName,
                          // game_No: '', // Add game name if applicable
                          // email: '', userId: '', // Add email if applicable
                        ),
                      ),
                    );
                  }
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
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

            // Progress bar
            LinearProgressIndicator(
              value: progress,
              backgroundColor: Colors.grey.shade300,
              color: Colors.pink,
              minHeight: 10,
            ),
            const SizedBox(height: 10),
            Text(
              "Progress: ${(progress * 100).toInt()}%  (${currentQuestionIndex + 1}/${shuffledQuestions.length})",
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
