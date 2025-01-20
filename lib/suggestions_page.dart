import 'package:flutter/material.dart';

class SuggestionsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Suggestions'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Upload or Ask Suggestions',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 20),
            Text(
              'You can upload your suggestions or ask for information here.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            SizedBox(height: 40),

            // Upload Suggestions Section
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () {
                  // Handle file upload or text submission
                  _uploadSuggestion(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.upload_file, color: Colors.orange, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'Upload Suggestions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.orange,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Ask for Suggestions Section
            Card(
              elevation: 5,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: InkWell(
                onTap: () {
                  _askForSuggestion(context);
                },
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Icon(Icons.help_outline, color: Colors.blue, size: 30),
                      SizedBox(width: 10),
                      Text(
                        'Ask for Suggestions',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Function to handle the upload of suggestions
  void _uploadSuggestion(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Upload Your Suggestion'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.upload_file, color: Colors.orange, size: 50),
                SizedBox(height: 10),
                Text('You can either upload a file or write your suggestion here.'),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter your suggestion...',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle file upload or save suggestion logic
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Suggestion uploaded successfully')),
                    );
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  // Function to handle asking for suggestions
  void _askForSuggestion(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Ask for Suggestions'),
          content: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.help_outline, color: Colors.blue, size: 50),
                SizedBox(height: 10),
                Text('Type your question or request for suggestions here.'),
                TextField(
                  controller: _controller,
                  decoration: InputDecoration(
                    hintText: 'Enter your question...',
                    border: OutlineInputBorder(),
                    contentPadding: EdgeInsets.all(10),
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    // Handle the asking of suggestion logic
                    String userQuestion = _controller.text;
                    if (userQuestion.isNotEmpty) {
                      Navigator.pop(context);
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Your question has been submitted')),
                      );
                    }
                  },
                  child: Text('Submit'),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
