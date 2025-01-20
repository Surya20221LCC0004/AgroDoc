import 'package:flutter/material.dart';

class AskAnExpertPage extends StatefulWidget {
  @override
  _AskAnExpertPageState createState() => _AskAnExpertPageState();
}

class _AskAnExpertPageState extends State<AskAnExpertPage> {
  final TextEditingController _questionController = TextEditingController();
  final List<Map<String, String>> _chatMessages = [];
  
  final Map<String, String> _predefinedAnswers = {
    "soil fertility": 
        "Add compost, practice crop rotation, and avoid overusing chemical fertilizers.",
    "sandy soil crops": 
        "Carrots, radishes, peanuts, and watermelon grow well in sandy soil.",
    "crop diseases": 
        "Use crop rotation, disease-resistant seeds, and proper spacing.",
    "plant wheat": 
        "Best time to plant wheat is November to December.",
    "pest control": 
        "Use neem oil, introduce beneficial insects, or plant marigolds.",
    "organic farming": 
        "Grow crops without synthetic fertilizers and pesticides.",
    "crop rotation": 
        "Grow different crops alternately to maintain soil health.",
    "water saving": 
        "Use drip irrigation, mulching, and rainwater harvesting.",
    "mulching": 
        "Conserves moisture, suppresses weeds, and controls soil temperature.",
    "black soil": 
        "Cotton, wheat, and sorghum are suitable for black soil.",
    "soil testing": 
        "Use a soil test kit or send samples to a lab.",
    "drip irrigation": 
        "Saves water by delivering it directly to roots.",
    "increase yield": 
        "Use quality seeds, fertilizers, pest control, and irrigation.",
    "hydroponics": 
        "Grow plants without soil using nutrient-rich water.",
    "weed control": 
        "Use manual weeding, mulching, or herbicides.",
    "precision farming": 
        "Use GPS and sensors for better yield and resource use.",
    "rice fertilizers": 
        "Apply NPK (nitrogen, phosphorus, potassium) fertilizers.",
    "paddy pests": 
        "Stem borers and brown planthoppers are common pests.",
    "organic manure": 
        "It lasts 2-3 years when stored properly.",
    "saline soil": 
        "Barley, spinach, and sugar beet grow in saline soil.",
    "waterlogging": 
        "Install proper drainage or grow water-tolerant crops like paddy.",
    "micronutrients": 
        "Zinc, iron, manganese, and copper are essential.",
    "fungal control": 
        "Use fungicides and maintain good ventilation.",
    "intercropping": 
        "Grow two or more crops together for better yield.",
    "soil deficiency": 
        "Test soil or check for yellow leaves and stunted growth.",
    "GM crops": 
        "Genetically modified for better yield or pest resistance.",
    "land prep": 
        "Plough, level, and add organic matter.",
    "green manure": 
        "Plant crops and plough them into the soil to enrich it.",
    "hilly farming": 
        "Use terraces or contour farming; grow tea or coffee.",
    "biofertilizers": 
        "Natural fertilizers improve soil fertility sustainably.",
    "vermicompost": 
        "Earthworms decompose waste into nutrient-rich manure.",
    "red soil crops": 
        "Groundnut, cotton, and millet are suitable.",
    "aphid control": 
        "Use neem oil spray or introduce ladybugs.",
    "ZBNF": 
        "Zero-Budget Natural Farming relies on natural resources.",
    "sugarcane harvest": 
        "Harvest at 12-18 months for best yield.",
    "grain storage": 
        "Store in dry, pest-free containers or silos.",
    "dryland crops": 
        "Millets, sorghum, and pulses are ideal.",
    "cotton pests": 
        "Watch for bollworms, aphids, and whiteflies.",
    "soil aeration": 
        "Ploughing and organic matter improve aeration.",
    "crop spacing": 
        "Proper spacing ensures sunlight and air circulation.",
    "drought farming": 
        "Grow drought-resistant crops and mulch fields.",
    "agroforestry": 
        "Combine trees with crops for better productivity.",
    "milk yield": 
        "Feed balanced diet and ensure regular vet care.",
    "sugarcane fertilizer": 
        "Apply nitrogen-rich fertilizers for growth.",
    "early pest signs": 
        "Inspect fields and use monitoring traps.",
    "seed treatment": 
        "Treat seeds to prevent diseases before planting.",
    "crop insurance": 
        "Protects from losses due to disasters or pests.",
    "organic crops": 
        "Use natural manure, biopesticides, and organic methods."
  };

  void _sendMessage() {
    String userQuestion = _questionController.text.trim();

    if (userQuestion.isNotEmpty) {
      setState(() {
        _chatMessages.add({"user": userQuestion});

        // Provide a predefined answer or default response
        String answer = _predefinedAnswers[userQuestion] ??
            "Sorry, I don't have an answer for that question. Please try asking something else.";
        _chatMessages.add({"bot": answer});
      });

      _questionController.clear();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ask an Expert'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _chatMessages.length,
              itemBuilder: (context, index) {
                final message = _chatMessages[index];
                final isUser = message.containsKey("user");

                return Align(
                  alignment:
                      isUser ? Alignment.centerRight : Alignment.centerLeft,
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: isUser ? Colors.blue[100] : Colors.grey[300],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Text(
                      isUser ? message["user"]! : message["bot"]!,
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _questionController,
                    decoration: InputDecoration(
                      hintText: "Type your question here...",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _sendMessage,
                  child: Text("Send"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
