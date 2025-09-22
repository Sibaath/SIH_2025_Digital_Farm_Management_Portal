import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'quiz.dart';

class LearningResourcePage extends StatefulWidget {
  const LearningResourcePage({super.key});

  @override
  State<LearningResourcePage> createState() => _LearningResourcePageState();
}

class _LearningResourcePageState extends State<LearningResourcePage>
    with SingleTickerProviderStateMixin {
  final Map<String, List<String>> learningSections = {
    "Hygiene Practices": [
      "Wash hands before and after handling animals.",
      "Disinfect equipment and footwear.",
      "Quarantine new animals.",
      "Keep housing clean and dry.",
      "Use protective clothing.",
      "Dispose of waste properly.",
      "Limit visitors to the farm.",
      "Avoid sharing equipment."
    ],



    // ... other sections
  };

  late final AnimationController _controller;
  late YoutubePlayerController _youtubeController;

  final String youtubeUrl = "https://youtu.be/XdKRY1Hf9hA?si=2XWw_SI0X2K66Ol5"; // replace with actual video

  @override
  void initState() {
    super.initState();

    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 1))
      ..forward();

    _youtubeController = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeUrl)!,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    _youtubeController.dispose();
    super.dispose();
  }

  Widget buildSection(String title, List<String> points, double screenWidth) {
    return FadeTransition(
      opacity: _controller,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 12),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 4,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(title,
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green)),
              const SizedBox(height: 10),
              ...points.map(
                    (p) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4.0),
                  child: Text("• $p",
                      style: const TextStyle(fontSize: 16, color: Colors.black)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(title: const Text("Biosecurity Learning"), backgroundColor: Colors.green),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Sections
            ...learningSections.entries
                .map((e) => SizedBox(
                width: screenWidth, child: buildSection(e.key, e.value, screenWidth)))
                .toList(),
            const SizedBox(height: 20),
            // YouTube Player
            YoutubePlayer(
              controller: _youtubeController,
              showVideoProgressIndicator: true,
              progressIndicatorColor: Colors.green,
              width: screenWidth-500,

            ),
            const SizedBox(height: 20),
            // Quiz Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12)),
                ),
                icon: const Icon(Icons.quiz, color: Colors.white),
                label: const Text(
                  "Take Quiz",
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
                onPressed: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (_) => const QuizPage()));
                },
              ),
            ),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
