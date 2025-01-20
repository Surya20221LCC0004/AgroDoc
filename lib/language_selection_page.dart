import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'language_provider.dart';

class LanguageSelectionPage extends StatelessWidget {
  // List of supported languages
  final List<Map<String, String>> languages = [
    {'name': 'English', 'code': 'en', 'icon': '🇬🇧'},
    {'name': 'Hindi', 'code': 'hi', 'icon': '🇮🇳'},
    {'name': 'Telugu', 'code': 'te', 'icon': '🌱'},
    {'name': 'Tamil', 'code': 'ta', 'icon': '🌾'},
    {'name': 'Kannada', 'code': 'kn', 'icon': '🌿'},
    {'name': 'Malayalam', 'code': 'ml', 'icon': '🌴'},
  ];

  @override
  Widget build(BuildContext context) {
    // Access the LanguageProvider instance
    final languageProvider = Provider.of<LanguageProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: Text('Select Your Language'),
        backgroundColor: Colors.green[700],
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.green.shade300, Colors.green.shade600],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Choose a Language',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            SizedBox(height: 10),
            Text(
              'Select your preferred language to continue',
              style: TextStyle(
                fontSize: 16,
                color: Colors.white70,
              ),
            ),
            SizedBox(height: 30),
            Expanded(
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, // Two cards per row
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.3, // Aspect ratio for cards
                ),
                itemCount: languages.length,
                itemBuilder: (context, index) {
                  final language = languages[index];
                  return GestureDetector(
                    onTap: () {
                      // Update the app's language and navigate to the dashboard
                      languageProvider.changeLanguage(language['code']!);
                      Navigator.pushNamed(context, '/dashboard');
                    },
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      elevation: 8,
                      color: Colors.white,
                      shadowColor: Colors.green.shade700,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              language['icon'] ?? '🌐',
                              style: TextStyle(
                                fontSize: 50,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(
                              language['name'] ?? '',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.green.shade800,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
