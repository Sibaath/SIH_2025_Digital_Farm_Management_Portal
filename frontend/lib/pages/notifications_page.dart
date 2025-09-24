import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

// Data model for a single notification with Tamil translations
class NotificationItem {
  final String id;
  final String title;
  final String titleTamil;
  final String subtitle;
  final String subtitleTamil;
  final IconData icon;
  final Color iconColor;

  const NotificationItem({
    required this.id,
    required this.title,
    required this.titleTamil,
    required this.subtitle,
    required this.subtitleTamil,
    required this.icon,
    required this.iconColor,
  });
}

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  NotificationsPageState createState() => NotificationsPageState();
}

class NotificationsPageState extends State<NotificationsPage>
    with TickerProviderStateMixin {
  late FlutterTts _flutterTts;
  String _currentLanguage = 'en';
  bool _isSpeaking = false;
  String _speakingNotificationId = '';

  List<NotificationItem> _notifications = [
    const NotificationItem(
      id: 'alert_1',
      title: 'Critical Biosecurity Alert',
      titleTamil: 'கடுமையான உயிர்பாதுகாப்பு எச்சரிக்கை',
      subtitle: 'Immediate action required for an outbreak in the southern region.',
      subtitleTamil: 'தெற்குப் பகுதியில் ஒரு நோய் வெடிப்புக்கு உடனடி நடவடிக்கை தேவை.',
      icon: Icons.warning,
      iconColor: Colors.red,
    ),
    const NotificationItem(
      id: 'app_1',
      title: 'Appointment Reminder',
      titleTamil: 'சந்திப்பு நினைவூட்டல்',
      subtitle: 'Your appointment with Dr. John Doe is tomorrow at 10:00 AM.',
      subtitleTamil: 'டாக்டர் ஜான் டோ உடன் உங்களின் சந்திப்பு நாளை காலை 10:00 மணிக்கு.',
      icon: Icons.calendar_today,
      iconColor: Colors.blue,
    ),
    const NotificationItem(
      id: 'feedback_1',
      title: 'Health Checkup Feedback',
      titleTamil: 'உடல்நலப் பரிசோதனை கருத்து',
      subtitle: 'The association head has provided feedback on your latest daily scan.',
      subtitleTamil: 'சமீபத்திய தினசரி ஸ்கேன் குறித்து சங்கத் தலைவர் கருத்து தெரிவித்துள்ளார்.',
      icon: Icons.check_circle,
      iconColor: Colors.green,
    ),
    const NotificationItem(
      id: 'feedback_2',
      title: 'Feedback Request',
      titleTamil: 'கருத்து கோரிக்கை',
      subtitle: 'Please provide feedback on your recent farm visit by a veterinary expert.',
      subtitleTamil: 'கால்நடை நிபுணரின் சமீபத்திய பண்ணை வருகை குறித்து உங்கள் கருத்தை தெரிவிக்கவும்.',
      icon: Icons.feedback,
      iconColor: Colors.orange,
    ),
  ];

  @override
  void initState() {
    super.initState();
    _initializeTts();
  }
  
  @override
  void dispose() {
    _flutterTts.stop();
    super.dispose();
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
        _speakingNotificationId = '';
      });
    });
  }

  void _toggleLanguage() {
    setState(() {
      _currentLanguage = _currentLanguage == 'en' ? 'ta' : 'en';
    });
    _initializeTts();
  }

  void _speakNotification(NotificationItem notification) async {
    if (_isSpeaking && _speakingNotificationId == notification.id) {
      await _flutterTts.stop();
      setState(() {
        _isSpeaking = false;
        _speakingNotificationId = '';
      });
      return;
    }

    if (_isSpeaking) {
      await _flutterTts.stop();
    }

    setState(() {
      _isSpeaking = true;
      _speakingNotificationId = notification.id;
    });

    String textToSpeak = _currentLanguage == 'ta' 
        ? "${notification.titleTamil}. ${notification.subtitleTamil}"
        : "${notification.title}. ${notification.subtitle}";

    await _flutterTts.speak(textToSpeak);
  }

  void _dismissNotification(String id) {
    setState(() {
      _notifications.removeWhere((item) => item.id == id);
    });
  }

  void _undoDismiss(NotificationItem item, int index) {
    setState(() {
      _notifications.insert(index, item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 245, 245, 245), // Lighter, neater background
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // MODIFIED: Custom header to match the app's green AppBar
          Container(
            color: Colors.green,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    _currentLanguage == 'ta' ? 'அறிவிப்புகள்' : 'Notifications',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.language, color: Colors.white),
                    onPressed: _toggleLanguage,
                    tooltip: _currentLanguage == 'en' ? 'Switch to Tamil' : 'Switch to English',
                  ),
                ],
              ),
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
          
          // The actual list of notifications
          _notifications.isEmpty
              ? Expanded(
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.notifications_none,
                          size: 80,
                          color: Colors.grey.shade400,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          'No New Notifications',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'All caught up!',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey.shade500,
                          ),
                        ),
                      ],
                    ),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: ListView.builder(
                      itemCount: _notifications.length,
                      itemBuilder: (context, index) {
                        final item = _notifications[index];
                        return Dismissible(
                          key: Key(item.id),
                          direction: DismissDirection.endToStart,
                          onDismissed: (direction) {
                            final dismissedItem = item;
                            _dismissNotification(item.id);
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: const Text('Notification dismissed'),
                                backgroundColor: Colors.red,
                                action: SnackBarAction(
                                  label: 'Undo',
                                  textColor: Colors.white,
                                  onPressed: () {
                                    _undoDismiss(dismissedItem, index);
                                  },
                                ),
                              ),
                            );
                          },
                          background: Container(
                            color: Colors.red,
                            alignment: Alignment.centerRight,
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                            child: const Icon(Icons.delete, color: Colors.white),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 8.0), // Reduced vertical spacing
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                border: Border.all(
                                  color: item.iconColor.withOpacity(0.4),
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.1),
                                    spreadRadius: 1,
                                    blurRadius: 3,
                                    offset: const Offset(0, 1),
                                  ),
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
                                child: ListTile(
                                  contentPadding: EdgeInsets.zero,
                                  leading: Container(
                                    width: 48,
                                    height: 48,
                                    decoration: BoxDecoration(
                                      color: item.iconColor.withOpacity(0.1),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Icon(item.icon, color: item.iconColor),
                                  ),
                                  title: Text(
                                    _currentLanguage == 'ta' ? item.titleTamil : item.title,
                                    style: const TextStyle(fontWeight: FontWeight.bold),
                                  ),
                                  subtitle: Text(
                                    _currentLanguage == 'ta' ? item.subtitleTamil : item.subtitle,
                                  ),
                                  trailing: IconButton(
                                    icon: AnimatedSwitcher(
                                      duration: const Duration(milliseconds: 300),
                                      child: _isSpeaking && _speakingNotificationId == item.id
                                        ? const Icon(Icons.stop_circle, 
                                            key: ValueKey('stop'), color: Colors.red)
                                        : const Icon(Icons.volume_up, 
                                            key: ValueKey('play'), color: Colors.green),
                                    ),
                                    onPressed: () => _speakNotification(item),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}