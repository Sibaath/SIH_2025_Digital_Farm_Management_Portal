import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'package:flutter_tts/flutter_tts.dart';
import 'dart:io';
import 'dart:async';

class ChatBotPage extends StatefulWidget {
  const ChatBotPage({super.key});

  @override
  ChatBotPageState createState() => ChatBotPageState();
}

class ChatBotPageState extends State<ChatBotPage>
    with TickerProviderStateMixin {
  final TextEditingController _textController = TextEditingController();
  final List<ChatMessage> _messages = [];
  final ScrollController _scrollController = ScrollController();
  
  // Voice and TTS
  late stt.SpeechToText _speech;
  late FlutterTts _flutterTts;
  bool _isListening = false;
  String _text = '';
  Timer? _listeningTimer;
  
  // Image picker
  final ImagePicker _picker = ImagePicker();
  
  // Animation controllers
  late AnimationController _voiceAnimationController;
  late AnimationController _listeningAnimationController;
  late Animation<double> _voiceAnimation;
  late Animation<double> _listeningAnimation;
  
  // Language settings
  String _currentLanguage = 'en';
  bool _isTranslateMode = false;
  
  // Mock responses - properly formatted without asterisks
  final List<String> _mockResponses = [
    "🔍 Disease Analysis Complete!\n\nIdentified Condition: Respiratory Infection in Poultry\n\nKey Symptoms Detected:\n• Difficulty breathing\n• Nasal discharge\n• Reduced activity levels\n• Decreased feed intake\n\nRecommended Actions:\n• Isolate affected birds immediately\n• Improve ventilation in the coop\n• Contact veterinarian within 24 hours\n• Monitor temperature (normal: 105-107°F)\n• Ensure clean, fresh water supply\n• Document all symptoms for professional consultation\n\n⚠️ Important: This is AI-assisted analysis. Always consult a qualified veterinarian for proper diagnosis and treatment.",
    
    "🐷 Health Assessment Report\n\nCondition Identified: Early Stage Digestive Issues\n\nClinical Observations:\n• Reduced appetite patterns\n• Mild lethargy symptoms\n• Possible digestive discomfort\n• Temperature within normal range\n\nPrevention & Treatment:\n• Adjust feeding schedule\n• Provide probiotics in feed\n• Ensure adequate water intake\n• Monitor for 48-72 hours\n• Schedule veterinary check if symptoms persist\n• Maintain clean living environment\n• Consider stress factors (overcrowding, temperature)\n\n📋 Next Steps: Document daily observations and contact your local veterinary service for comprehensive health evaluation."
  ];

  // Tamil translations for mock responses - properly formatted
  final List<String> _tamilTranslations = [
    "🔍 நோய் பகுப்பாய்வு முடிந்தது!\n\nகண்டறியப்பட்ட நிலை: கோழிகளில் சுவாச தொற்று\n\nமுக்கிய அறிகுறிகள்:\n• சுவாசிப்பதில் சிரமம்\n• மூக்கிலிருந்து நீர்வடிதல்\n• செயல்பாட்டு அளவு குறைதல்\n• உணவு உட்கொள்ளல் குறைதல்\n\nபரிந்துரைக்கப்பட்ட நடவடிக்கைகள்:\n• பாதிக்கப்பட்ட பறவைகளை உடனடியாக தனிமைப்படுத்துங்கள்\n• கூட்டில் காற்றோட்டத்தை மேம்படுத்துங்கள்\n• 24 மணி நேரத்திற்குள் கால்நடை மருத்துவரை தொடர்பு கொள்ளுங்கள்\n• வெப்பநிலையை கண்காணிக்கவும் (சாதாரண: 105-107°F)\n• சுத்தமான, புதிய நீர் வழங்கவும்\n\n⚠️ முக்கியம்: இது AI உதவியுடன் கூடிய பகுப்பாய்வு. சரியான நோய் கண்டறிதல் மற்றும் சிகிச்சைக்கு எப்போதும் தகுதியான கால்நடை மருத்துவரை அணுகவும்.",
    
    "🐷 உடல்நலம் மதிப்பீட்டு அறிக்கை\n\nகண்டறியப்பட்ட நிலை: ஆரம்ப நிலை செரிமான பிரச்சினைகள்\n\nமருத்துவ அவதானிப்புகள்:\n• பசியின்மை முறைகள்\n• மிதமான சோர்வு அறிகுறிகள்\n• சாத்தியமான செரிமான அசௌகரியம்\n• வெப்பநிலை சாதாரண வரம்பில்\n\nதடுப்பு மற்றும் சிகிச்சை:\n• உணவு அட்டவணையை சரிசெய்யுங்கள்\n• தீவனத்தில் புரோபயாடிக்ஸ் வழங்கவும்\n• போதுமான நீர் உட்கொள்ளலை உறுதிப்படுத்துங்கள்\n• 48-72 மணி நேரம் கண்காணிக்கவும்\n• அறிகுறிகள் நீடித்தால் கால்நடை மருத்துவ பரிசோதனை நிர்ணயிக்கவும்\n\n📋 அடுத்த படிகள்: தினசரி அவதானிப்புகளை ஆவணப்படுத்தி, விரிவான உடல்நலம் மதிப்பீட்டிற்காக உங்கள் உள்ளூர் கால்நடை மருத்துவ சேவையை தொடர்பு கொள்ளுங்கள்."
  ];

  int _currentResponseIndex = 0;

  @override
  void initState() {
    super.initState();
    _initializeSpeech();
    _initializeTts();
    
    _voiceAnimationController = AnimationController(
      duration: const Duration(milliseconds: 200),
      vsync: this,
    );
    
    _listeningAnimationController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );
    
    _voiceAnimation = CurvedAnimation(
      parent: _voiceAnimationController,
      curve: Curves.easeInOut,
    );
    
    _listeningAnimation = CurvedAnimation(
      parent: _listeningAnimationController,
      curve: Curves.easeInOut,
    );
    
    // Welcome message
    _addMessage(ChatMessage(
      text: "🌾 Hello! I'm your AgriGuard AI assistant. I can help you identify diseases in poultry and pigs through text, voice, images, or videos. How can I assist you today?",
      isUser: false,
      timestamp: DateTime.now(),
    ));
  }

  void _initializeSpeech() async {
    _speech = stt.SpeechToText();
    bool available = await _speech.initialize(
      onError: (error) {
        print('Speech recognition error: $error');
        if (mounted) {
          setState(() {
            _isListening = false;
          });
          _listeningAnimationController.stop();
          _listeningAnimationController.reset();
        }
      },
      onStatus: (status) {
        print('Speech recognition status: $status');
        if (status == 'notListening' && _isListening) {
          _stopListening();
        }
      },
    );
    
    if (!available) {
      print('Speech recognition not available');
      // Show user feedback
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Voice recognition is not available on this device'),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _initializeTts() async {
    _flutterTts = FlutterTts();
    await _flutterTts.setLanguage(_currentLanguage == 'ta' ? 'ta-IN' : 'en-US');
    await _flutterTts.setSpeechRate(0.5);
    await _flutterTts.setVolume(1.0);
    await _flutterTts.setPitch(1.0);
  }

  void _startListening() async {
    if (_isListening) return;
    
    bool available = await _speech.initialize();
    if (!available) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Speech recognition not available'),
          backgroundColor: Colors.red,
        ),
      );
      return;
    }

    setState(() {
      _isListening = true;
      _text = '';
    });
    
    _listeningAnimationController.repeat();
    
    // Clear existing timer
    _listeningTimer?.cancel();
    
    try {
      await _speech.listen(
        onResult: (result) {
          if (mounted) {
            setState(() {
              _text = result.recognizedWords;
              _textController.text = _text;
            });
            
            // If we have final result, stop listening after a short delay
            if (result.finalResult && _text.isNotEmpty) {
              _listeningTimer?.cancel();
              _listeningTimer = Timer(const Duration(milliseconds: 500), () {
                _stopListening();
              });
            }
          }
        },
        listenFor: const Duration(seconds: 30),
        pauseFor: const Duration(seconds: 2),
        partialResults: true,
        localeId: 'en_US',
        listenMode: stt.ListenMode.confirmation,
      );
      
      // Auto-stop after 30 seconds
      _listeningTimer = Timer(const Duration(seconds: 30), () {
        if (_isListening) _stopListening();
      });
      
    } catch (e) {
      print('Error starting speech recognition: $e');
      _stopListening();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Error starting voice recognition: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _stopListening() {
    if (!_isListening) return;
    
    _listeningTimer?.cancel();
    _speech.stop();
    
    if (mounted) {
      setState(() => _isListening = false);
      _listeningAnimationController.stop();
      _listeningAnimationController.reset();
    }
  }

  void _speak(String text) async {
    String textToSpeak = _isTranslateMode && _currentLanguage == 'ta' 
        ? _getTamilTranslation(text) 
        : text;
    
    await _flutterTts.setLanguage(_currentLanguage == 'ta' ? 'ta-IN' : 'en-US');
    await _flutterTts.speak(textToSpeak);
  }

  String _getTamilTranslation(String originalText) {
    // For mock purposes, return appropriate Tamil translation
    if (originalText.contains('Respiratory Infection') || originalText.contains('Disease Analysis')) {
      return _tamilTranslations[0];
    } else if (originalText.contains('Health Assessment') || originalText.contains('Digestive Issues')) {
      return _tamilTranslations[1];
    }
    return "மன்னிக்கவும், இந்த செய்திக்கு தமிழ் மொழிபெயர்ப்பு தற்போது கிடைக்கவில்லை।"; // Sorry, Tamil translation not available for this message
  }

  void _addMessage(ChatMessage message) {
    setState(() {
      _messages.add(message);
    });
    _scrollToBottom();
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage(String text) {
    if (text.trim().isEmpty) return;
    
    // Add user message
    _addMessage(ChatMessage(
      text: text,
      isUser: true,
      timestamp: DateTime.now(),
    ));
    
    // Process response
    _processMessage(text);
    
    _textController.clear();
  }

  void _processMessage(String message) {
    // Use alternating mock responses for any question
    String response = _mockResponses[_currentResponseIndex];
    
    // Alternate between the two responses
    _currentResponseIndex = (_currentResponseIndex + 1) % _mockResponses.length;
    
    // Add AI response after a short delay
    Future.delayed(const Duration(milliseconds: 1200), () {
      _addMessage(ChatMessage(
        text: response,
        isUser: false,
        timestamp: DateTime.now(),
      ));
    });
  }

  void _pickImage(ImageSource source) async {
    final XFile? image = await _picker.pickImage(
      source: source,
      maxWidth: 1024,
      maxHeight: 1024,
      imageQuality: 85,
    );
    
    if (image != null) {
      _addMessage(ChatMessage(
        text: "📸 Image uploaded successfully! Analyzing...",
        isUser: true,
        timestamp: DateTime.now(),
        imagePath: image.path,
      ));
      
      // Mock image analysis response
      Future.delayed(const Duration(seconds: 2), () {
        String response = _mockResponses[_currentResponseIndex];
        _currentResponseIndex = (_currentResponseIndex + 1) % _mockResponses.length;
        
        _addMessage(ChatMessage(
          text: "🔍 Image Analysis Complete!\n\n$response",
          isUser: false,
          timestamp: DateTime.now(),
        ));
      });
    }
  }

  void _pickVideo() async {
    final XFile? video = await _picker.pickVideo(
      source: ImageSource.gallery,
      maxDuration: const Duration(minutes: 2),
    );
    
    if (video != null) {
      _addMessage(ChatMessage(
        text: "🎥 Video uploaded successfully! Analyzing behavior patterns...",
        isUser: true,
        timestamp: DateTime.now(),
        videoPath: video.path,
      ));
      
      // Mock video analysis response
      Future.delayed(const Duration(seconds: 3), () {
        String response = _mockResponses[_currentResponseIndex];
        _currentResponseIndex = (_currentResponseIndex + 1) % _mockResponses.length;
        
        _addMessage(ChatMessage(
          text: "🎥 Video Behavioral Analysis Complete!\n\n$response",
          isUser: false,
          timestamp: DateTime.now(),
        ));
      });
    }
  }

  void _showMediaOptions() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.transparent,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
          child: Wrap(
            children: [
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    Container(
                      width: 60,
                      height: 6,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      'Upload Media for Analysis',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Choose how you\'d like to share animal health information',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[600],
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        _buildMediaOption(
                          icon: Icons.camera_alt,
                          label: 'Camera',
                          subtitle: 'Take Photo',
                          color: Colors.blue,
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.camera);
                          },
                        ),
                        _buildMediaOption(
                          icon: Icons.photo_library,
                          label: 'Gallery',
                          subtitle: 'Choose Photo',
                          color: Colors.green,
                          onTap: () {
                            Navigator.pop(context);
                            _pickImage(ImageSource.gallery);
                          },
                        ),
                        _buildMediaOption(
                          icon: Icons.videocam,
                          label: 'Video',
                          subtitle: 'Upload Video',
                          color: Colors.orange,
                          onTap: () {
                            Navigator.pop(context);
                            _pickVideo();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildMediaOption({
    required IconData icon,
    required String label,
    required String subtitle,
    required Color color,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(15),
      child: Container(
        width: 90,
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
        decoration: BoxDecoration(
          color: color.withOpacity(0.1),
          borderRadius: BorderRadius.circular(15),
          border: Border.all(color: color.withOpacity(0.3)),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Icon(icon, size: 24, color: Colors.white),
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: color,
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 11,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _parseFormattedText(String text) {
    // Remove markdown-style formatting for proper display
    String parsed = text
        .replaceAll('**', '') // Remove bold markers
        .replaceAll('*', '') // Remove italic markers
        .replaceAll('###', '') // Remove header markers
        .replaceAll('##', '') // Remove header markers
        .replaceAll('#', ''); // Remove header markers
    
    return parsed;
  }

  void _toggleLanguage() {
    setState(() {
      _currentLanguage = _currentLanguage == 'en' ? 'ta' : 'en';
      _isTranslateMode = _currentLanguage == 'ta';
    });
    _initializeTts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: const Text(
          'AgriGuard AI Assistant',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        elevation: 2,
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert),
            onSelected: (value) {
              if (value == 'language') {
                _toggleLanguage();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                value: 'language',
                child: Row(
                  children: [
                    Icon(Icons.language, color: Colors.grey[600]),
                    const SizedBox(width: 8),
                    Text(_currentLanguage == 'en' ? 'Switch to Tamil' : 'Switch to English'),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: Column(
        children: [
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
          
          // Chat messages
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.all(16),
              itemCount: _messages.length,
              itemBuilder: (context, index) {
                return _buildMessage(_messages[index]);
              },
            ),
          ),
          
          // Listening indicator
          if (_isListening)
            Container(
              padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              margin: const EdgeInsets.symmetric(horizontal: 16),
              decoration: BoxDecoration(
                color: Colors.red.shade50,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.red.shade200),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedBuilder(
                    animation: _listeningAnimation,
                    builder: (context, child) {
                      return Container(
                        width: 12,
                        height: 12,
                        decoration: BoxDecoration(
                          color: Colors.red.withOpacity(0.3 + 0.7 * _listeningAnimation.value),
                          shape: BoxShape.circle,
                        ),
                      );
                    },
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    '🎤 Listening... Speak now',
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          
          if (_isListening) const SizedBox(height: 12),
          
          // Input area
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              children: [
                // Media upload button
                Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade50,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.green.shade200),
                  ),
                  child: IconButton(
                    onPressed: _showMediaOptions,
                    icon: const Icon(Icons.add, color: Colors.green),
                    iconSize: 24,
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Text input with voice button inside
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.white,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: _textController,
                            decoration: const InputDecoration(
                              hintText: 'Ask about animal health...',
                              border: InputBorder.none,
                              contentPadding: EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                            maxLines: null,
                            onSubmitted: _sendMessage,
                          ),
                        ),
                        
                        // Voice button inside text field
                        GestureDetector(
                          onTap: () {
                            if (_isListening) {
                              _stopListening();
                            } else {
                              _startListening();
                            }
                          },
                          child: AnimatedBuilder(
                            animation: _listeningAnimation,
                            builder: (context, child) {
                              return Container(
                                margin: const EdgeInsets.all(8),
                                padding: const EdgeInsets.all(8),
                                decoration: BoxDecoration(
                                  color: _isListening 
                                    ? Colors.red.withOpacity(0.1 + 0.2 * _listeningAnimation.value)
                                    : Colors.grey.shade100,
                                  shape: BoxShape.circle,
                                ),
                                child: Icon(
                                  _isListening ? Icons.mic : Icons.mic_none,
                                  color: _isListening ? Colors.red : Colors.grey.shade600,
                                  size: 20,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                
                const SizedBox(width: 12),
                
                // Send button
                Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    onPressed: () => _sendMessage(_textController.text),
                    icon: const Icon(Icons.send, color: Colors.white),
                    iconSize: 20,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMessage(ChatMessage message) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Row(
        mainAxisAlignment:
            message.isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!message.isUser) ...[
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.green.shade100,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.green.shade200),
              ),
              child: Icon(
                Icons.psychology,
                color: Colors.green.shade700,
                size: 20,
              ),
            ),
            const SizedBox(width: 12),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: message.isUser ? Colors.green.shade500 : Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(16),
                  topRight: const Radius.circular(16),
                  bottomLeft: Radius.circular(message.isUser ? 16 : 4),
                  bottomRight: Radius.circular(message.isUser ? 4 : 16),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.shade200,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  if (message.imagePath != null) ...[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Image.file(
                        File(message.imagePath!),
                        height: 200,
                        width: double.infinity,
                        fit: BoxFit.cover,
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  if (message.videoPath != null) ...[
                    Container(
                      height: 200,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(color: Colors.grey.shade300),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_circle_outline,
                            size: 50,
                            color: Colors.grey.shade600,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Video uploaded',
                            style: TextStyle(
                              color: Colors.grey.shade600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 12),
                  ],
                  Text(
                    _parseFormattedText(_isTranslateMode && !message.isUser && _currentLanguage == 'ta' 
                        ? _getTamilTranslation(message.text)
                        : message.text),
                    style: TextStyle(
                      color: message.isUser ? Colors.white : Colors.black87,
                      fontSize: 15,
                      height: 1.4,
                    ),
                  ),
                  if (!message.isUser) ...[
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            if (_currentLanguage == 'ta')
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _isTranslateMode = !_isTranslateMode;
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.shade50,
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.blue.shade200),
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        Icons.translate,
                                        size: 14,
                                        color: Colors.blue.shade700,
                                      ),
                                      const SizedBox(width: 4),
                                      Text(
                                        _isTranslateMode ? 'English' : 'தமிழ்',
                                        style: TextStyle(
                                          color: Colors.blue.shade700,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                          ],
                        ),
                        
                        // Read aloud button
                        InkWell(
                          onTap: () => _speak(message.text),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 8,
                              vertical: 4,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.green.shade50,
                              borderRadius: BorderRadius.circular(12),
                              border: Border.all(color: Colors.green.shade200),
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.volume_up,
                                  size: 14,
                                  color: Colors.green.shade700,
                                ),
                                const SizedBox(width: 4),
                                Text(
                                  'Read',
                                  style: TextStyle(
                                    color: Colors.green.shade700,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ],
              ),
            ),
          ),
          if (message.isUser) ...[
            const SizedBox(width: 12),
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: Colors.blue.shade100,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.blue.shade200),
              ),
              child: Icon(
                Icons.person,
                color: Colors.blue.shade700,
                size: 20,
              ),
            ),
          ],
        ],
      ),
    );
  }

  @override
  void dispose() {
    _textController.dispose();
    _scrollController.dispose();
    _voiceAnimationController.dispose();
    _listeningAnimationController.dispose();
    _listeningTimer?.cancel();
    _speech.stop();
    _flutterTts.stop();
    super.dispose();
  }
}

class ChatMessage {
  final String text;
  final bool isUser;
  final DateTime timestamp;
  final String? imagePath;
  final String? videoPath;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.timestamp,
    this.imagePath,
    this.videoPath,
  });
}