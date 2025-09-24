import 'package:flutter/material.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
import 'dart:math';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'summary_page.dart';

class DailyScanPage extends StatefulWidget {
  const DailyScanPage({super.key});

  @override
  _DailyScanPageState createState() => _DailyScanPageState();
}

class _DailyScanPageState extends State<DailyScanPage> with SingleTickerProviderStateMixin {
  final _formKey = GlobalKey<FormState>();
  late stt.SpeechToText _speech;
  bool _isListening = false;
  String _transcript = '';
  String _geminiResponseText = '';
  final _textControllers = List.generate(15, (_) => TextEditingController());
  
  late AnimationController _micAnimationController;
  late Animation<double> _micAnimation;

  File? _recordedVideoFile;
  final ImagePicker _picker = ImagePicker();

  final List<String> questions = const [
    '1. How many animals died in the last 24 hours?',
    '2. Have you noticed any changes in animal behavior (e.g., lethargy, huddling)?',
    '3. Has there been a significant decrease in feed or water intake?',
    '4. Are there any animals showing physical signs of illness (e.g., coughing, diarrhea)?',
    '5. Have you observed a sudden drop in production (e.g., egg production)?',
    '6. Are there any sick or weak animals that have been isolated?',
    '7. Have you cleaned and disinfected animal housing areas and equipment today?',
    '8. Is manure and other waste being properly managed and stored?',
    '9. Have you observed an increase in pests like rodents or flies on the farm?',
    '10. Is the water supply clean and fresh?',
    '11. Have any non-essential visitors or vehicles entered the farm today?',
    '12. Have you recently introduced any new animals to the herd or flock?',
    '13. Have you or your staff visited any other farms or livestock facilities recently?',
    '14. Has any equipment been shared with or borrowed from another farm?',
    '15. Have all people entering animal areas used footbaths or changed their clothing?',
  ];
  
  final List<String> _autofillDummyData = const [
    '1',
    'Yes, I saw some lethargy in the poultry.',
    'No, feed intake seems normal.',
    'Yes, one chicken is coughing.',
    'Yes, egg production is slightly down today.',
    'Yes, I have isolated the sick chicken.',
    'Yes, all areas were disinfected.',
    'Yes, manure is stored properly.',
    'No, pest control measures are effective.',
    'Yes, water is clean.',
    'No, no non-essential visitors.',
    'No, no new animals have been introduced.',
    'No, have not visited other farms.',
    'Yes, biosecurity protocols are followed.',
    'Yes, they have changed their clothing and used footbaths.',
  ];

  final List<String> _geminiResponses = const [
    "✅ Biosecurity Status: Secure\n\nYour daily report indicates an excellent state of health and biosecurity on your farm. The low mortality and lack of concerning symptoms are highly positive indicators. The consistent application of your biosecurity protocols is working effectively to protect your livestock. Keep up this high standard of practice to ensure long-term productivity and prevent outbreaks.\n\n**Actionable Insight:** Consider conducting a quarterly review of your biosecurity plan to identify any areas for minor improvements.",
    "⚠️ Biosecurity Status: Minor Risk Detected\n\nYour report highlights a small decrease in feed intake and a single animal showing signs of lethargy. While not a major concern yet, these are early warning signs that require attention. It's crucial to continue daily monitoring of the affected animal and its pen mates. Ensure they have easy access to fresh water and are not being stressed by overcrowding or temperature fluctuations.\n\n**Actionable Insight:** Be vigilant for any additional symptoms like coughing or diarrhea in the coming days.",
    "❗️ Biosecurity Status: Moderate Risk Detected\n\nThe presence of a coughing animal is a significant indicator of a potential respiratory issue. Your quick action to isolate the animal is commendable and a critical biosecurity measure. The farm's overall status is at a moderate risk of transmission. Immediately re-evaluate the sanitation procedures for any shared equipment.\n\n**Actionable Insight:** Consult with your local veterinarian immediately to get a diagnosis and guidance on a proper treatment plan for the affected animal and the rest of your livestock.",
    "✅ Biosecurity Status: Good with Minor Notes\n\nYour biosecurity measures are strong and effective. The farm appears to be well-managed with proper waste and visitor control. The minor drop in egg production you noted is likely not related to a disease outbreak. Factors such as a change in weather, feed batch, or stress can often impact productivity. There is no immediate cause for concern regarding disease transmission based on your report.\n\n**Actionable Insight:** Maintain current biosecurity practices and monitor environmental conditions that might be affecting your animals' productivity."
  ];

  @override
  void initState() {
    super.initState();
    _speech = stt.SpeechToText();
    _micAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 600),
    )..repeat(reverse: true);
    _micAnimation = Tween<double>(begin: 0.8, end: 1.1).animate(CurvedAnimation(
      parent: _micAnimationController,
      curve: Curves.easeInOut,
    ));
  }

  @override
  void dispose() {
    _speech.stop();
    _micAnimationController.dispose();
    for (var controller in _textControllers) {
      controller.dispose();
    }
    super.dispose();
  }

  void _autofillForm(List<String> responses) {
    for (int i = 0; i < responses.length; i++) {
      _textControllers[i].text = responses[i];
    }
  }

  void _startVoiceInput() async {
    bool available = await _speech.initialize(
      onStatus: (status) {
        if (status == stt.SpeechToText.listeningStatus) {
          setState(() => _isListening = true);
        } else {
          setState(() => _isListening = false);
        }
      },
      onError: (error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Speech recognition error: ${error.errorMsg}')),
        );
        setState(() => _isListening = false);
      },
    );

    if (available) {
      setState(() {
        _transcript = '';
        _geminiResponseText = '';
      });
      _speech.listen(
        onResult: (val) {
          setState(() {
            _transcript = val.recognizedWords;
          });
        },
      );
    }
  }

  void _stopVoiceInput() {
    _speech.stop();
    setState(() => _isListening = false);
    
    _callGeminiAPI();
  }

  void _callGeminiAPI() {
    _showLoadingOverlay();
    final random = Random();
    final int randomIndex = random.nextInt(_geminiResponses.length);
    final String selectedResponse = _geminiResponses[randomIndex];

    Future.delayed(const Duration(seconds: 10), () {
      Navigator.pop(context);

      setState(() {
        _geminiResponseText = selectedResponse;
      });

      _autofillForm(_autofillDummyData);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Gemini response received and form filled.'),
          backgroundColor: Colors.green,
        ),
      );
    });
  }

  // New method to record a video
  Future<void> _recordVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.camera);
    if (video != null) {
      setState(() {
        _recordedVideoFile = File(video.path);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Video recorded successfully.')),
      );
    }
  }

  // New method to upload a dummy video
  Future<void> _uploadDummyVideo() async {
    final XFile? video = await _picker.pickVideo(source: ImageSource.gallery);
    if (video != null) {
      setState(() {
        _recordedVideoFile = File(video.path);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Video uploaded successfully.')),
      );
    }
  }

  void _showLoadingOverlay() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          child: Container(
            padding: const EdgeInsets.all(24.0),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Colors.green, Colors.lightGreenAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SpinningStars(),
                SizedBox(height: 20),
                Text(
                  "Analysing voice and filling form...",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Daily Biosecurity Scan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: () => _autofillForm(_autofillDummyData),
                        icon: const Icon(Icons.auto_awesome),
                        label: const Text('Autofill'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.blue,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: ElevatedButton.icon(
                        onPressed: _isListening ? _stopVoiceInput : _startVoiceInput,
                        icon: Icon(_isListening ? Icons.mic_off : Icons.mic),
                        label: Text(_isListening ? 'Stop' : 'Voice Mode'),
                        style: ElevatedButton.styleFrom(
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.green,
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                // Video Section
                const Text(
                  'Attach Video Scan',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),
                if (_recordedVideoFile == null)
                  Column(
                    children: [
                      ElevatedButton.icon(
                        onPressed: _recordVideo,
                        icon: const Icon(Icons.videocam),
                        label: const Text('Record Video'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.red,
                        ),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton.icon(
                        onPressed: _uploadDummyVideo,
                        icon: const Icon(Icons.upload_file),
                        label: const Text('Upload Dummy Video'),
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size.fromHeight(50),
                          foregroundColor: Colors.white,
                          backgroundColor: Colors.purple,
                        ),
                      ),
                    ],
                  )
                else
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.green.shade50,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Icon(Icons.video_library, color: Colors.green),
                        const SizedBox(width: 10),
                        Expanded(child: Text('scanned_video.mp4')),
                        IconButton(
                          icon: const Icon(Icons.close, color: Colors.red),
                          onPressed: () {
                            setState(() {
                              _recordedVideoFile = null;
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                // End of Video Section
                if (_transcript.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text('Transcript: $_transcript', style: const TextStyle(fontStyle: FontStyle.italic)),
                  ),
                const SizedBox(height: 20),
                if (_geminiResponseText.isNotEmpty)
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.lightGreen.shade100,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Gemini Response:', style: TextStyle(fontWeight: FontWeight.bold)),
                        const SizedBox(height: 8),
                        Text(_geminiResponseText),
                      ],
                    ),
                  ),
                const SizedBox(height: 20),
                ...questions.asMap().entries.map((entry) {
                  int index = entry.key;
                  String question = entry.value;
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          question,
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextFormField(
                          controller: _textControllers[index],
                          decoration: const InputDecoration(
                            hintText: 'Enter your answer here...',
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                            ),
                          ),
                          maxLines: null,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'This field is required.';
                            }
                            return null;
                          },
                        ),
                      ],
                    ),
                  );
                }).toList(),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate() && _recordedVideoFile != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const SummaryPage()),
                      );
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Please fill all fields AND attach a video.'),
                          backgroundColor: Colors.red,
                        ),
                      );
                    }
                  },
                  child: const Text('Submit Scan'),
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.white,
                    backgroundColor: Colors.green,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_isListening)
          Positioned.fill(
            child: Container(
              color: Colors.black.withOpacity(0.8),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ScaleTransition(
                    scale: _micAnimation,
                    child: const Icon(
                      Icons.mic,
                      color: Colors.white,
                      size: 100,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Listening...',
                    style: TextStyle(color: Colors.white, fontSize: 24),
                  ),
                  const SizedBox(height: 50),
                  ElevatedButton(
                    onPressed: _stopVoiceInput,
                    child: const Text('Stop Recording'),
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.black,
                      backgroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}

// A custom widget for the spinning stars loading animation
class SpinningStars extends StatefulWidget {
  const SpinningStars({super.key});

  @override
  _SpinningStarsState createState() => _SpinningStarsState();
}

class _SpinningStarsState extends State<SpinningStars> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RotationTransition(
      turns: _controller,
      child: const Icon(
        Icons.auto_awesome,
        color: Colors.yellow,
        size: 50,
      ),
    );
  }
}