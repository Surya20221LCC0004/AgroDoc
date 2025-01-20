import 'package:flutter/material.dart';

class SoilInfoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Soil Information'),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            ListTile(
              title: Text('Loamy Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Loamy soil is rich in nutrients and has a balanced texture, making it ideal for most plants.'),
            ),
            ListTile(
              title: Text('Sandy Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Sandy soil has large particles and drains quickly, but doesn’t hold nutrients well.'),
            ),
            ListTile(
              title: Text('Clay Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Clay soil has small particles and retains moisture, but can become compacted and hard to work with.'),
            ),
            ListTile(
              title: Text('Peaty Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Peaty soil is rich in organic matter and moisture, making it ideal for certain crops but can be acidic.'),
            ),
            ListTile(
              title: Text('Saline Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Saline soil contains high levels of salt, which can hinder plant growth but can be improved over time.'),
            ),
            ListTile(
              title: Text('Chalky Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Chalky soil is alkaline and tends to be stony, which can affect plant growth unless improved with organic matter.'),
            ),
            ListTile(
              title: Text('Alluvial Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Alluvial soil is deposited by rivers and contains rich minerals, making it highly fertile.'),
            ),
            ListTile(
              title: Text('Black Cotton Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Black cotton soil is rich in minerals and is ideal for growing cotton and other crops.'),
            ),
            ListTile(
              title: Text('Red Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Red soil is rich in iron content and is found in areas with less rainfall, suitable for crops like rice.'),
            ),
            ListTile(
              title: Text('Forest Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Forest soil is found in forested areas and contains a lot of organic material.'),
            ),
            ListTile(
              title: Text('Mountain Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Mountain soil is found in high altitudes, rich in organic matter but often acidic.'),
            ),
            ListTile(
              title: Text('Laterite Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Laterite soil is rich in iron and aluminum, typically found in tropical areas, and is useful for growing crops like rubber.'),
            ),
            ListTile(
              title: Text('Brown Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Brown soil is found in temperate climates and is known for its good fertility and moisture retention properties.'),
            ),
            ListTile(
              title: Text('Vertisol', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Vertisol is a clayey soil that expands when wet and is commonly found in regions with seasonal rainfall.'),
            ),
            ListTile(
              title: Text('Podzol Soil', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              subtitle: Text('Podzol soil is acidic and typically found in cooler climates, making it suitable for forests but challenging for agriculture.'),
            ),
          ],
        ),
      ),
    );
  }
}
