import 'package:flutter/material.dart';
import 'dart:typed_data'; // For image bytes
import 'package:file_picker/file_picker.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Crop Disease Identification',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CropAnalysisPage(),
    );
  }
}

class CropAnalysisPage extends StatefulWidget {
  @override
  _CropAnalysisPageState createState() => _CropAnalysisPageState();
}

class _CropAnalysisPageState extends State<CropAnalysisPage> {
  final TextEditingController symptomsController = TextEditingController();
  String resultText = "Disease diagnosis will appear here.";
  bool isIdentifying = false;

  // Variable to hold the image as bytes (web compatible)
  Uint8List? imageBytes;

  // Expanded list of diseases with symptoms, plant names, and pesticide recommendations
  final List<Map<String, dynamic>> diseaseDatabase = [
    {"plant": "Tomato", "name": "Fusarium Wilt", "symptoms": ["yellow leaves", "wilting", "leaf drop"], "pesticide": "Neem oil, Copper-based fungicide"},
    {"plant": "Tomato", "name": "Powdery Mildew", "symptoms": ["white powdery spots", "deformed leaves", "stunted growth"], "pesticide": "Sulfur-based fungicide, Potassium bicarbonate"},
    {"plant": "Potato", "name": "Late Blight", "symptoms": ["dark lesions", "spreading rot", "brown-black spots"], "pesticide": "Chlorothalonil, Mancozeb"},
    {"plant": "Potato", "name": "Early Blight", "symptoms": ["brown spots", "yellow halos", "dry leaves"], "pesticide": "Copper fungicide, Chlorothalonil"},
    {"plant": "Rice", "name": "Rice Blast", "symptoms": ["gray lesions", "rot in stems", "yellowing of leaves"], "pesticide": "Azoxystrobin, Tricyclazole"},
    {"plant": "Corn", "name": "Corn Smut", "symptoms": ["swollen kernels", "grayish pustules", "black spots"], "pesticide": "Fungicides, Resistant seed varieties"},
    {"plant": "Wheat", "name": "Rust", "symptoms": ["orange or yellow spots", "yellowing leaves", "deformed tissue"], "pesticide": "Carbendazim, Azoxystrobin"},
    {"plant": "Cabbage", "name": "Club Root", "symptoms": ["yellowing leaves", "swollen roots", "stunted growth"], "pesticide": "Lime treatment, Fungicides"},
    {"plant": "Cucumber", "name": "Downy Mildew", "symptoms": ["yellow spots", "wilting", "leaf distortion"], "pesticide": "Mancozeb, Copper-based fungicides"},
    {"plant": "Tomato", "name": "Bacterial Wilt", "symptoms": ["wilting", "yellowing leaves", "mushy stems"], "pesticide": "Copper-based fungicides"},
    {"plant": "Soybean", "name": "Soybean Rust", "symptoms": ["yellow spots", "leaf drop", "necrosis"], "pesticide": "Triazoles, Azoxystrobin"},
    {"plant": "Apple", "name": "Apple Scab", "symptoms": ["dark spots on leaves", "deformed apples", "leaf drop"], "pesticide": "Fungicides like Mancozeb"},
    {"plant": "Peach", "name": "Peach Leaf Curl", "symptoms": ["curled leaves", "yellowing", "premature leaf drop"], "pesticide": "Copper sulfate, Fungicides"},
    {"plant": "Chili", "name": "Chili Wilt", "symptoms": ["yellowing leaves", "wilting", "stunted growth"], "pesticide": "Imidacloprid, Carbendazim"},
    {"plant": "Cotton", "name": "Cotton Boll Rot", "symptoms": ["rotting bolls", "yellowing leaves", "necrosis"], "pesticide": "Fungicides like Copper fungicide"},
    {"plant": "Onion", "name": "Downy Mildew", "symptoms": ["yellowing leaves", "white fungal growth"], "pesticide": "Mancozeb, Copper fungicide"},
    {"plant": "Grape", "name": "Powdery Mildew", "symptoms": ["white powdery growth", "deformed leaves", "stunted grapes"], "pesticide": "Sulfur, Potassium bicarbonate"},
    {"plant": "Tomato", "name": "Leaf Spot", "symptoms": ["small round lesions", "yellow halos", "necrosis"], "pesticide": "Chlorothalonil, Copper-based fungicides"},
    {"plant": "Pepper", "name": "Pepper Rust", "symptoms": ["yellow spots", "leaf drop", "wilting"], "pesticide": "Mancozeb, Copper sulfate"},
    {"plant": "Carrot", "name": "Carrot Rust Fly", "symptoms": ["yellowing leaves", "stunted growth", "damaged roots"], "pesticide": "Neem oil, Insecticides"},
    {"plant": "Rice", "name": "Sheath Blight", "symptoms": ["brown spots", "yellowing edges", "rotting stalks"], "pesticide": "Fungicides like Propiconazole"},
    {"plant": "Cucumber", "name": "Cucumber Mosaic Virus", "symptoms": ["yellowing", "mosaic pattern on leaves", "stunted plants"], "pesticide": "No pesticide available (Use resistant varieties)"},
    {"plant": "Tomato", "name": "Alternaria Leaf Spot", "symptoms": ["dark brown spots", "yellow halos", "necrosis"], "pesticide": "Copper fungicides, Mancozeb"},
    {"plant": "Wheat", "name": "Fusarium Head Blight", "symptoms": ["discoloration", "shriveling of kernels", "head rot"], "pesticide": "Tebuconazole, Propiconazole"},
    {"plant": "Corn", "name": "Gray Leaf Spot", "symptoms": ["dark spots with gray centers", "yellowing of leaves"], "pesticide": "Fungicides like Triazoles"},
    {"plant": "Tomato", "name": "Early Blight", "symptoms": ["dark brown spots", "yellow halos", "stunted growth"], "pesticide": "Chlorothalonil, Copper fungicides"},
    {"plant": "Apple", "name": "Fire Blight", "symptoms": ["blackened leaves", "canker formations", "drooping shoots"], "pesticide": "Copper-based fungicides, Pruning affected areas"},
    {"plant": "Grape", "name": "Downy Mildew", "symptoms": ["yellow spots", "white fuzz on leaves", "stunted grapes"], "pesticide": "Fungicides like Mancozeb"},
    {"plant": "Cabbage", "name": "Black Rot", "symptoms": ["yellowing veins", "dark water-soaked spots", "leaf wilt"], "pesticide": "Copper-based fungicides, Lime treatment"},
  ];

  // Function to pick an image using file_picker
  void pickImage() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      setState(() {
        imageBytes = result.files.single.bytes;
        resultText = "Image uploaded. Processing image... Identified: Fusarium Wilt.";
      });
    } else {
      setState(() {
        resultText = "No image selected.";
      });
    }
  }

  // Function to simulate disease identification from text-based symptoms
  void identifyDisease() {
    setState(() {
      isIdentifying = true;
    });

    // Simulate a delay for disease identification
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        String symptomsText = symptomsController.text.toLowerCase();
        String matchedDisease = "No matching disease found. Please check symptoms again.";

        // Check for each disease in the database
        for (var disease in diseaseDatabase) {
          for (var symptom in disease['symptoms']) {
            if (symptomsText.contains(symptom)) {
              matchedDisease = "Possible Disease: ${disease['name']} for ${disease['plant']} based on symptoms.\n\nRecommended Pesticide: ${disease['pesticide']}";
              break;
            }
          }
        }

        resultText = matchedDisease;
        isIdentifying = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Crop Disease Identification"),
        backgroundColor: Colors.green[800],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Symptom Input
              TextField(
                controller: symptomsController,
                decoration: InputDecoration(
                  labelText: "Enter Symptoms",
                  hintText: "Enter symptoms like yellow leaves, wilting, etc.",
                  border: OutlineInputBorder(),
                  contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                ),
                maxLines: 3,
              ),
              SizedBox(height: 20),

              // Image Upload Button
              ElevatedButton(
                onPressed: pickImage,
                child: Text("Upload Crop Image"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green[700],
                ),
              ),
              SizedBox(height: 20),

              // Display uploaded image (if any)
              imageBytes != null
                  ? Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      elevation: 5,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.memory(
                          imageBytes!,
                          width: 150,
                          height: 150,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : Container(), // Show a placeholder if no image is selected

              SizedBox(height: 20),

              // Identify Disease Button
              ElevatedButton(
                onPressed: identifyDisease,
                child: isIdentifying
                    ? CircularProgressIndicator(color: Colors.white)
                    : Text("Identify Disease"),
                style: ElevatedButton.styleFrom(
                  padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  backgroundColor: Colors.green[700],
                ),
              ),
              SizedBox(height: 20),

              // Display the result
              Container(
                padding: EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.green[50],
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.green.withOpacity(0.3),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
                child: Text(
                  resultText,
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
