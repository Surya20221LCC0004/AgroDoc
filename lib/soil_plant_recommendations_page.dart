import 'package:flutter/material.dart';

class SoilPlantRecommendationsPage extends StatefulWidget {
  @override
  _SoilPlantRecommendationsPageState createState() =>
      _SoilPlantRecommendationsPageState();
}

class _SoilPlantRecommendationsPageState
    extends State<SoilPlantRecommendationsPage> {
  final List<String> soilTypes = [
    'Loamy',
    'Clay',
    'Sandy',
    'Peaty',
    'Saline',
    'Chalky',
  ];

  String selectedSoilType = 'Loamy';
  List<String> recommendedPlants = [];

  // Sample recommendation function
  List<String> getRecommendations(String soilType) {
    switch (soilType) {
      case 'Loamy':
        return ['Tomato', 'Lettuce', 'Carrot'];
      case 'Clay':
        return ['Rice', 'Barley', 'Wheat'];
      case 'Sandy':
        return ['Cucumber', 'Beans', 'Sunflower'];
      case 'Peaty':
        return ['Cabbage', 'Potato', 'Spinach'];
      case 'Saline':
        return ['Barley', 'Wheat', 'Cabbage'];
      case 'Chalky':
        return ['Broccoli', 'Cauliflower', 'Kale'];
      default:
        return [];
    }
  }

  @override
  void initState() {
    super.initState();
    recommendedPlants = getRecommendations(selectedSoilType);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil-Plant Recommendations'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Select Soil Type',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.green[50],
                boxShadow: [
                  BoxShadow(
                    color: Colors.green.withOpacity(0.2),
                    blurRadius: 5,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: DropdownButton<String>(
                value: selectedSoilType,
                isExpanded: true,
                onChanged: (newValue) {
                  setState(() {
                    selectedSoilType = newValue!;
                    recommendedPlants = getRecommendations(newValue);
                  });
                },
                items: soilTypes.map<DropdownMenuItem<String>>((String soil) {
                  return DropdownMenuItem<String>(
                    value: soil,
                    child: Text(
                      soil,
                      style: TextStyle(fontSize: 18, color: Colors.green[700]),
                    ),
                  );
                }).toList(),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Recommended Plants for $selectedSoilType Soil:',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green[700],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: recommendedPlants.length,
                itemBuilder: (context, index) {
                  return Card(
                    elevation: 8,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    color: Colors.green[50],
                    child: ListTile(
                      contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                      title: Text(
                        recommendedPlants[index],
                        style: TextStyle(fontSize: 18, color: Colors.green[800]),
                      ),
                      leading: Icon(
                        Icons.nature,
                        color: Colors.green[700],
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
