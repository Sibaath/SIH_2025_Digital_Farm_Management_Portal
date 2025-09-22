import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// Make sure you have a HomePage widget to navigate to
import 'homepage.dart'; // Update this import according to your project structure

class FeedbackScreen extends StatefulWidget {
  const FeedbackScreen({super.key});

  @override
  State<FeedbackScreen> createState() => _FeedbackScreenState();
}

class _FeedbackScreenState extends State<FeedbackScreen> {
  // Star rating
  int _rating = 0;

  // Productivity dropdown
  String? _productivity;

  // Multi-select UI points
  List<String> _uiPoints = [];

  // Features satisfaction dropdown
  String? _featuresSatisfaction;

  // Likelihood to recommend dropdown
  String? _recommendation;

  // Optional feedback
  final TextEditingController _feedbackController = TextEditingController();

  // Form progress
  double _formProgress = 0.0;

  // Options
  final List<String> productivityOptions = [
    "Very well",
    "Good",
    "No change",
    "Decreased"
  ];

  final List<String> uiOptions = [
    "Design",
    "Navigation",
    "Colors",
    "Responsiveness",
    "Other"
  ];

  final List<String> featureOptions = [
    "Easy to use",
    "Fast",
    "Useful features",
    "Reliable",
  ];

  final List<String> recommendationOptions = [
    "Definitely",
    "Maybe",
    "Not likely",
  ];

  void _updateProgress() {
    int filled = 0;
    if (_productivity != null) filled++;
    if (_uiPoints.isNotEmpty) filled++;
    if (_featuresSatisfaction != null) filled++;
    if (_recommendation != null) filled++;
    if (_rating > 0) filled++;
    setState(() {
      _formProgress = filled / 5;
    });
  }

  void _setRating(int value) {
    setState(() {
      _rating = value;
    });
    _updateProgress();
  }

  void _submitFeedback() {
    if (_rating == 0 ||
        _productivity == null ||
        _uiPoints.isEmpty ||
        _featuresSatisfaction == null ||
        _recommendation == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Please fill all required fields"),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    // Show success animation before navigating to HomePage
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(); // Close dialog
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const HomePage()));
        });

        return Center(
          child: Lottie.network(
            'https://assets6.lottiefiles.com/packages/lf20_jbrw3hcz.json',
            width: 100,
            height: 100,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    // Widget to show question with red * for mandatory
    Widget questionText(String text, {bool mandatory = false}) {
      return Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: RichText(
          text: TextSpan(
            text: text,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: screenWidth * 0.015,
              color: Colors.green,
            ),
            children: mandatory
                ? [
              const TextSpan(
                  text: " *",
                  style: TextStyle(color: Colors.red)),
            ]
                : [],
          ),
        ),
      );
    }

    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Question 1: Productivity
            questionText("How well did productivity increase?", mandatory: true),
            DropdownButtonFormField<String>(
              value: _productivity,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: productivityOptions
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {
                setState(() => _productivity = val);
                _updateProgress();
              },
            ),
            const SizedBox(height: 16),

            // Question 2: UI Points
            questionText("Points on UI of the app:", mandatory: true),
            Wrap(
              spacing: 8,
              children: uiOptions.map((point) {
                final selected = _uiPoints.contains(point);
                return FilterChip(
                  label: Text(point),
                  selected: selected,
                  selectedColor: Colors.green.withOpacity(0.3),
                  onSelected: (val) {
                    setState(() {
                      if (val) {
                        _uiPoints.add(point);
                      } else {
                        _uiPoints.remove(point);
                      }
                    });
                    _updateProgress();
                  },
                );
              }).toList(),
            ),
            const SizedBox(height: 16),

            // Question 3: Features satisfaction
            questionText("Features satisfaction:", mandatory: true),
            DropdownButtonFormField<String>(
              value: _featuresSatisfaction,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: featureOptions
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {
                setState(() => _featuresSatisfaction = val);
                _updateProgress();
              },
            ),
            const SizedBox(height: 16),

            // Question 4: Likelihood to recommend
            questionText("Likelihood to recommend:", mandatory: true),
            DropdownButtonFormField<String>(
              value: _recommendation,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              items: recommendationOptions
                  .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                  .toList(),
              onChanged: (val) {
                setState(() => _recommendation = val);
                _updateProgress();
              },
            ),
            const SizedBox(height: 16),

            // Question 5: Additional feedback (optional)
            questionText("Additional feedback"),
            TextField(
              controller: _feedbackController,
              maxLines: 4,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Question 6: Overall experience (star rating)
            questionText("Overall experience:", mandatory: true),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return IconButton(
                  icon: Icon(
                    index < _rating ? Icons.star : Icons.star_border,
                    color: Colors.amber, // GOLD color
                    size: screenWidth * 0.07,
                  ),
                  onPressed: () => _setRating(index + 1),
                );
              }),
            ),
            const SizedBox(height: 20),

            // Progress bar
            LinearProgressIndicator(
              value: _formProgress,
              color: Colors.green,
              backgroundColor: Colors.green.withOpacity(0.2),
              minHeight: 8,
            ),
            const SizedBox(height: 20),

            // Submit button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                icon: const Icon(Icons.send, color: Colors.white),
                label: const Text(
                  "Submit",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                onPressed: _submitFeedback,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
