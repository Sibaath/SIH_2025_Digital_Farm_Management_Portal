import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';
import 'package:flutter_tts/flutter_tts.dart';

class NewsScreen extends StatefulWidget {
  const NewsScreen({super.key});

  @override
  NewsScreenState createState() => NewsScreenState();
}

class NewsScreenState extends State<NewsScreen>
    with TickerProviderStateMixin {
  late FlutterTts _flutterTts;
  late AnimationController _refreshController;
  late Animation<double> _refreshAnimation;
  
  bool _isLoading = false;
  String _currentLanguage = 'en';
  bool _isSpeaking = false;
  String _speakingNewsId = '';

  // Enhanced news data with Tamil translations
  final List<Map<String, dynamic>> newsData = [
    {
      "id": "news_1",
      "headline": "ASF Outbreak in Trichy District",
      "headlineTamil": "திருச்சி மாவட்டத்தில் ஆஃப்ரிக்கன் பன்றி காய்ச்சல்",
      "description": "African Swine Fever (ASF) has been detected in multiple pig farms in Trichy district. Authorities are enforcing strict quarantine measures and biosecurity protocols to prevent further spread. Farmers are advised to isolate infected animals, avoid movement between farms, and report any new cases immediately to veterinary officials. Continuous monitoring and vaccination campaigns are planned to control the outbreak effectively.",
      "descriptionTamil": "திருச்சி மாவட்டத்தில் பல பன்றி பண்ணைகளில் ஆஃப்ரிக்கன் பன்றி காய்ச்சல் (ASF) கண்டறியப்பட்டுள்ளது. மேலும் பரவுவதைத் தடுக்க அதிகாரிகள் கடுமையான தனிமைப்படுத்துதல் நடவடிக்கைகள் மற்றும் உயிர்பாதுகாப்பு நெறிமுறைகளை அமல்படுத்துகின்றனர். விவசாயிகள் பாதிக்கப்பட்ட விலங்குகளை தனிமைப்படுத்தவும், பண்ணைகளுக்கு இடையே நடமாட்டத்தைத் தவிர்க்கவும், புதிய வழக்குகளை உடனடியாக கால்நடை அதிகாரிகளிடம் தெரிவிக்கவும் அறிவுறுத்தப்படுகிறார்கள்.",
      "image": "https://images.unsplash.com/photo-1416879595882-3373a0480b5b?w=400",
      "category": "Health Alert",
      "categoryTamil": "உடல்நலம் எச்சரிக்கை",
      "date": "2024-01-15",
      "severity": "High"
    },
    {
      "id": "news_2",
      "headline": "Avian Influenza Detection in Chennai Poultry",
      "headlineTamil": "சென்னை கோழிப்பண்ணையில் பறவை காய்ச்சல்",
      "description": "Avian Influenza (AI) has been confirmed in several poultry farms around Chennai. The Department of Animal Husbandry urges farmers to follow stringent hygiene practices, including disinfecting equipment, limiting farm access, and promptly reporting sick birds. Immediate culling of affected poultry is recommended to minimize losses, while neighboring farms must remain on alert.",
      "descriptionTamil": "சென்னையைச் சுற்றியுள்ள பல கோழிப் பண்ணைகளில் பறவை காய்ச்சல் (AI) உறுதிப்படுத்தப்பட்டுள்ளது. கால்நடை வளர்ப்புத் துறை விவசாயிகளை கடுமையான சுகாதார நடைமுறைகளை பின்பற்றுமாறு வலியுறுத்துகிறது. இதில் உபकரணங்களை கிருமிநாசினி செய்தல், பண்ணை அணுகலை கட்டுப்படுத்துதல், மற்றும் நோய்வாய்ப்பட்ட பறவைகளை உடனடியாக தெரிவிப்பது ஆகியவை அடங்கும்.",
      "image": "https://images.unsplash.com/photo-1548550023-2bdb3c5beed7?w=400",
      "category": "Disease Alert",
      "categoryTamil": "நோய் எச்சரிக்கை",
      "date": "2024-01-12",
      "severity": "High"
    },
    {
      "id": "news_3",
      "headline": "Mass Vaccination Campaign in Madurai",
      "headlineTamil": "மதுரையில் பெரும் தடுப்பூசி பிரச்சாரம்",
      "description": "A large-scale vaccination campaign has been launched in Madurai to protect livestock from prevalent infectious diseases. Veterinary officials are coordinating with local farmers to ensure comprehensive coverage. The campaign includes vaccinations for Foot and Mouth Disease, Classical Swine Fever, and Newcastle Disease. Free veterinary consultation and health check-ups are also being provided.",
      "descriptionTamil": "பரவலான தொற்று நோய்களிலிருந்து கால்நடைகளைப் பாதுகாக்க மதுரையில் பெரிய அளவிலான தடுப்பூசி பிரச்சாரம் தொடங்கப்பட்டுள்ளது. கால்நடை அதிகாரிகள் உள்ளூர் விவசாயிகளுடன் ஒருங்கிணைத்து விரிவான கவரேஜை உறுதிப்படுத்துகின்றனர். இந்த பிரச்சாரத்தில் கால் மற்றும் வாய் நோய், பாரம்பரிய பன்றி காய்ச்சல் மற்றும் நியூகேசில் நோய்க்கான தடுப்பூசிகள் அடங்கும்.",
      "image": "https://plus.unsplash.com/premium_photo-1726768886710-92e78c6272df?q=80&w=1170&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D",
      "category": "Prevention",
      "categoryTamil": "தடுப்பு",
      "date": "2024-01-10",
      "severity": "Medium"
    },
    {
      "id": "news_4",
      "headline": "Updated Biosecurity Guidelines Released",
      "headlineTamil": "புதுப்பிக்கப்பட்ட உயிர்பாதுகாப்பு வழிகாட்டுதல்கள்",
      "description": "State veterinary authorities have released comprehensive biosecurity guidelines for farms to prevent disease outbreaks. The guidelines cover farm sanitation, animal handling, visitor restrictions, and monitoring of animal health. Farmers are encouraged to implement strict quarantine protocols for new animals, maintain proper waste management, and conduct regular health checks.",
      "descriptionTamil": "மாநில கால்நடை அதிகாரிகள் நோய் வெடிப்புகளைத் தடுக்க பண்ணைகளுக்கான விரிவான உயிர்பாதுகாப்பு வழிகாட்டுதல்களை வெளியிட்டுள்ளனர். வழிகாட்டுதல்களில் பண்ணை சுகாதாரம், விலங்கு கையாளுதல், பார்வையாளர் கட்டுப்பாடுகள் மற்றும் விலங்குகளின் ஆரோக்கியத்தை கண்காணித்தல் ஆகியவை அடங்கும். புதிய விலங்குகளுக்கு கடுமையான தனிமைப்படுத்துதல் நெறிமுறைகளை செயல்படுத்துமாறு விவசாயிகள் ஊக்குவிக்கப்படுகிறார்கள்.",
      "image": "https://images.unsplash.com/photo-1500595046743-cd271d694d30?w=400",
      "category": "Guidelines",
      "categoryTamil": "வழிகாட்டுதல்கள்",
      "date": "2024-01-08",
      "severity": "Low"
    },
  ];

  @override
  void initState() {
    super.initState();
    _initializeTts();
    _refreshController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _refreshAnimation = CurvedAnimation(
      parent: _refreshController,
      curve: Curves.easeInOut,
    );
  }

  void _initializeTts() async {
    _flutterTts = FlutterTts();
    await _flutterTts.setLanguage(_currentLanguage == 'ta' ? 'ta-IN' : 'en-US');
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);

    _flutterTts.setCompletionHandler(() {
      setState(() {
        _isSpeaking = false;
        _speakingNewsId = '';
      });
    });
  }

  void _toggleLanguage() {
    setState(() {
      _currentLanguage = _currentLanguage == 'en' ? 'ta' : 'en';
    });
    _initializeTts();
  }

  void _refreshNews() async {
    setState(() => _isLoading = true);
    _refreshController.forward();
    
    // Simulate network refresh
    await Future.delayed(const Duration(seconds: 2));
    
    setState(() => _isLoading = false);
    _refreshController.reset();
    
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('News updated successfully!'),
        backgroundColor: Colors.green,
        duration: Duration(seconds: 2),
      ),
    );
  }

  void _speakNews(Map<String, dynamic> news) async {
    if (_isSpeaking && _speakingNewsId == news['id']) {
      await _flutterTts.stop();
      setState(() {
        _isSpeaking = false;
        _speakingNewsId = '';
      });
      return;
    }

    if (_isSpeaking) {
      await _flutterTts.stop();
    }

    setState(() {
      _isSpeaking = true;
      _speakingNewsId = news['id'];
    });

    String textToSpeak = _currentLanguage == 'ta' 
        ? "${news['headlineTamil']}. ${news['descriptionTamil']}"
        : "${news['headline']}. ${news['description']}";

    await _flutterTts.speak(textToSpeak);
  }

  Color _getSeverityColor(String severity) {
    switch (severity.toLowerCase()) {
      case 'high':
        return Colors.red;
      case 'medium':
        return Colors.orange;
      case 'low':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      body: Column(
        children: [
          // Custom Header for the page
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 5.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _currentLanguage == 'ta' ? 'சமீபத்திய செய்திகள்' : 'Latest News',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  children: [
                    // Language toggle
                    IconButton(
                      icon: const Icon(Icons.language),
                      onPressed: _toggleLanguage,
                      tooltip: _currentLanguage == 'en' ? 'Switch to Tamil' : 'Switch to English',
                    ),
                    // Refresh button
                    AnimatedBuilder(
                      animation: _refreshAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _refreshAnimation.value * 2 * 3.14159,
                          child: IconButton(
                            icon: const Icon(Icons.refresh),
                            onPressed: _isLoading ? null : _refreshNews,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Language indicator
          if (_currentLanguage == 'ta')
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              color: Colors.orange.shade100,
              child: Row(
                children: [
                  Icon(Icons.language, size: 16, color: Colors.orange.shade700),
                  const SizedBox(width: 8),
                  Text(
                    'Tamil Mode Active',
                    style: TextStyle(
                      color: Colors.orange.shade700,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),

          // News count and filter
          Container(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    _currentLanguage == 'ta' 
                      ? '${newsData.length} செய்திகள் கிடைத்துள்ளன'
                      : '${newsData.length} News Updates Available',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.shade700,
                    ),
                  ),
                ),
                if (_isLoading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
              ],
            ),
          ),

          // News list
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ListView.builder(
                itemCount: newsData.length,
                itemBuilder: (context, index) {
                  final news = newsData[index];
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: _buildNewsCard(news, index),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNewsCard(Map<String, dynamic> news, int index) {
    return FlipCard(
      direction: FlipDirection.HORIZONTAL,
      speed: 600,
      onFlipDone: (status) {
        // Optional: Add haptic feedback or analytics
      },
      front: _buildFrontCard(news, index),
      back: _buildBackCard(news, index),
    );
  }

  Widget _buildFrontCard(Map<String, dynamic> news, int index) {
    return Hero(
      tag: 'news_card_$index',
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        shadowColor: Colors.green.withOpacity(0.3),
        child: Container(
          height: 220,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white,
                Colors.green.shade50,
              ],
            ),
          ),
          child: Stack(
            children: [
              // Background image
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  news["image"]!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey.shade200,
                      child: Center(
                        child: CircularProgressIndicator(
                          color: Colors.green,
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded / 
                                loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey.shade300,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image_not_supported, 
                            size: 50, color: Colors.grey.shade600),
                          const SizedBox(height: 8),
                          Text('Image not available',
                            style: TextStyle(color: Colors.grey.shade600)),
                        ],
                      ),
                    );
                  },
                ),
              ),
              
              // Gradient overlay
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  gradient: LinearGradient(
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                    colors: [
                      Colors.black.withOpacity(0.8),
                      Colors.black.withOpacity(0.3),
                      Colors.transparent,
                    ],
                  ),
                ),
              ),

              // Severity indicator
              Positioned(
                top: 12,
                right: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: _getSeverityColor(news['severity']),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    news['severity'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),

              // Category badge
              Positioned(
                top: 12,
                left: 12,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.green.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    _currentLanguage == 'ta' 
                        ? news['categoryTamil'] 
                        : news['category'],
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),

              // Content
              Positioned(
                bottom: 16,
                left: 16,
                right: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _currentLanguage == 'ta' 
                          ? news["headlineTamil"]! 
                          : news["headline"]!,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            blurRadius: 4,
                            color: Colors.black,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today, 
                          color: Colors.white70, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          news['date'],
                          style: const TextStyle(
                            color: Colors.white70,
                            fontSize: 12,
                          ),
                        ),
                        const Spacer(),
                        Container(
                          padding: const EdgeInsets.all(4),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.2),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Icon(
                            Icons.flip_to_back,
                            color: Colors.white,
                            size: 16,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBackCard(Map<String, dynamic> news, int index) {
    return Hero(
      tag: 'news_back_$index',
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 6,
        shadowColor: Colors.green.withOpacity(0.3),
        child: Container(
          height: 220,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.green.shade50,
                Colors.white,
                const Color.fromARGB(255, 103, 243, 108),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header with actions
              Row(
                children: [
                  Expanded(
                    child: Text(
                      _currentLanguage == 'ta' 
                          ? news["headlineTamil"]! 
                          : news["headline"]!,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.green.shade800,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  // Play/Stop button
                  IconButton(
                    onPressed: () => _speakNews(news),
                    icon: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 300),
                      child: _isSpeaking && _speakingNewsId == news['id']
                          ? const Icon(Icons.stop_circle, 
                              key: ValueKey('stop'), color: Colors.red)
                          : const Icon(Icons.play_circle_fill, 
                              key: ValueKey('play'), color: Colors.green),
                    ),
                    tooltip: _isSpeaking && _speakingNewsId == news['id']
                        ? 'Stop reading'
                        : 'Read aloud',
                  ),
                ],
              ),

              const SizedBox(height: 12),

              // Description
              Expanded(
                child: SingleChildScrollView(
                  child: Text(
                    _currentLanguage == 'ta' 
                        ? news["descriptionTamil"]! 
                        : news["description"]!,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey.shade800,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.justify,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Bottom actions
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    decoration: BoxDecoration(
                      color: _getSeverityColor(news['severity']).withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: _getSeverityColor(news['severity']).withOpacity(0.3),
                      ),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            color: _getSeverityColor(news['severity']),
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 4),
                        Text(
                          news['severity'],
                          style: TextStyle(
                            color: _getSeverityColor(news['severity']),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      color: Colors.green.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      Icons.flip_to_front,
                      color: Colors.green.shade700,
                      size: 16,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _flutterTts.stop();
    _refreshController.dispose();
    super.dispose();
  }
}