import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  final List<Map<String, String>> newsData = const [
    {
      "headline": "ASF Outbreak in Trichy",
      "description": "African Swine Fever (ASF) has been detected in multiple pig farms in Trichy district. Authorities are enforcing strict quarantine measures and biosecurity protocols to prevent further spread. Farmers are advised to isolate infected animals, avoid movement between farms, and report any new cases immediately to veterinary officials. Continuous monitoring and vaccination campaigns are planned to control the outbreak effectively..",
      "image": "assets/images/pig.jpg"
    },
    {
      "headline": "AI Detected in Chennai Poultry",
      "description": "Avian Influenza (AI) has been confirmed in several poultry farms around Chennai. The Department of Animal Husbandry urges farmers to follow stringent hygiene practices, including disinfecting equipment, limiting farm access, and promptly reporting sick birds. Immediate culling of affected poultry is recommended to minimize losses, while neighboring farms must remain on alert. Health workers are conducting awareness campaigns for proper handling and biosecurity compliance.",
      "image": "assets/images/hen.jpg"
    },
    {
      "headline": "Vaccination Drive in Madurai",
      "description": "A large-scale vaccination campaign has been launched in Madurai to protect pigs and chickens from prevalent infectious diseases. Veterinary officials are coordinating with local farmers",
      "image": "assets/images/bird.jpg"
    },
    {
      "headline": "New Biosecurity Guidelines",
      "description": "veterinary authorities have released comprehensive biosecurity guidelines for farms to prevent disease outbreaks. The guidelines cover farm sanitation, animal handling, visitor restrictions, and monitoring of animal health. Farmers are encouraged to implement strict quarantine protocols for new animals, maintain proper waste management, and conduct regular health checks. Adoption of these measures is crucial to ensure long-term disease prevention and safeguard livestock productivity.",
      "image": "assets/images/chicken.jpg"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Latest News"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ListView.builder(
          itemCount: newsData.length,
          itemBuilder: (context, index) {
            final news = newsData[index];
            return Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: FlipCard(
                direction: FlipDirection.HORIZONTAL, // flip horizontally
                front: _buildFrontCard(news),
                back: _buildBackCard(news),
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFrontCard(Map<String, String> news) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      child: SizedBox(
        height: 200,
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                news["image"]!,
                width: double.infinity,
                height: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [Colors.black.withOpacity(0.6), Colors.transparent],
                ),
              ),
            ),
            Positioned(
              bottom: 16,
              left: 16,
              right: 16,
              child: Text(
                news["headline"]!,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  shadows: [Shadow(blurRadius: 4, color: Colors.black)],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBackCard(Map<String, String> news) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.green.shade50,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Text(
            news["description"]!,
            style: const TextStyle(fontSize: 16, color: Colors.black87),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
