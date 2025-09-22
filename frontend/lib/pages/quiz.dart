import 'package:flutter/material.dart';
import 'homepage.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final List<Map<String, dynamic>> _questions = [
    {
      "question": "Hand washing is important before handling animals?",
      "options": ["Yes", "No", "Sometimes", "Never"],
      "answer": "Yes"
    },
    {
      "question": "New animals should be quarantined before introduction?",
      "options": ["Yes", "No", "Sometimes", "Never"],
      "answer": "Yes"
    },
    {
      "question": "Disinfecting equipment prevents disease spread?",
      "options": ["Yes", "No", "Maybe", "Sometimes"],
      "answer": "Yes"
    },
    {
      "question": "Protective clothing is optional when handling sick animals?",
      "options": ["Yes", "No", "Depends", "Sometimes"],
      "answer": "No"
    },
    {
      "question": "Animal waste can be disposed anywhere?",
      "options": ["Yes", "No", "Sometimes", "Depends"],
      "answer": "No"
    },
    {
      "question": "Visitors should be limited on a farm?",
      "options": ["Yes", "No", "Sometimes", "Depends"],
      "answer": "Yes"
    },
    {
      "question": "Equipment should be shared without cleaning?",
      "options": ["Yes", "No", "Sometimes", "Depends"],
      "answer": "No"
    },
    {
      "question": "Vaccination schedules are not important?",
      "options": ["Yes", "No", "Sometimes", "Depends"],
      "answer": "No"
    },
    {
      "question": "Animals should be monitored daily?",
      "options": ["Yes", "No", "Sometimes", "Depends"],
      "answer": "Yes"
    },
    {
      "question": "Keeping housing clean helps prevent disease?",
      "options": ["Yes", "No", "Sometimes", "Depends"],
      "answer": "Yes"
    },
  ];

  final Map<int, String> _selectedOptions = {}; // stores selected option per question

  void _showScoreDialog() {
    int score = 0;
    for (int i = 0; i < _questions.length; i++) {
      if (_selectedOptions[i] == _questions[i]['answer']) score++;
    }

    showDialog(
      context: context,
      builder: (_) => AlertDialog(
        title: const Text("Quiz Completed"),
        content: Text("Your Score: $score / ${_questions.length}"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
            },
            child: const Text("OK"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context); // Close dialog
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ReviewPage(
                    questions: _questions,
                    selectedOptions: _selectedOptions,
                  ),
                ),
              );
            },
            child: const Text("Review"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Biosecurity Quiz"),
        backgroundColor: Colors.green,
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          padding: const EdgeInsets.all(16),
          itemCount: _questions.length,
          itemBuilder: (context, qIndex) {
            final question = _questions[qIndex];

            return AnimationConfiguration.staggeredList(
              position: qIndex,
              duration: const Duration(milliseconds: 500),
              child: SlideAnimation(
                verticalOffset: 50.0,
                child: FadeInAnimation(
                  child: Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Q${qIndex + 1}: ${question['question']}",
                            style: TextStyle(
                                fontSize: screenWidth * 0.014,
                                fontWeight: FontWeight.bold,
                                color: Colors.green),
                          ),
                          const SizedBox(height: 12),
                          ...List.generate(question['options'].length, (oIndex) {
                            final option = question['options'][oIndex];
                            final isSelected = _selectedOptions[qIndex] == option;
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  _selectedOptions[qIndex] = option;
                                });
                              },
                              child: AnimatedContainer(
                                duration: const Duration(milliseconds: 200),
                                curve: Curves.easeInOut,
                                margin: const EdgeInsets.symmetric(vertical: 6),
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  color: isSelected
                                      ? Colors.green.withOpacity(0.3)
                                      : Colors.black12,
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(
                                      color: isSelected ? Colors.green : Colors.transparent,
                                      width: 2),
                                ),
                                child: Row(
                                  children: [
                                    Checkbox(
                                        value: isSelected,
                                        onChanged: (v) {
                                          setState(() {
                                            _selectedOptions[qIndex] = option;
                                          });
                                        },
                                        activeColor: Colors.green),
                                    const SizedBox(width: 8),
                                    Text(option,
                                        style: TextStyle(
                                            fontSize: screenWidth * 0.012,
                                            color: Colors.black)),
                                  ],
                                ),
                              ),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.green,
        onPressed: _showScoreDialog,
        icon: const Icon(Icons.check),
        label: const Text("Submit"),
      ),
    );
  }
}

class ReviewPage extends StatelessWidget {
  final List<Map<String, dynamic>> questions;
  final Map<int, String> selectedOptions;

  const ReviewPage(
      {super.key, required this.questions, required this.selectedOptions});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          title: const Text("Quiz Review"), backgroundColor: Colors.green),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Expanded(
              child: AnimationLimiter(
                child: ListView.builder(
                  itemCount: questions.length,
                  itemBuilder: (context, qIndex) {
                    final question = questions[qIndex];

                    return AnimationConfiguration.staggeredList(
                      position: qIndex,
                      duration: const Duration(milliseconds: 500),
                      child: SlideAnimation(
                        verticalOffset: 50,
                        child: FadeInAnimation(
                          child: Card(
                            margin: const EdgeInsets.only(bottom: 16),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12)),
                            elevation: 3,
                            child: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Q${qIndex + 1}: ${question['question']}",
                                      style: TextStyle(
                                          fontSize: screenWidth * 0.014,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green),
                                    ),
                                    const SizedBox(height: 12),
                                    ...List.generate(
                                        question['options'].length, (oIndex) {
                                      final option = question['options'][oIndex];
                                      final isSelected = selectedOptions[qIndex] == option;
                                      final isCorrect = question['answer'] == option;
                                      return Container(
                                        margin: const EdgeInsets.symmetric(vertical: 6),
                                        padding: const EdgeInsets.all(12),
                                        decoration: BoxDecoration(
                                          color: isSelected
                                              ? (isCorrect
                                              ? Colors.green.withOpacity(0.3)
                                              : Colors.red.withOpacity(0.3))
                                              : Colors.black12,
                                          borderRadius: BorderRadius.circular(12),
                                          border: Border.all(
                                              color: isCorrect
                                                  ? Colors.green
                                                  : Colors.transparent,
                                              width: 2),
                                        ),
                                        child: Row(
                                          children: [
                                            Checkbox(
                                                value: isSelected,
                                                onChanged: null,
                                                activeColor: Colors.green),
                                            const SizedBox(width: 8),
                                            Text(option,
                                                style: TextStyle(
                                                    fontSize: screenWidth * 0.012,
                                                    color: Colors.black)),
                                          ],
                                        ),
                                      );
                                    }),
                                  ]),
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            // Close Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(builder: (_) => const HomePage()),
                          (route) => false); // remove all previous routes
                },
                child: const Text(
                  "Close",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
