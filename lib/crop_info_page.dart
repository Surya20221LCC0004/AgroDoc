import 'package:flutter/material.dart';

class CropInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Crop Information'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Rice', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Rice is one of the most important crops worldwide. It grows in warm, wet conditions.'),
            ),
            ListTile(
              title: Text('Wheat', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Wheat is a cool-season crop. It grows in a wide range of soils.'),
            ),
            ListTile(
              title: Text('Maize', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Maize requires plenty of sunlight and grows in moderately dry conditions.'),
            ),
            ListTile(
              title: Text('Barley', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Barley is a cool-season crop. It is often grown in regions with low rainfall.'),
            ),
            ListTile(
              title: Text('Sugarcane', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Sugarcane thrives in hot climates and is a major source of sugar production.'),
            ),
            ListTile(
              title: Text('Cotton', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Cotton grows well in areas with warm temperatures and moderate rainfall.'),
            ),
            ListTile(
              title: Text('Soybeans', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Soybeans are a high-protein crop grown in warm climates with ample sunlight.'),
            ),
            ListTile(
              title: Text('Peas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Peas are cool-season crops that thrive in well-drained, fertile soils.'),
            ),
            ListTile(
              title: Text('Chickpeas', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Chickpeas are drought-resistant and grow in regions with low rainfall.'),
            ),
            ListTile(
              title: Text('Tomato', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Tomatoes need warm temperatures and plenty of sunlight to grow.'),
            ),
            ListTile(
              title: Text('Potato', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Potatoes grow best in cool climates and are typically planted in spring.'),
            ),
            ListTile(
              title: Text('Onion', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Onions require well-drained soil and grow well in a range of climates.'),
            ),
            ListTile(
              title: Text('Garlic', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Garlic thrives in moderate climates and is typically harvested in summer.'),
            ),
            ListTile(
              title: Text('Cabbage', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Cabbages grow best in cool weather and are often planted in early spring.'),
            ),
            ListTile(
              title: Text('Lettuce', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Lettuce grows in cool, moist climates and requires well-drained soil.'),
            ),
          ],
        ),
      ),
    );
  }
}
